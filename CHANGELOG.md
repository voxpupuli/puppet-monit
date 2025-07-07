# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v3.0.0](https://github.com/voxpupuli/puppet-monit/tree/v3.0.0) (2024-08-15)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v3.0.0...v3.0.0)

**Breaking changes:**

- Drop Ubuntu 18.04 support [\#54](https://github.com/voxpupuli/puppet-monit/pull/54) ([zilchms](https://github.com/zilchms))
- Drop support for puppetlabs-firewall \<5.0.0 [\#51](https://github.com/voxpupuli/puppet-monit/pull/51) ([zilchms](https://github.com/zilchms))
- Clean up fixtures and codebase hardening [\#48](https://github.com/voxpupuli/puppet-monit/pull/48) ([zilchms](https://github.com/zilchms))
- Drop Oracle Linux 7 support [\#47](https://github.com/voxpupuli/puppet-monit/pull/47) ([zilchms](https://github.com/zilchms))
- Drop Debian 10 support [\#45](https://github.com/voxpupuli/puppet-monit/pull/45) ([zilchms](https://github.com/zilchms))
- Drop amazon 2016 and 2018; add amazon 2023 [\#42](https://github.com/voxpupuli/puppet-monit/pull/42) ([zilchms](https://github.com/zilchms))
- Drop ScientificLinux 5 and 6 support [\#41](https://github.com/voxpupuli/puppet-monit/pull/41) ([zilchms](https://github.com/zilchms))
- drop CentOs 5 and 6 support [\#40](https://github.com/voxpupuli/puppet-monit/pull/40) ([zilchms](https://github.com/zilchms))
- Drop OracleLinux 5 and 6 support [\#39](https://github.com/voxpupuli/puppet-monit/pull/39) ([zilchms](https://github.com/zilchms))
- Drop Redhat 5 and 6 support [\#38](https://github.com/voxpupuli/puppet-monit/pull/38) ([zilchms](https://github.com/zilchms))
- drop EOL Ubuntu 10, 12, 14 and 16 support [\#37](https://github.com/voxpupuli/puppet-monit/pull/37) ([zilchms](https://github.com/zilchms))
- drop EOL Debian 6, 7, 8, 9 support [\#36](https://github.com/voxpupuli/puppet-monit/pull/36) ([zilchms](https://github.com/zilchms))
- Drop Puppet 6 support [\#27](https://github.com/voxpupuli/puppet-monit/pull/27) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- focal support needs to be added to fail check [\#20](https://github.com/voxpupuli/puppet-monit/issues/20)
- Add RedHat/CentOS/Rocky/Alma 8 and 9 support [\#55](https://github.com/voxpupuli/puppet-monit/pull/55) ([zilchms](https://github.com/zilchms))
- Add Ubuntu 20.04 and 22.04 support [\#53](https://github.com/voxpupuli/puppet-monit/pull/53) ([zilchms](https://github.com/zilchms))
- Add Debian 12 support [\#52](https://github.com/voxpupuli/puppet-monit/pull/52) ([zilchms](https://github.com/zilchms))
- puppetlabs/firewall: Allow 8.x [\#50](https://github.com/voxpupuli/puppet-monit/pull/50) ([zilchms](https://github.com/zilchms))
- Add Oracle Linux 8 and 9 support [\#46](https://github.com/voxpupuli/puppet-monit/pull/46) ([zilchms](https://github.com/zilchms))
- Add Debian 11 support [\#44](https://github.com/voxpupuli/puppet-monit/pull/44) ([zilchms](https://github.com/zilchms))
- Add Puppet 8 support [\#29](https://github.com/voxpupuli/puppet-monit/pull/29) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Allow 9.x [\#28](https://github.com/voxpupuli/puppet-monit/pull/28) ([bastelfreak](https://github.com/bastelfreak))
- fixing Amazon Linux 2 support [\#23](https://github.com/voxpupuli/puppet-monit/pull/23) ([erik-frontify](https://github.com/erik-frontify))

**Closed issues:**

- Support latest puppet version \(7.x\) [\#26](https://github.com/voxpupuli/puppet-monit/issues/26)
- Error 500 on SERVER: Server Error: Evaluation Error: Error while evaluating a Function Call, monit supports Amazon Linux 2. Detected operatingsystemmajrelease is \<2\>. [\#21](https://github.com/voxpupuli/puppet-monit/issues/21)
- Support for CentOS 8 [\#16](https://github.com/voxpupuli/puppet-monit/issues/16)
- Spec test for v2.0.1 are failing [\#13](https://github.com/voxpupuli/puppet-monit/issues/13)
- old syntax detected [\#11](https://github.com/voxpupuli/puppet-monit/issues/11)

**Merged pull requests:**

- remove specialcasing for no longer supported OS [\#43](https://github.com/voxpupuli/puppet-monit/pull/43) ([zilchms](https://github.com/zilchms))

## [v3.0.0](https://github.com/voxpupuli/puppet-monit/tree/v3.0.0) (2020-12-09)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v2.0.1...v3.0.0)

**Merged pull requests:**

- PDK update to 1.18 [\#19](https://github.com/voxpupuli/puppet-monit/pull/19) ([aursu](https://github.com/aursu))
- Added ability to use special characters in httpd\_password parameter [\#18](https://github.com/voxpupuli/puppet-monit/pull/18) ([aursu](https://github.com/aursu))
- Fixing logging limitations with syslog. [\#15](https://github.com/voxpupuli/puppet-monit/pull/15) ([amigne](https://github.com/amigne))
- add Support for debian 10/buster [\#10](https://github.com/voxpupuli/puppet-monit/pull/10) ([to-kn](https://github.com/to-kn))

## [v2.0.1](https://github.com/voxpupuli/puppet-monit/tree/v2.0.1) (2018-11-23)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v2.0.0...v2.0.1)

**Implemented enhancements:**

- Add httpd\_allow configuration [\#5](https://github.com/voxpupuli/puppet-monit/issues/5)
- Add support for MMonit HTTPs addresses [\#4](https://github.com/voxpupuli/puppet-monit/issues/4)

**Merged pull requests:**

- Amazon fixed the wrong versioning for Amazon linux 2  [\#8](https://github.com/voxpupuli/puppet-monit/pull/8) ([erik-frontify](https://github.com/erik-frontify))

## [v2.0.0](https://github.com/voxpupuli/puppet-monit/tree/v2.0.0) (2018-10-08)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v1.4.0...v2.0.0)

**Implemented enhancements:**

- Add httpd\_allow configuration [\#5](https://github.com/voxpupuli/puppet-monit/issues/5)
- Add support for MMonit HTTPs addresses [\#4](https://github.com/voxpupuli/puppet-monit/issues/4)
- Add httpd\_allow configuration [\#7](https://github.com/voxpupuli/puppet-monit/pull/7) ([FlorentPoinsaut](https://github.com/FlorentPoinsaut))
- Add support for MMonit HTTPs addresses [\#6](https://github.com/voxpupuli/puppet-monit/pull/6) ([FlorentPoinsaut](https://github.com/FlorentPoinsaut))

## [v1.4.0](https://github.com/voxpupuli/puppet-monit/tree/v1.4.0) (2018-08-03)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v1.3.0...v1.4.0)

**Merged pull requests:**

- Add amazon linux2 support [\#3](https://github.com/voxpupuli/puppet-monit/pull/3) ([erik-frontify](https://github.com/erik-frontify))

## [v1.3.0](https://github.com/voxpupuli/puppet-monit/tree/v1.3.0) (2018-05-05)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v1.2.0...v1.3.0)

**Merged pull requests:**

- Support bionic [\#1](https://github.com/voxpupuli/puppet-monit/pull/1) ([elmobp](https://github.com/elmobp))

## [v1.2.0](https://github.com/voxpupuli/puppet-monit/tree/v1.2.0) (2018-01-26)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v1.1.3...v1.2.0)

## [v1.1.3](https://github.com/voxpupuli/puppet-monit/tree/v1.1.3) (2018-01-26)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v1.1.2...v1.1.3)

## [v1.1.2](https://github.com/voxpupuli/puppet-monit/tree/v1.1.2) (2016-11-07)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v1.1.1...v1.1.2)

## [v1.1.1](https://github.com/voxpupuli/puppet-monit/tree/v1.1.1) (2016-08-30)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v1.1.0...v1.1.1)

## [v1.1.0](https://github.com/voxpupuli/puppet-monit/tree/v1.1.0) (2016-08-05)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v1.0.0...v1.1.0)

## [v1.0.0](https://github.com/voxpupuli/puppet-monit/tree/v1.0.0) (2015-08-06)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v0.5.0...v1.0.0)

## [v0.5.0](https://github.com/voxpupuli/puppet-monit/tree/v0.5.0) (2015-06-06)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v0.4.0...v0.5.0)

## [v0.4.0](https://github.com/voxpupuli/puppet-monit/tree/v0.4.0) (2015-04-02)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v0.3.0...v0.4.0)

## [v0.3.0](https://github.com/voxpupuli/puppet-monit/tree/v0.3.0) (2015-04-01)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v0.2.0...v0.3.0)

## [v0.2.0](https://github.com/voxpupuli/puppet-monit/tree/v0.2.0) (2015-02-22)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v0.1.4...v0.2.0)

## [v0.1.4](https://github.com/voxpupuli/puppet-monit/tree/v0.1.4) (2015-02-09)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v0.1.3...v0.1.4)

## [v0.1.3](https://github.com/voxpupuli/puppet-monit/tree/v0.1.3) (2014-12-22)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v0.1.2...v0.1.3)

## [v0.1.2](https://github.com/voxpupuli/puppet-monit/tree/v0.1.2) (2014-09-18)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v0.1.1...v0.1.2)

## [v0.1.1](https://github.com/voxpupuli/puppet-monit/tree/v0.1.1) (2014-09-15)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/v0.1.0...v0.1.1)

## [v0.1.0](https://github.com/voxpupuli/puppet-monit/tree/v0.1.0) (2014-08-29)

[Full Changelog](https://github.com/voxpupuli/puppet-monit/compare/5c2a9c8ed93ee8ff0f6d305042ae8f1e808b6f92...v0.1.0)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
