my @words = (
  '_' X[&join] 
      ((^1250) X (flat 'a'..'e','A'..'E'))
            ).pick(*);

my %alphabet;
for ("a".."z") {
    state $i = 0;
    %alphabet{$_.uc} = $i++;
    %alphabet{$_}    = $i++;
}

.say for sort &sorty, @words;

sub sorty($a) {
    my ($a1, $a2) = $a.split('_');
    return $a1 * 1000 + %alphabet{$a2};
}

my %cache;

sub sortful($a, $b) {
    my $key = $a ~ $b;
    return %cache{$key} if defined %cache{$key};
    my ($a1, $a2) = $a.split('_');
    my ($b1, $b2) = $b.split('_');
    
    %cache{$key} =
      $a1 <=> $b1
      || $a2.lc leg $b2.lc
      || $a2    leg $b2;
    return %cache{$key};

}
