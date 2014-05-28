#orgdc

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with Org-Dc](#setup)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

This module installs org-dc (develo[ped by epimorphics) from git into Tomcat 7 and configures it with either a custom configuration or
the example configuration distributed with the binaries.

##Module Description


##Setup

###What org-dc affects

####Installs
* /opt/org-dc configuration files
* /var/log/org-dc logging directory


###Setup Requirements **OPTIONAL**

You need to have a working installation of tomcat 7. You can use https://github.com/SilexConsulting/puppet-tomcat
  
###Beginning with org-dc

 To install org-dc with the default configuration, you only need to include the module


 include orgdc


##Usage


 If you would like to include your own configuration, you can specifiy it as follows:

 class { 'orgdc':
    source_dir => "puppet:///modules/my_conf_module/",
  }

##Reference


##Limitations

Works with debian based distributions and installs org-dc

##Development

Contributions welcomed,

##Release Notes/Contributors/Etc

see changelog
