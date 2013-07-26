# Puppet module: puppet

This is my personal puppet module to manage puppet clients and their versions.
It install puppet packages and set up the client cron task for puppet runs.

## Dependencies

* Debian based systems get their apt repository over the puppet module
  'apt' from puppetlabs (https://github.com/puppetlabs/puppetlabs-apt). You need
  to load or include the class 'apt' first, before you can use the class apt
  ressources.

## Author

Markus "bionix" Rekkenbeil

## Supported platforms:

* Debian
* Ubuntu
* Redhat
* CentOS
* Fedora

## LICENSE

* See license file 'LICENSE'

## ToDo

* Rspecs
* Travis
