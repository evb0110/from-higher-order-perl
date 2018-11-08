my @treasures = 
    (prompt 
    'Введите монеты > '
    ).words>>.Numeric
    .sort
    ;
my $target = prompt 'Введите сумму > ';

sub find_share($target, @treasures) {

    return [] if $target == 0;

    return if $target < 0 
        || @treasures.sum == 0;

    my ($first, @rest) = @treasures;

    my @solution = 
        find_share($target - $first,
                   @rest);

    return [$first, |@solution]
        if @solution>>.defined.all;

    return find_share($target, @rest);

}

my @solution = find_share($target, @treasures);

unless @solution>>.defined.all {
    say join '', "No solution",
             " for \$target = $target";
    exit;
}

my $solution is default(0);
$solution = reduce 
    {$^a ~ ' + ' ~ $^b}, 
    @solution 
      if @solution > 0
    ;

say $target, ' = ', 
    $solution
    ;
