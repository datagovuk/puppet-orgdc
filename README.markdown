# puppet-orgdc

## Overview

This module installs an 'organogram server' suitable for storing organogram data, making it available with Sparql and RESTful APIs and a javascript viz of it.

The elements are:

  * 'org-dc' - Epimorphics' data conversion tool (Organogram CSV to RDF)
      - Code is: https://github.com/epimorphics/org-dc/
      - But what is actually installed is:
         * code compiled as a WAR: /var/lib/tomcat7/webapps/ROOT.war
         * the 'templates' which define the conversion: /opt/org-dc
  * Fuseki - triple store with Sparql endpoint
      - JAR
  * UK Organogram data (Fuseki triples)
      - downloaded from https://s3-eu-west-1.amazonaws.com/organograms/RELEASE-0.1/ORG-DB-xx-fix.tgz
      - extracted to /var/lib/fuseki/databases/ORG-DB
  * Elda (LDA) - builds an API on top of a Sparql endpoint
  * Apache site config - reference.data.gov.uk

## Setup

### Installation

* /opt/org-dc configuration files
* /var/log/org-dc logging directory

To make Fuseki a service:

   sudo cp puppet-orgdc/files/etc/init.d/fuseki /etc/init.d/fuseki

### Setup Requirements **OPTIONAL**

You need to have a working installation of tomcat 7. You can use https://github.com/SilexConsulting/puppet-tomcat
  
### Beginning with org-dc

To install org-dc with the default configuration, you only need to include the module:

 include orgdc


## Usage

If you would like to include your own org-dc configuration (rather than organograms), you can specify it as follows:

 class { 'orgdc':
    source_dir => "puppet:///modules/my_conf_module/",
  }

## Limitations

Works with Debian-based distributions and installs org-dc

## Copyright & Licence

Development of this repo has so far been under contract to Cabinet Office: noels, djotto, j420n, davidread. These commits are Crown Copyright 2015.

This repo is released under the Apache License, Version 2.0 - see LICENCE file.

Other contributions are welcome.

