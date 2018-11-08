sub hanoi($n, $start, $end, $extra) {
  if $n == 1 {
    say "Move disk #1 from $start to $end.";
   } else {
    hanoi($n-1, $start, $extra, $end);
    say "Move disk #$n from $start to $end.";
    hanoi($n-1, $extra, $end, $start);
  }
}

hanoi(4, 'A', 'C', 'B');
