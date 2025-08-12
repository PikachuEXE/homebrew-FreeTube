### Simplified FreeTube Installation for Apple Silicon

[![FreeTube](assets/logoColor.svg)](https://github.com/FreeTubeApp/FreeTube "https://github.com/FreeTubeApp/FreeTube")


#### FreeTube’s Homebrew Tap for Apple Silicon

Install a native Apple Silicon build of FreeTube with this Homebrew Tap.

If you install FreeTube via Homebrew without this tap, you get an _Intel-native build_ that requires Rosetta 2 in order to run on Apple Silicon.
(Intel Mac users, [see below](#intel-section).)

Updating Apple Silicon build also requires non standard command, [see below](#arm-update-section)


Warning: macOS's Gatekeeper has been disabled for this Cask

According to the vendor, the Gatekeeper quarantine attribute breaks the app and needs to be removed. This Cask automatically removes the quarantine attribute. No further action is required.

For more information:
- https://docs.freetubeapp.io/faq/#macos-freetube-is-damaged-and-cant-be-opened-you-should-move-it-to-the-trash
- https://docs.brew.sh/FAQ#why-cant-i-open-a-mac-app-from-an-unidentified-developer


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
    brew install pikachuexe/freetube/pikachuexe-freetube
    ```

    Or, if you prefer step-by-step:

    ```bash
    # Add the FreeTube tap (required only once).
    brew tap pikachuexe/freetube

    # Install FreeTube from the tap.
    brew install pikachuexe-freetube
    ```


<a name="intel-section"></a>
#### Quick Installation on Intel Macs

1. Ensure [Homebrew](https://brew.sh) is installed.

1. Use Homebrew without this tap to install FreeTube:

```bash
brew install freetube
```


<a name="arm-update-section"></a>
#### Update/Reinstall on Apple Silicon
```shell
# Upgrade
brew upgrade pikachuexe/freetube/pikachuexe-freetube

# Reinstall
brew reinstall pikachuexe/freetube/pikachuexe-freetube
```


#### Uninstall on Apple Silicon
If you want to install another version / via another way
```shell
# Upgrade
brew uninstall pikachuexe/freetube/pikachuexe-freetube

# Reinstall
brew untap pikachuexe/freetube
```


#### Homebrew documentation

For more details about using Homebrew, check [Homebrew’s documentation](https://docs.brew.sh) or run `brew help` or `man brew`.
