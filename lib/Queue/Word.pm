package Queue::Word;

use strict;
use warnings;

use base 'Queue';

sub enqueue {
    my ($self, $item) = @_;
    die "can not enqueue words, not '$item'"
    unless $item =~ m/^[A-Z]+$/ix;
    push @$self, $item;
}

1;
