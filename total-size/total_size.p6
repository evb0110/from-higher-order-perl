#!/usr/bin/perl6

sub total_size($top) {
  say $top;
  my $total = $top.s;
  return $total if $top.f;

  for $top.dir -> $file {
    next if $file eq '.' or $file eq '..';
    $total += total_size($file);
  }
  return $total;
}

my $top = ".".IO;
say total_size($top);
