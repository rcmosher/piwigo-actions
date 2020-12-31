# piwigo-actions
Version 0.1
Execute actions on your Piwigo site from the command line.

## Supported Actions
* Login
	* `piwigo.login.sh <piwigo-base-url> <username> <password> <cookie-file-path>`
* Logout
	* `piwigo.logout.sh <piwigo-base-url> <cookie-file-path>`
* Synchronize - Performs Tools > Synchronize in the admin section of your Piwigo site. This requires having already uploaded files to the galleries directory on your piwigo server. See the [How To Add Pictures ... by FTP](https://piwigo.org/doc/doku.php?id=user_documentation:learn:add_picture) documentation, or navigate to Photos > Add > FTP + Synchronization on your piwigo site for more documentation.
	* `piwigo.sync.sh <piwigo-base-url> <cookie-file-path> [<site-id=1>] [<simulate=0>]`

### Paramter Notes
* `piwigo-base-url`: the web address of your piwigo site with leading 'https://'.
* `site-id`: the ID for your site. This will default to 1, which is typical for a single piwigo site on a server. You can find this by using the F12 tools in your browser to inspect a Synchornization request.
* `simulate`: Set to 1 with synchronization action to only simulate the synchronization and not actually perform it. The default is to synchronize.

## Future Actions
* Generate missing checksums: These are generally missing after synchronization. Ideally piwigo would just do this on synchronization, but for now a script will need to handle this.

## Dependencies
* A [piwigo](https://piwigo.org/) site (of course)
* bash (of course)
* [curl](https://curl.se/)

## Related Projects
* [piwigo-scripts](https://github.com/pommes-frites/piwigo-scripts) - has more available actions, but build for an older version of the piwigo site.
* [piwigo import tree](https://piwigo.org/ext/extension_view.php?eid=606) - Send a directory of pictures to piwigo.
