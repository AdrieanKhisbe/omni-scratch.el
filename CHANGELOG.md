# Change Log

All notable changes to *omni-scratch.el* will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased][unreleased]

## [0.6.0] - 2017-10-09
### Added
- Minor mode map
- Background more pale (by opt out)
### Fixed
- Universal prefix arg handling
## [0.5.0] - 2017-10-08
### Changed
- Remove `-buffer` suffix in the function name: `omni-scratch` et `omni-scratch-major`
### Added
- `omni-scratch-buffer` to have a scraych buffer attached to current buffer
- Calling with universal arg open the scratch buffer in other window
- Selected region is now copied and inserted in the scratch buffer

## [0.4.1] - 2017-04-16
### Fixed
- Version in omni-scratch.el
## [0.4.0] - 2017-04-14
### Added
- Helm list with `omni-scratch-buffers`
- Ability to define the default scratch mode
## [0.3.0] - 2017-04-14
### Added
- Add a minimalist minor mode to buffers
- Add a `omni-scratch-goto-last` alias
### Changed
- calling function from scratch buffer will move you back where you came from

## [0.2.0] - 2017-04-13
### Added
- Add a `omni-scratch-quit` function
### Changed
- rename functions to shorter name
## [0.1.1] - 2015-05-21
### Changed
- Add package prefix to functions
## [0.1.0] - 2014-12-06
- Initial Release

[unreleased]: https://github.com/AdrieanKhisbe/omni-scratch.el/compare/v0.6.0...HEAD
[0.6.0]: https://github.com/AdrieanKhisbe/omni-scratch.el/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/AdrieanKhisbe/omni-scratch.el/compare/v0.4.1...v0.5.0
[0.4.1]: https://github.com/AdrieanKhisbe/omni-scratch.el/compare/v0.4.0....v0.4.1
[0.4.0]: https://github.com/AdrieanKhisbe/omni-scratch.el/compare/v0.3.0....v0.4.0
[0.3.0]: https://github.com/AdrieanKhisbe/omni-scratch.el/compare/v0.2.0....v0.3.0
[0.2.0]: https://github.com/AdrieanKhisbe/omni-scratch.el/compare/v0.1.1....v0.2.0
[0.1.1]: https://github.com/AdrieanKhisbe/omni-scratch.el/compare/v0.1.0....v0.1.1
[0.1.0]: https://github.com/AdrieanKhisbe/omni-scratch.el/compare/22b1c55....v0.1.0
