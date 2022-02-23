package DataAPIExtendSearch::Plugin;
use strict;

use MT::DataAPI::Endpoint::Common;

sub data_api_content_data_extend {
    my ( $app,  $endpoint )     = @_;
    my ( $site, $content_type ) = context_objects(@_) or return;

    my $blog_id         = $site->id;
    my $content_type_id = $content_type->id;

    my $limit;
    my $offset;

    my $param_limit  = ( $app->param('limit')  || 20 ) + 0;
    my $param_offset = ( $app->param('offset') || 0 ) + 0;

    my $param_limit_per_page = ( $app->param('limitPerPage') || 0 ) + 0;
    my $param_page           = ( $app->param('page')         || 1 ) + 0;
    if ( $param_limit_per_page > 0 ) {
        $limit  = $param_limit_per_page;
        $offset = ( $param_page - 1 ) * $param_limit_per_page;
    }
    else {
        $limit  = $param_limit;
        $offset = $param_offset;
    }

    my $param_sort_field_name       = $app->param('sortFieldName');
    my $param_sort_field_name_order = $app->param('sortFieldNameOrder') || 'descend';

    my %terms = ( blog_id => $blog_id, content_type_id => $content_type_id );
    my %args  = ( limit   => $limit,   offset          => $offset );

    # Sort by a content field
    my $cf_sort = MT->model('cf')
        ->load( { blog_id => $blog_id, content_type_id => $content_type_id, name => $param_sort_field_name } );
    if ($cf_sort) {
        my $data_type = MT->registry('content_field_types')->{ $cf_sort->type }{data_type};
        my $join      = MT->model('cf_idx')->join_on(
            'content_data_id',
            undef,
            {   sort      => 'value_' . $data_type,
                direction => $param_sort_field_name_order,
                alias     => 'cf_idx_' . $cf_sort->id,
                type      => 'left',
                condition => {
                    content_data_id  => \'= cd_id',
                    content_field_id => $cf_sort->id,
                },
            }
        );
        push @{ $args{joins} }, $join;
    }

    # Login Check
    if ( !$app->user->id ) {
        $terms{status} = MT::ContentStatus::RELEASE();
    }

    my @items = MT->model('content_data')->load( \%terms, \%args );
    my $count = MT->model('content_data')->count( \%terms );

    my $max_page = POSIX::ceil( $count / $param_limit_per_page ) if $param_limit_per_page > 0;

    return {
        totalResults => $count + 0,
        paginate     => $param_limit_per_page == 0
        ? undef
        : { currentPage => $param_page,
            prevPage    => $param_page > 1              ? $param_page - 1 : undef,
            nextPage    => $param_page + 1 <= $max_page ? $param_page + 1 : undef,
            maxPage     => $max_page,
            limit       => $limit,
            offset      => $offset,
        },
        items => \@items,
    };
}

1;
