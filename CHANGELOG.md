# Changelog
## [Unreleased]

### Removed
- The CG/KG submodules have been removed. They have been supplanted by
  Prowlarr support in the few places they were used.

## [0.10.3] - 2024-02-15

### Added
- `ptp search`: Allow search users' snatched/leeching/uploaded/seeding
  torrents, e.g. `ptp search type=snatched`

## [0.10.2] - 2023-10-30
### Added
- `ptp inbox`: Add `--raw` flag to get HTML for conversations ([#24](https://github.com/kannibalox/PTPAPI/pull/24), [@bonswouar](https://github.com/bonswouar))

## [0.10.1] - 2023-09-28
### Fixed
- `ptp-origin`: Fix writing output on newer python versions

## [0.10.0] - 2023-06-04
### Added
- UHD/HDR/proprietary codecs filters ([#18](https://github.com/kannibalox/PTPAPI/pull/18), [@einsern](https://github.com/einsern))
- `ptp-reseed-machine`:
  - Support searching for movies without an IMDb
  - Allow adding more query types (still defaults to just IMDb and title queries)
  - Reduce number of requests when scraping needforseed.php
  - Add `--history-file` flag for capturing history and skipping duplicate checks
- New torrent fields: `LastActive`, `LastReseedRequest`, `ReseedWaitingUsers`, `Trumpable`
- `ptp-reseed`: Add client configuration section in ptpapi.conf
- Allow specifying a config file path with the `PTPAPI_CONFIG`
  environment variable (set to `/dev/null` to disable the config file
  altogether)
### Fixed
- `ptp-reseed`: Fix rtorrent existence check
- `ptp-reseed`: Allow `--overwrite-incomplete` to work correctly with `--hash-check`
- `ptp`: Parse pages correctly
### Changed
- `ptp download`: Download up to `-l/--limit` movies, instead of just searching that many movies

## [0.9.2] - 2023-03-28
### Fixed
- `ptp-reseed`:
  - Mark torrents saved to file as loaded
  - Handle hashing multi-file torrents correctly

## [0.9.1] - 2023-03-28
### Fixed
- `ptp-reseed` now only tries to connect to rtorrent when not using
  `--client`

## [0.9.0] - 2023-03-28
### Added
- Utility script for downloading and running archiver.py
- [`tinycron`](https://github.com/bcicen/tinycron) has been added to
  docker to allow for simple cron-like containers
- `ptp-reseed`
  - simple file downloading: use `file://<path>` with `--client`
  - Add flag for pre-hash-checking: `--hash-check`
  - Add flag for changing the path of an existing incomplete torrent: `--overwrite-incomplete` (rtorrent only)

## [0.8.0] - 2023-03-18
### Fixed
- Size comparisons in filters were be compared case-sensitively

### Changed
- Cleaned up and documented `ptp-reseed-machine` for general usage

### Added
- Add `ReseedMachine -> ignoreTitleResults` config setting to allow
  filtering out trackers from the title search
- Allow reading config from multiple locations: `~/.ptpapi.conf`,
  `~/.config/ptpapi.conf`, `~/.config/ptpapi/ptpapi.conf`
- Config values can now be loaded from environment variables
- Added a changelog
- Created dockerfile

[Unreleased]: https://github.com/kannibalox/PTPAPI/compare/v0.10.3...HEAD
[0.10.3]: https://github.com/kannibalox/PTPAPI/compare/v0.10.2...v0.10.3
[0.10.2]: https://github.com/kannibalox/PTPAPI/compare/v0.10.1...v0.10.2
[0.10.1]: https://github.com/kannibalox/pyrosimple/compare/v0.10.0...v0.10.1
[0.10.0]: https://github.com/kannibalox/pyrosimple/compare/v0.9.3...v0.10.0
[0.9.3]: https://github.com/kannibalox/pyrosimple/compare/v0.9.2...v0.9.3
[0.9.2]: https://github.com/kannibalox/pyrosimple/compare/v0.9.1...v0.9.2
[0.9.1]: https://github.com/kannibalox/pyrosimple/compare/v0.9.0...v0.9.1
[0.9.0]: https://github.com/kannibalox/pyrosimple/compare/v0.8.0...v0.9.0
[0.8.0]: https://github.com/kannibalox/pyrosimple/compare/v0.7.2...v0.8.0
