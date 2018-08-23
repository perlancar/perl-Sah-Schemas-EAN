package Sah::Schema::ean8;

# DATE
# VERSION

our $schema = [str => {
    summary => 'EAN-8 number',
    description => <<'_',

Nondigits [^0-9] will be removed during coercion.

Checksum digit must be valid.

_
    match => '\A[0-9]{8}\z',
    'x.perl.coerce_rules' => ['str_to_ean8'],
}, {}];

1;
# ABSTRACT:
