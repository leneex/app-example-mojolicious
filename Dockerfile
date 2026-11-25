FROM perl:5.44-slim

# curl and make are already in this image: the platform needs curl for the health check, and cpanm needs make to build modules

WORKDIR /app

# Dependencies first: while cpanfile does not change, this layer comes from the cache
COPY cpanfile .
RUN cpanm --notest --installdeps . && rm -rf /root/.cpanm

COPY . .

EXPOSE 3000

# Production mode: on an error, visitors do not see the debug page with source code
ENV MOJO_MODE=production

# The platform passes the port in the PORT variable; 3000 by default.
# exec makes prefork the main process, so it receives the stop signal itself
CMD exec ./app.pl prefork -l "http://*:${PORT:-3000}"
