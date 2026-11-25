# Mojolicious

Example [Mojolicious](https://mojolicious.org/) app. Mojolicious is a real-time web framework for Perl. This example is built from its own Dockerfile.

## Deploy settings

| Field | Value |
| --- | --- |
| Build | Dockerfile |
| Project directory | `/` |
| Application port | `3000` |
| Health check path | `/` |

## <a name="dev"></a>Run locally

### Build and run with Docker

```bash
# build docker image
docker build -t app-example-mojolicious .

# run container on port 3000
docker run -d -p 3000:3000 app-example-mojolicious
```

### Run without Docker

Requires Perl 5.16 or later:

```bash
# install dependencies
cpanm --installdeps .

# run the app in development mode
morbo app.pl
```
