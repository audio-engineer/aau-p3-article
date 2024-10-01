add_cus_dep( 'acn', 'acr', 0, 'makeglossaries' );
add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
$clean_ext .= " acr acn alg glo gls glg";

sub makeglossaries {
    my ( $base_name, $path ) = fileparse( $_[0] );
    my @args = ( "-q", "-d", $path, $base_name );

    if ($silent) { unshift @args, "-q"; }

    return system "makeglossaries", "-d", $path, $base_name;
}

$lualatex = 'lualatex --file-line-error --halt-on-error --interaction=nonstopmode --synctex=1 --shell-escape %O %S';
$pdf_mode = 4;
$out_dir  = '../out/';
