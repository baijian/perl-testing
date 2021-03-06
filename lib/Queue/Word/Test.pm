package Queue::Word::Test;

use base 'Queue::Test';

use Queue::Word;
use Test::More;
use Test::Exception;

sub setup_queues : Test(setup => 2) {
    my ($self) = @_;
    $self->{empty}      = Queue::Word->new();
    $self->{twoitems}   = Queue::Word->new(qw( howdy bonjour));
    isa_ok( $self->{$_}, 'Queue::Word' ) for qw( empty twoitems );
}

sub check_only_words : Test(5) {
    my ($self) = @_;
    lives_ok { $self->{empty}->enqueue('wassup') } "can queue words";
    lives_ok { $self->{empty}->enqueue('HeLlO') } "case does not matter";
    dies_ok  { $self->{empty}->enqueue(1981) } "can not enqueue integers";
    dies_ok  { $self->{empty}->enqueue(10.1) } "can not enqueue decimal";
    dies_ok  { $self->{empty}->enqueue('Transzorp Diode') } "can not enqueue names of cyborgs";
}

1;
