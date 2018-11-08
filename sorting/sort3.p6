my @words = (
  '_' X[&join] 
      ((^2250) X (flat 'a'..'k','A'..'K'))
            ).pick(*);
say 'picked';

my %alphabet;
for ("a".."z") {
    state $i = 0;
    %alphabet{$_.uc} = $i++;
    %alphabet{$_}    = $i++;
}

.say for sort &sorty, @words;
say "-" x 16, "\n", 
    "{@words.elems} elements";

sub sorty($a) {
    my ($a1, $a2) = $a.split('_');
    return $a1 * 1000 + %alphabet{$a2};
}
