#!/usr/bin/perl
use strict;
use warnings;

use lib '../lib';
use Test::More tests => 2;
use Test::Between;

is_between( 'b', 'a', 'c', 'simple alphabetical comparison');
is_between( 2, 1, 3, 'simple numeric comparison');
#is_between( "two", 1, 3, 'mixed comparison')
