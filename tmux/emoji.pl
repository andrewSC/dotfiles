#!/usr/bin/perl
use Math::Round;

binmode STDOUT, ":encoding(UTF-8)";

print chr(round(rand(79)) + 128513);
