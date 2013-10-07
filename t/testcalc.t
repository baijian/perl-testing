#!/usr/bin/env perl
#Testing Interactive Programs

use strict;
use warnings;

use Test::More tests => 7;
use Test::Expect;

expect_run(
    command => "$^X simplecalc.pl",
    prompt  => '> ',
    quit    => "\n",
);

expect('add 1 2 3', '1 + 2 + 3 = 6', 'dding three numbers');
expect_send('subtract 1 2 3', 'subtract should work');
expect_is('1 - 2 - 3 = -4', '.. producing good result');
expect_send('weird magic', 'not dying on bad input');
expect_like(qr/Unknown command 'weird/, '... but giving an error');

