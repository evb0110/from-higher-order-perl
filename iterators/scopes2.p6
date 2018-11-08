my %country;
my Hash @array;

%country{ 'country' } = 'France';
@array.push({%country});
%country{ 'country' } = 'Germany';
@array.push({%country});

.say for @array;
