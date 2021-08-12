#!/bin/sh

set -e

/bin/sed -i -e "s@^#* *archive_command *=.*\$@archive_command = '/usr/bin/pgbackrest archive-push %p'@" /var/lib/postgresql/data/postgresql.conf
/bin/sed -i -e "s@^#* *archive_mode *=.*\$@archive_mode = on@" /var/lib/postgresql/data/postgresql.conf

/usr/bin/pgbackrest stanza-create
