sh scripts to take snapshots of ZeroNet sites

## 0mesnap

I wrote this script to backup ZeroMe hubs.
But it can be used to backup an arbitraril list of ZeroNet sites.

### Install

#### With `make`


    git clone https://github.com/weakish/0net-snapshot.git
    cd 0net-snapshot
    make

Makefile is compatible with Gnu Make and BSD Make.

#### With `basher`

    basher install weakish/0net-snapshot

### Usage

Specify zeronet data directory in `$ZERONETDATADIR` environment variable.
Make sure there is `hub_seeding.lst` file in `$ZERONETDATADIR`.
`hub_seeding.lst` is a list of ZeroNet site addresses,
one address/ID per line.

    0mesnap

You can edit a crontab to take a snapshot, say, per hour:

```crontab
@hourly /usr/local/bin/0mesnap
```

## 0netsnap

There is an **untested** `bin/0netsnap` script in the repository.
It can backup whole ZeroNet data directory with inotify.

## License

0BSD