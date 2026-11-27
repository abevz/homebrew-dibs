# Homebrew tap for dibs

This tap packages the published `v0.2.0` release of
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

To update after a newer formula is published, run `brew update` and
`brew upgrade abevz/dibs/dibs`. To remove the programs, run
`brew uninstall abevz/dibs/dibs`. User data is kept. If another
dibs installation exists, use `command -v dibs` to see which binary your shell
will run. Stop a running `dibsd` before upgrading or uninstalling, then start
it again after an upgrade; use its service manager if it is manager-owned.
See the [service instructions](https://github.com/abevz/dibs/blob/main/docs/operations.md#explicit-service-switch).

## Maintenance

The [sync workflow](.github/workflows/sync-formula.yml) keeps the formula in
step with dibs releases. Every day, and when started by hand from the Actions
tab, it compares `Formula/dibs.rb` with the `dibs.rb` asset of the newest dibs
release, prereleases included. When they differ, it checks that the asset pins
every archive in the release checksums, pushes a `formula/<tag>` branch, and
opens a pull request. The pull request event runs the four install checks
that gate the merge.

GitHub disables scheduled workflows in a public repository after 60 days
without repository activity. After a long pause between releases, the daily
run may stop. Start **Sync formula from dibs releases** by hand after a
release, or re-enable the workflow in the Actions tab; merging the next
formula pull request counts as activity again.

### Sync credentials

The default is a fine-grained personal access token (PAT). The publishing
credential pushes the branch and opens the pull request. GitHub runs the
required pull request checks automatically for PRs created with a PAT or
an App installation token. A separately dispatched test run cannot verify
that the PR triggered those checks. [GitHub workflow trigger rules](https://docs.github.com/en/actions/how-tos/write-workflows/choose-when-workflows-run/trigger-a-workflow#triggering-a-workflow-from-a-workflow).

#### Fine-grained PAT (default)

1. Under your GitHub account's **Settings → Developer settings → Personal
   access tokens → Fine-grained tokens**, create a token with an expiration
   date. Choose resource owner `abevz` and **Only select repositories →
   homebrew-dibs**. Grant repository **Contents: Read and write** and
   **Pull requests: Read and write**. Leave other permissions at their defaults
   (GitHub includes read-only Metadata).
2. In **abevz/homebrew-dibs → Settings → Secrets and variables → Actions →
   Secrets**, store the value as the repository secret `TAP_PR_TOKEN`. Leave
   the repository variable `TAP_PR_AUTH` unset, or set it to `pat`.
3. Before expiration, create a replacement with the same permissions,
   replace `TAP_PR_TOKEN`, verify a formula pull request as described below,
   and revoke the old token. Revoke a compromised credential immediately and
   replace it before the next sync.

[Fine-grained PAT setup](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token),
[repository Actions secrets](https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets#creating-secrets-for-a-repository).

#### GitHub App (alternative)

1. Create a GitHub App under `abevz` and install it on **homebrew-dibs only**.
   Give it repository **Contents: Read and write** and **Pull requests:
   Read and write**. No webhook is needed.
2. In the tap's Actions settings, set the repository variables
   `TAP_PR_AUTH` to `app` and `TAP_APP_CLIENT_ID` to the App's Client ID.
   Generate an App private key and store the PEM in the repository Actions
   secret `TAP_APP_PRIVATE_KEY`.
3. The workflow mints a short-lived installation token scoped to the tap
   and revokes it after the job. For a planned key rotation, generate a new
   private key, replace `TAP_APP_PRIVATE_KEY`, verify a formula pull request,
   and delete the old key in the App settings. Rotate immediately if a key
   is exposed.

[GitHub App private keys](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/managing-private-keys-for-github-apps),
[installation token action](https://github.com/actions/create-github-app-token).

### Verify the first sync

After the workflow change is on `main`, use the next scheduled sync with a
new release, or run **Sync formula from dibs releases** manually with a newer
release tag whose formula differs from `main` and has no existing formula PR. A
matching formula is a no-op and cannot verify PR checks.

1. Open the new formula PR. Confirm **Test Homebrew tap** started with the
   `pull_request` event and ran the install matrix for that PR.
2. In the PR merge box, confirm that branch protection reports the four
   required checks. Their names are `install (ubuntu-24.04)`,
   `install (ubuntu-24.04-arm)`, `install (macos-15-intel)`, and
   `install (macos-15)`. Let them complete and verify all four pass.
3. Record the formula PR and workflow run links for afc-184 after the first
   real release. The workflow should produce the checks without closing
   and reopening the PR or dispatching the test workflow.

If a run pushed a formula branch and failed before creating the PR, rerun
sync after fixing the reported error. It can reuse a branch with the same
contents and reports an error if the branch differs.
