my @output;
my @a;
for ^10 {
    @a = ($_, $_ * 2);
    my @temp = @a;
    push @output, @temp;
}

.say for @output;
