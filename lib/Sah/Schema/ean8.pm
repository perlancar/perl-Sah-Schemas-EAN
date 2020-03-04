package Sah::Schema::ean8;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'EAN-8 number',
    description => <<'_',

Nondigits [^0-9] will be removed during coercion.

Checksum digit must be valid.

_
    match => '\A[0-9]{8}\z',
    'x.perl.coerce_rules' => ['From_str::to_ean8'],

    examples => [
        {value=>'9638-5074', valid=>1, validated_value=>'96385074'},
        {value=>'12345678', valid=>0, summary=>'Invalid checkdigit'},
        {value=>'1234567', valid=>0, summary=>'Less than 8 digits'},
        {value=>'123456789', valid=>0, summary=>'More than 8 digits'},
    ],
}, {}];

1;
# ABSTRACT:
