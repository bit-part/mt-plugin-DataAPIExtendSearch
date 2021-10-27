package DataAPIExtendSearch::Callbacks;
use strict;

sub data_api_pre_load_filtered_list_entry {
  my ($cb, $app, $filter, $options) = @_;

  return 1 if exists $options->{total};
  if (my $date_type = $app->param('date_type')) {
    my @allow_date_type = ('authored_on', 'created_on', 'modified_on', 'unpublished_on');
    if (grep {$_ eq $date_type} @allow_date_type) {
      # date_type=authored_on&from=YYYY-MM-DD&to=YYYY-MM-DD
      if ($app->param('from') =~ /\d{4}-\d{2}-\d{2}/ and $app->param('to') =~ /\d{4}-\d{2}-\d{2}/) {
        $filter->append_item({
          'type' => $date_type,
          'args' => {
            'days' => '',
            'from' => $app->param('from'),
            'option' => 'range',
            'origin' => '',
            'to' => $app->param('to'),
          },
        });
      }
      # date_type=authored_on&days=N
      elsif ($app->param('days') =~ /\d+/) {
        $filter->append_item({
          'type' => $date_type,
          'args' => {
            'days' => $app->param('days'),
            'from' => '',
            'option' => 'days',
            'origin' => '',
            'to' => '',
          },
        });
      }
      # date_type=authored_on&before=YYYY-MM-DD
      elsif ($app->param('before') =~ /\d{4}-\d{2}-\d{2}/) {
        $filter->append_item({
          'type' => $date_type,
          'args' => {
            'days' => '',
            'from' => '',
            'option' => 'before',
            'origin' => $app->param('before'),
            'to' => '',
          },
        });
      }
      # date_type=authored_on&after=YYYY-MM-DD
      elsif ($app->param('after') =~ /\d{4}-\d{2}-\d{2}/) {
        $filter->append_item({
          'type' => $date_type,
          'args' => {
            'days' => '',
            'from' => '',
            'option' => 'after',
            'origin' => $app->param('after'),
            'to' => '',
          },
        });
      }
      # date_type=authored_on&future=1
      elsif ($app->param('future') == 1) {
        $filter->append_item({
          'type' => $date_type,
          'args' => {
            'days' => '',
            'from' => '',
            'option' => 'future',
            'origin' => '',
            'to' => '',
          },
        });
      }
      # date_type=authored_on&past=1
      elsif ($app->param('past') == 1) {
        $filter->append_item({
          'type' => $date_type,
          'args' => {
            'days' => '',
            'from' => '',
            'option' => 'past',
            'origin' => '',
            'to' => '',
          },
        });
      }
    }
  }
  for my $key (qw(tag category author_name basename)) {
    if (my $value = $app->param($key)) {
      $filter->append_item({
        'type' => $key,
        'args' => {
          'string' => $value,
          'option' => 'contains',
        }
      });
    }
  }
}

sub data_api_pre_load_filtered_list_content_data {
    my ($cb, $app, $filter, $options) = @_;

    return 1 if exists $options->{total};
    if (my $date_type = $app->param('date_type')) {
        my @allow_date_type = ('authored_on', 'created_on', 'modified_on', 'unpublished_on');
        if (grep {$_ eq $date_type} @allow_date_type) {
            # date_type=authored_on&from=YYYY-MM-DD&to=YYYY-MM-DD
            if ($app->param('from') =~ /\d{4}-\d{2}-\d{2}/ and $app->param('to') =~ /\d{4}-\d{2}-\d{2}/) {
                $filter->append_item({
                    'type' => $date_type,
                    'args' => {
                        'days' => '',
                        'from' => $app->param('from'),
                        'option' => 'range',
                        'origin' => '',
                        'to' => $app->param('to'),
                    },
                });
            }
            # date_type=authored_on&days=N
            elsif ($app->param('days') =~ /\d+/) {
                $filter->append_item({
                    'type' => $date_type,
                    'args' => {
                        'days' => $app->param('days'),
                        'from' => '',
                        'option' => 'days',
                        'origin' => '',
                        'to' => '',
                    },
                });
            }
            # date_type=authored_on&before=YYYY-MM-DD
            elsif ($app->param('before') =~ /\d{4}-\d{2}-\d{2}/) {
                $filter->append_item({
                    'type' => $date_type,
                    'args' => {
                        'days' => '',
                        'from' => '',
                        'option' => 'before',
                        'origin' => $app->param('before'),
                        'to' => '',
                    },
                });
            }
            # date_type=authored_on&after=YYYY-MM-DD
            elsif ($app->param('after') =~ /\d{4}-\d{2}-\d{2}/) {
                $filter->append_item({
                    'type' => $date_type,
                    'args' => {
                        'days' => '',
                        'from' => '',
                        'option' => 'after',
                        'origin' => $app->param('after'),
                        'to' => '',
                    },
                });
            }
            # date_type=authored_on&future=1
            elsif ($app->param('future') == 1) {
                $filter->append_item({
                    'type' => $date_type,
                    'args' => {
                        'days' => '',
                        'from' => '',
                        'option' => 'future',
                        'origin' => '',
                        'to' => '',
                    },
                });
            }
            # date_type=authored_on&past=1
            elsif ($app->param('past') == 1) {
                $filter->append_item({
                    'type' => $date_type,
                    'args' => {
                        'days' => '',
                        'from' => '',
                        'option' => 'past',
                        'origin' => '',
                        'to' => '',
                    },
                });
            }
        }
    }
}

1;
