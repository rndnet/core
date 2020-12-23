
1. helm  - RnDnet server installation and managment with helm


Install
-------

1. Run `bash make-helm-instance.sh` and set values for new rndnet server managment instance:
  - New server name
  - Target dir
  - Kubernetes Namespace
  - Cloud Database host
  
  If you need in nginx ingress controller then say "y" on question "Create nginx ingress controller installer for this server [y/n]?"
  and set values
  - Internet host name
  - Internet external ip
  - Internet external port
  - Certificate
  
  If you need in script for certificate secret creation say "y" on question "Create nginx cert installer? [y/n]?"
  and set values:
  - Fullchain cer full file path
  - Certificate key full file path


2. Go to this target directory
3. Modify files with valid settings
    - install.sh - database connection rules, rabbitmq connection string, mail server params and others.
    - values.yaml - host aliaces and multiline database connection rules

5. Run  `./install-dry-test.sh` for check settings.

6. If you created nginx cert installer than:
   `bash nginx/cert/add-secret.sh`
  
7. If you created nginx installer than:
   - `cd nginx`
   - `bash install.sh`

8. Run `bash install.sh`

Uninstall
---------

1. If you created nginx cert installer than:
   `bash nginx/cert/rm-secret.sh`
  
2. If you created nginx installer than:
   - `cd nginx`
   - `bash uinstall.sh`

3. Run `bash uninstall.sh`


2. plain - RnDnet server manual installation and managment

