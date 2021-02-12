
1. helm  - RnDnet scheduler installation and managment with helm


Install
-------

1. Change directory to helm and run `bash make-installer-instance.sh` and input:
   - Scheduler name
   - Target directory for new rndnet scheduler installer instance.
   - Kubernetes namespace
   - RnDnet server url and port
   - Scheduler user name
   - Scheduler user key file
   - Scheduler params (default image, gpu type and other)
2. If you have RnDnet server helm source and you want use them then say "n" on question "Install from helm package (y) or from helm sources [any]?".
3. Go to scheduler target directory

4. Run  `./install-dry-test.sh` for check settings.

5. Run `bash install.sh`

Uninstall
---------

Run `bash uninstall.sh`


2. plain - RnDnet scheduler manual installation and managment

