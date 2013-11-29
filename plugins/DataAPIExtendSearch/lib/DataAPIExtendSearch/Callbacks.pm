package DataAPIExtendSearch::Callbacks;
use strict;

sub data_api_pre_load_filtered_list_entry {
  my ($cb, $app, $filter, $options) = @_;

  return 1 if exists $options->{total};
  for my $key (qw(tag category)) {
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

1;
