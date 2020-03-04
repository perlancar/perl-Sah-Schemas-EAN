package Sah::Schema::ean13;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'EAN-13 number',
    description => <<'_',

Nondigits [^0-9] will be removed during coercion.

Checksum digit must be valid.

_
    match => '\A[0-9]{13}\z',
    'x.perl.coerce_rules' => ['From_str::to_ean13'],

    examples => [
        {value=>'5-901234-123457', valid=>1, validated_value=>'5901234123457'},
        {value=>'123-4567890-123', valid=>0, summary=>'Invalid checkdigit'},
        {value=>'1234567890', valid=>0, summary=>'Less than 13 digits'},
        {value=>'12345678901234', valid=>0, summary=>'More than 13 digits'},
    ],
}, {}];

1;
# ABSTRACT:
