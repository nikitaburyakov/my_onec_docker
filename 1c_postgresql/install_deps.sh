
#!/bin/bash
DIR_LIBS=$(ls -d $DISTR_DIR/pg_deps* | grep 'tar\.gz' | xargs tar -xf | ls -d $DISTR_DIR/pg_deps/libs*| grep libs15)

REGEX="(?:libicu66|netbase).*"
ls -d $DIR_LIBS/* | grep -iP "$REGEX"|xargs apt install -y

