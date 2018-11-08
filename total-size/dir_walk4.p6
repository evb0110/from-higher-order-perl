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

multi sub file($file) {
  return ($file.basename, $file.s);
}

multi sub file($dir, @subdirs) {
  my %new_hash;
  for @subdirs {
    my ($subdir_name, $subdir_structure) = $_;
    %new_hash{$subdir_name} = $subdir_structure;
  }
  return %($dir.basename, %new_hash);
}

my $top = "bak".path;

say dir_walk($top, &file);
