# Notes before using
This is to demonstrate how to use terraform to create server certificates. You still need to make sure you have a
process for carefully handling your certificates, including understanding that your .tfstate will contain the values of
these keys.

# Overview
How-to for setting up a Certificate Authority (CA) and a server certificate signed by that authority using terraform.

This should be used primarily for dev-testing. With some hardening, it could be used for internal-only applications.

This won't work with clients that you don't control without lots of warnings -- eg. in most web browsers.


