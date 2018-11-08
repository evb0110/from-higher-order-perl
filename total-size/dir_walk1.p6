#!/usr/bin/perl6

sub dir_walk($top, $code) {
  $code($top);
  return unless $top.d;
  for $top.dir.sort -> $file {
    dir_walk($file, $code);
  }
}

my $top = ".".path;
my $output = {
  printf "%6d %s\n", $_.s, $_ 
      if $_ ~~ /\.p6$/
}

dir_walk($top, $output);
