#!/usr/bin/perl6 
sub dir_walk($top, $filefunc) {
  return $filefunc($top) unless $top.d;
  my @results;
  for $top.dir -> $file {
    @results.append: 
      dir_walk($file, $filefunc);
  }
  return $filefunc($top, @results);
}

multi sub file($file) {
  return $file;
}

multi sub file($dir, @subdirs) {
  return @subdirs;
}

my $top = ".".path;

.say for dir_walk($top, &file);
