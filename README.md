Description
===========
This cookbook installs and configures R.  It also contains an
r_package provider which can be used in recipes to install R packages
from CRAN.

Requirements
============

* **apt**: Required for APT installation.
* **build-essential**: Required for source installation.

Attributes
==========

* `node['r']['install_method']`: Specifies any of "source", "package" 
  or "dist" install method.

* `node['r']['cran_mirror]`: Used by the Rprofile.site template
to set the system-wide default CRAN mirror.

* `node['r']['version']`: The R version to install.  When using Apt, set
to nil to always get the latest version.

* `node['r']['checksum']`: SHA256-sum of the R source package.

* `node['r']['config_opts']`: Options to pass to R's configure
  script. Source install only.

* `node['r']['dist']`: Describes a dependency list of a given R version in 
  terms of packages, used only if *install_method* is set to "dist" The value
  is a hash of hashes, where the top level hash contains versions as keys, the
  associated value is a hash of package names and versions.

Helper scripts for *dist* install method
========================================

There are two scripts provided to help the maintenance of "dist" installation method:

* `misc/generate_r_dep_attr_hash.sh`: used to generate a dependency list of packages for a given version. Usage scenario is: 1. install the desired version of R using the distribution's package manager, 2. run the script. Uses *apt* to generate the result

* `misc/generate_r_dep_serverspec.sh`: used to generate a *ServerSpec* test case that can be used to verify the installation of the packages e.g. via *kitchen*

# Providers


## r_package

The r_package provider can be used to manage packages available in the
CRAN repository.  Currently to use this provider, your default CRAN
mirror must be set.  The default recipe sets this for you.

### Actions

* `:install`: Installs the package from CRAN.  Does nothing if the
  package is already installed. [default]

* `:upgrade`: Upgrades the package to the latest version.  Currently
  this will re-install the package even if it is at the latest
  version.

* `:remove`: Removes the package if it is installed.

## Examples

Install a package:

    r_package "snow"

Remove a package:

    r_package "snow" do
        action :remove
    end


Usage
=====
Add the default recipe to the `run_list` of a Node or Role.
