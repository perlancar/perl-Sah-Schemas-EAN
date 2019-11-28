package Data::Sah::Coerce::perl::To_str::From_str::to_ean13;

# AUTHOR
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 4,
        summary => 'Check and format EAN-13 number from string',
        might_fail => 1,
        prio => 50,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = "!ref($dt)";
    $res->{modules}{"Algorithm::CheckDigits"} = 0;
    $res->{modules}{"Algorithm::CheckDigits::M10_004"} = 0;
    $res->{expr_coerce} = join(
        "",
        "do { my \$digits = $dt; \$digits =~ s/[^0-9]//g; ",
        "my \$res; ",
        "{ ",
        "  if (length \$digits != 13) { \$res = ['EAN-13 must have 13 digits']; last } ",
        "  unless (Algorithm::CheckDigits::CheckDigits('ean')->is_valid(\$digits)) { \$res = ['Invalid checksum digit']; last } ",
        "  \$res = [undef, \$digits]; ",
        "} ",
        "\$res }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$
