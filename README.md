### Simplified FreeTube Installation for Apple Silicon

[![FreeTube](assets/logoColor.svg)](https://github.com/FreeTubeApp/FreeTube "https://github.com/FreeTubeApp/FreeTube")

#### FreeTube’s Homebrew Tap for Apple Silicon

Install a native Apple Silicon build of FreeTube with this Homebrew Tap maintained by the FreeTube project.

If you install FreeTube via Homebrew without this tap, you get an _Intel-native build_ that requires Rosetta 2 in order to run on Apple Silicon.
(Intel Mac users, [see below](#intel-section).)


#### Quick Installation on Apple Silicon

1. Ensure [Homebrew](https://brew.sh) is installed.

1. If you already installed FreeTube: uninstall it.

   If installed from the main Homebrew cask (not this tap):

    ```bash
    # Uninstall the cask, while keeping your settings.
    brew uninstall freetube
    ```

1. Install FreeTube with a single command:

    ```bash
    brew install --no-quarantine pikachuexe/freetube/pikachuexe-freetube
    ```

    Or, if you prefer step-by-step:

    ```bash
    # Add the FreeTube tap (required only once).
    brew tap pikachuexe/freetube

    # Install FreeTube from the tap.
    brew install --no-quarantine pikachuexe-freetube
    ```


#### About `--no-quarantine`

- **Why use it?**

  The `--no-quarantine` option bypasses Gatekeeper, enabling you to run FreeTube while saving its developers the time and expense of having to register with Apple, sign the software and get it notarized by Apple.

<!--
  For independent developers of free (libre) and open source software, registering as an Apple Developer, signing your software, and getting it notarized by Apple can be time-consuming and costly. These steps are typically required to avoid Gatekeeper restrictions on macOS. Using the `--no-quarantine` option bypasses Gatekeeper and allows you to run the software even though it is not signed or notarized.
-->

- **About releases:**

  This repository has Apple Silicon-native FreeTube builds intended for installation with Homebrew. While direct downloads are discouraged, if you opt for that method, you’ll need to remove the Gatekeeper quarantine yourself for the app to run on your Apple Silicon Mac:

  ```bash
  # Replace <path/to/file> with the actual path to your downloaded file.
  /usr/bin/xattr -dr com.apple.quarantine <path/to/file>
  ```

<!--
- **More information:**

  * [Apple’s Gatekeeper documentation](https://support.apple.com/guide/security/gatekeeper-and-runtime-protection-sec5599b66df/web "https://support.apple.com/guide/security/gatekeeper-and-runtime-protection-sec5599b66df/web")

  * [Disabling Gatekeeper for one application only](https://github.com/disable-gatekeeper/disable-gatekeeper.github.io/tree/master?tab=readme-ov-file#disabling-gatekeeper-for-one-application-only "https://github.com/disable-gatekeeper/disable-gatekeeper.github.io/tree/master?tab=readme-ov-file#disabling-gatekeeper-for-one-application-only") on [https://disable-gatekeeper.github.io](https://disable-gatekeeper.github.io "https://disable-gatekeeper.github.io").
-->


<a name="intel-section"></a>
#### Quick Installation on Intel Macs

1. Ensure [Homebrew](https://brew.sh) is installed.

1. Use Homebrew without this tap to install FreeTube:

```bash
brew install freetube
```


#### Homebrew documentation

For more details about using Homebrew, check [Homebrew’s documentation](https://docs.brew.sh) or run `brew help` or `man brew`.
