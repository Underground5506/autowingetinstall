# PersonalizedInstall

A lightweight Windows software installer powered by **Windows Package Manager (winget)**.

PersonalisedInstall lets you choose a `.txt` file containing package IDs and automatically install the listed applications.

## Features

- Select your own application list using a file dialog.
- Install multiple applications with winget.
- Support for silent installation where supported by the package.
- Simple Windows Batch implementation.
- Open-source under the MIT License.

## Requirements

- Windows 10 or Windows 11.
- [Windows Package Manager (winget)](https://learn.microsoft.com/en-us/windows/package-manager/winget/).
## if u don't have the winget
there is an installer in this repository
make sure to run it as an administator before reporting any issues
## to know witch version you are using in winget just do this command
'''text
winget --version
'''

## How to use

1. Download or clone this repository.
2. Create a `.txt` file containing the winget package IDs you want to install.
3. Run `personnalizatedinstall.bat`.
4. Select your `.txt` file when prompted.
5. Wait for the installation process to finish.

## Example application list

Create a text file with one package ID per line:

```text
Discord.Discord
7zip.7zip
VideoLAN.VLC
```

Replace these examples with the package IDs of your choice.

You can search for package IDs on [winget.run](https://winget.run/).

## Disclaimer

Installation behavior depends on each package and its installer. Silent installation is not guaranteed for every application.

Review the package IDs before installing software.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
