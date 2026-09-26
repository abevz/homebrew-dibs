# Homebrew tap for dibs

This tap packages the published `v0.1.0-rc.4` preview of
[dibs](https://github.com/abevz/dibs). The formula uses the release archives
and SHA-256 checksums published with that tag.

## Install

With [Homebrew](https://brew.sh/) installed, run:

```sh
brew install abevz/dibs/dibs
```

The formula installs `dibs`, `dibsd`, and `dibs-mcp` on Linux amd64/arm64 and
macOS Intel/Apple Silicon. Run `dibs init` inside a Git repository to begin.
See the [first-use guide](https://github.com/abevz/dibs/blob/main/docs/install.md)
for the project setup and daemon behavior.

The `v0.1.0-rc.4` formula is a preview. To update after a newer formula is
published, run `brew update` and `brew upgrade abevz/dibs/dibs`. To remove the
programs, run `brew uninstall abevz/dibs/dibs`; user data is kept. If another
dibs installation exists, use `command -v dibs` to see which binary your shell
will run. Stop a running `dibsd` before upgrading or uninstalling, then start
it again after an upgrade; use its service manager if it is manager-owned.
See the [service instructions](https://github.com/abevz/dibs/blob/main/docs/operations.md#explicit-service-switch).

## Maintenance

The [sync workflow](.github/workflows/sync-formula.yml) keeps the formula in
step with dibs releases. Every day, and when started by hand from the Actions
tab, it compares `Formula/dibs.rb` with the `dibs.rb` asset of the newest dibs
release, prereleases included. When they differ, it checks that the asset pins
every archive in the release checksums, pushes a `formula/<tag>` branch, runs
the install tests on it, and opens a pull request. Merge that pull request
after the four install checks pass.

GitHub disables scheduled workflows in a public repository after 60 days
without repository activity. After a long pause between releases, the daily
run may stop. Start **Sync formula from dibs releases** by hand after a
release, or re-enable the workflow in the Actions tab; merging the next
formula pull request counts as activity again.
