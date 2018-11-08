sub fib {
  my $month = @_.shift;
  if $month < 2 { 
    1; 
   } else {
    fib($month-1) + fib($month-2);
  }
}

say fib(27);
