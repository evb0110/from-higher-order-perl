sub f { $^x ** 2 }

sub f-it {
    my $func = $^f;
    my $num  = $^n;
    return sub {
        return $func($num++);
    }
}

my $a = f-it(&f, 5);
say $a() for (^20);
