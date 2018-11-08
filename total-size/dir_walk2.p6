#!/usr/bin/perl6

sub dir_walk($top, $filefunc, $dirfunc) {
  return $filefunc($top) unless $top.d;
  my @results;
  for $top.dir -> $file {
    @results.push: 
      dir_walk($file, $filefunc, $dirfunc);
  }
  return $dirfunc($top, @results);
}

my $file_size = { $_.s }

my $dir_size = -> $dir, @res  {
  my $total = $dir.s;
  $total += $_ for @res;
  $total;
}

my $top = ".".path;

say dir_walk($top, $file_size, $dir_size);
