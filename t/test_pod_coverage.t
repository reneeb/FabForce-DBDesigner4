#!/usr/bin/perl

use strict;
use warnings;
use Test::More;

eval "use Test::Pod::Coverage 1.00";
plan skip_all => "Test::Pod::Coverage 1.00 required" if $@;
all_pod_coverage_ok();
