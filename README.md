# SlackBuilds for Slackware-current by GDT

Repository for Slackware Current packages.

Each directory contains everything (SlackBuild script, slack-desc file, plus all possible patch) you'll need when you want to build the packages yourself.

## Download

Source the `.info` file:

```console
source package.info
```

Download source code:

```console
curl -JOL $DOWNLOAD
```

or

```console
wget [--no-check-certificate] [--content-disposition] $DOWNLOAD
```

**NOTE**: wget, with some servers, doesn't set the correct filename

## Build

To build execute the `.SlackBuild` script:

```console
sh program.SlackBuild
```

This command builds a package which will be created in the `$OUTPUT` (default `/tmp`) directory.

## License

All scrips are released under the GPL License.
