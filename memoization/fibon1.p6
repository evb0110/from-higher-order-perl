say "$_: {fib($_)}" for ^1001;

sub fib {
    state @cache;
    my $n = @_.shift;
    return @cache[$n] if defined @cache[$n];
    if $n < 2 {
        @cache[$n] = $n;
    } else {
        @cache[$n] = fib($n-1)+fib($n-2);
    }
    return @cache[$n];
}
