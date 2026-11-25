#!/usr/bin/env perl
use Mojolicious::Lite;

get '/' => sub {
    my $c = shift;
    $c->render(
        template     => 'index',
        perl_version => sprintf('%vd', $^V),
        mojo_version => $Mojolicious::VERSION,
    );
};

app->start;

__DATA__

@@ index.html.ep
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Mojolicious</title>
</head>
<body>
  <h1>Hello world</h1>
  <p>Perl <%= $perl_version %></p>
  <p>Mojolicious <%= $mojo_version %></p>
</body>
</html>
