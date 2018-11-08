my @words = (
  '_' X[&join] 
      ((^1250) X (flat 'a'..'e','A'..'E'))
            ).pick(*);

.say for sort &sortful, @words;

sub sortful($a, $b) {
   my ($a1, $a2) = $a.split('_');
   my ($b1, $b2) = $b.split('_');
   
   $a1 <=> $b1
   || $a2.lc leg $b2.lc
   || $a2    leg $b2;

}
