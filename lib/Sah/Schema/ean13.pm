package Sah::Schema::ean13;

# DATE
# VERSION

our $schema = [str => {
    summary => 'EAN-13 number',
    description => <<'_',

Nondigits [^0-9] will be removed during coercion.

Checksum digit must be valid.

_
    match => '\A[0-9]{13}\z',
    'x.perl.coerce_rules' => ['str_ean13'],
}, {}];

1;
# ABSTRACT:
