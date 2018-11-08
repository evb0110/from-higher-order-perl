#!/usr/bin/perl6 
sub dir_walk($top, $filefunc) {
  return $filefunc($top) unless $top.d;
  my @results;
  for $top.dir -> $file {
    @results.push: 
      dir_walk($file, $filefunc);
  }
  return $filefunc($top, @results);
}

multi sub file_size($file) { $file.s }

multi sub file_size($dir, @res)  {
  my $total = $dir.s;
  $total += $_ for @res;
#   printf "%6d %s\n", $total, $dir;
  return $total;
}

my $top = ".".path;

say dir_walk($top, &file_size);
