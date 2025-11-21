# mov2gif — Xcode 14.2+

[![Actions Status](https://github.com/perseusrealdeal/mov2gif/actions/workflows/main.yml/badge.svg)](https://github.com/perseusrealdeal/mov2gif/actions/workflows/main.yml)
[![Style](https://github.com/perseusrealdeal/mov2gif/actions/workflows/swiftlint.yml/badge.svg)](https://github.com/perseusrealdeal/mov2gif/actions/workflows/swiftlint.yml)
![Version](https://img.shields.io/badge/Version-0.0.2-green.svg)
[![Platforms](https://img.shields.io/badge/Platform-macOS%2010.13+-orange.svg)](https://en.wikipedia.org/wiki/MacOS_version_history)
[![Xcode](https://img.shields.io/badge/Xcode-14.2+-red.svg)](https://en.wikipedia.org/wiki/Xcode)
[![Swift](https://img.shields.io/badge/Swift-5-orange.svg)](https://docs.swift.org/swift-book/RevisionHistory/RevisionHistory.html)
[![SDK](https://img.shields.io/badge/SDK-UIKit%20-blueviolet.svg)](https://developer.apple.com/documentation/uikit)
[![License](http://img.shields.io/:License-Clear_BSD-blue.svg)](/LICENSE)

> This is the great home-made macOS app project to accomplish `.mov to .gif file conversion` task.

> `For details:` [`Approbation and A3 Environment`](/APPROBATION.md) / [`CHANGELOG`](/CHANGELOG.md)

## Dependencies

> The Crown of Stars:

[![ConsolePerseusLogger](http://img.shields.io/:ConsolePerseusLogger-1.6.0-green.svg)](https://github.com/perseusrealdeal/ConsolePerseusLogger.git)
[![PerseusDarkMode](http://img.shields.io/:PerseusDarkMode-2.1.0-green.svg)](https://github.com/perseusrealdeal/PerseusDarkMode.git)

## Our Terms

> [`CPL`](https://github.com/perseusrealdeal/ConsolePerseusLogger.git) stands for `C`onsole `P`erseus `L`ogger.</br>
> [`PGK`](https://github.com/perseusrealdeal/PerseusGeoKit.git) stands for `P`erseus `G`eo `K`it.</br>
> [`PDM`](https://github.com/perseusrealdeal/PerseusDarkMode.git) stands for `P`erseus `D`ark `M`ode.</br>
> `P2P` stands for `P`erson-`to`-`P`erson.</br>
> [`A3`](https://docs.google.com/document/d/1K2jOeIknKRRpTEEIPKhxO2H_1eBTof5uTXxyOm5g6nQ) stands for `A`pple `A`pps `A`pprobation.</br>
> [`T3`](https://github.com/perseusrealdeal/TheTechnologicalTree) stands for `T`he `T`echnological `T`ree.

# Contents

* [The Why](#The-Why)
* [Build requirements](#Build-requirements)
* [Software requirements](#Software-requirements)
* [Gifts](#Gifts)
* [First-party software](#First-party-software)
* [Third-party software](#Third-party-software)
* [Points taken into account](#Points-taken-into-account)
* [License](#License)
    * [Other required licenses details](#Other-required-licenses-details)
* [Credits](#Credits)
* [Author](#Author)

# The Why

> The initial point of development process.

> [!IMPORTANT]
> Preview material.

# Build requirements

- [macOS Monterey 12.7.6+](https://apps.apple.com/by/app/macos-monterey/id1576738294) / [Xcode 14.2+](https://developer.apple.com/services-account/download?path=/Developer_Tools/Xcode_14.2/Xcode_14.2.xip)

# Software requirements

- [`Functional Specification`](/REQUIREMENTS.md)
- Translations [EN](/T3Project/Configuration/Translations/Translation_en.plist), [RU](/T3Project/Configuration/Translations/Translation_ru.plist)

# Gifts

- [CurrentSystemLanguageGift.swift](https://gist.github.com/perseusrealdeal/98b082b136d574dd1b5aa760036dac8b)
- [JsonDataDictionaryGift.swift](https://gist.github.com/perseusrealdeal/918c25633122e64d51f363f00059f6f8)
- [JsonDataPrettyPrintedGift.swift](https://gist.github.com/perseusrealdeal/945c9050cb9f7a19e00853f064acacca)
- [LocalizedInfoPlistGift.swift](/PerseusTests/GiftsAndHelpers/LocalizedInfoPlistGift.swift)
- [LocalizedExpectationGift.swift](/PerseusTests/GiftsAndHelpers/LocalizedExpectationGift.swift)

# First-party software

| Type    | Name                                                                                                                                                                  | License |
| ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| Package | [ConsolePerseusLogger](https://github.com/perseusrealdeal/ConsolePerseusLogger) / [1.6.0](https://github.com/perseusrealdeal/ConsolePerseusLogger/releases/tag/1.6.0) | MIT     |
| Package | [PerseusDarkMode](https://github.com/perseusrealdeal/PerseusDarkMode) / [2.1.0](https://github.com/perseusrealdeal/PerseusDarkMode/releases/tag/2.1.0)                | MIT     |

# Third-party software

| Type   | Name                                                                                                                              | License                            |
| ------ | --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| Style  | [SwiftLint](https://github.com/realm/SwiftLint) / [v0.57.0 for Monterey+](https://github.com/realm/SwiftLint/releases/tag/0.57.0) | MIT                                |
| Action | [mxcl/xcodebuild@v3](https://github.com/mxcl/xcodebuild)                                                                          | [Unlicense](https://unlicense.org) |
| Action | [cirruslabs/swiftlint-action@v1](https://github.com/cirruslabs/swiftlint-action/)                                                 | MIT                                |

# Points taken into account

- Explicit start point placed in [main.swift](/T3Project/main.swift)
- Explicit app delegate [TestingAppDelegate.swift](/PerseusTests/TestingAppDelegate.swift) with test bundle
- Explicit app globals placed in [AppGlobals.swift](/T3Project/Configuration/AppGlobals.swift)
- Localization based on Localizable.strings approach
- [Test Plan](/PerseusTests/TestPlanStarted.xctestplan) configured for EN and RU as well
- [Changelog Template](/CHANGELOG.md)
- [A3 Environment Specification Template](/APPROBATION.md)
- [Software Requirements Template](/REQUIREMENTS.md)
- [GitHub CI build & test](/main.yml)
- [GitHub CI SwiftLint](/swiftlint.yml)
- [SwiftLint Rules](/.swiftlint.yml)
- [Git Config](/.gitignore)
- [CPL Config](/T3Project/Configuration/CPLConfig.json)
- SwiftLint shell script as a build phase (SwiftLint preinstallation required)

# License

`License:` The Clear BSD License

Copyright © 7534 Mikhail A. Zhigulin of Novosibirsk<br/>
Copyright © 7534 PerseusRealDeal

- The year starts from the creation of the world according to a Slavic calendar.
- September, the 1st of Slavic year. It means that "Sep 01, 2025" is the beginning of 7534.

[LICENSE](/LICENSE) for details.

## Other required licenses details

© Mikhail A. Zhigulin of Novosibirsk **for** ConsolePerseusLogger, PerseusDarkMode</br>
© PerseusRealDeal **for** ConsolePerseusLogger, PerseusDarkMode</br>
© 2025 The SwiftLint Contributors **for** SwiftLint</br>
© GitHub **for** GitHub Action cirruslabs/swiftlint-action@v1</br>

# Credits

<table>
<tr>
    <td>Balance and Control</td>
    <td>kept by</td>
    <td>Mikhail Zhigulin</td>
</tr>
<tr>
    <td>Source Code</td>
    <td>written by</td>
    <td>Mikhail Zhigulin</td>
</tr>
<tr>
    <td>Documentation</td>
    <td>prepared by</td>
    <td>Mikhail Zhigulin</td>
</tr>
<tr>
    <td>Product Approbation</td>
    <td>tested by</td>
    <td>Mikhail Zhigulin</td>
</tr>
<!--
<tr>
    <td>Artwork</td>
    <td>expressed by</td>
    <td>Mikhail Zhigulin of Novosibirsk</td>
</tr>
-->
<tr>
    <td>Russian Translation</td>
    <td>prepared by</td>
    <td>Mikhail Zhigulin</td>
</tr>
<tr>
    <td>English Translation</td>
    <td>prepared by</td>
    <td>Mikhail Zhigulin</td>
</tr>
</table>

<!--
- Artwork tool: [GIMP](https://www.gimp.org/) / [2.10.36](https://download.gimp.org/gimp/v2.10/osx/) for macOS 10.12 Sierra or newer
-->
- Language support: [Reverso](https://www.reverso.net/) 
- Git clients: [SmartGit](https://syntevo.com/) and [GitHub Desktop](https://github.com/apps/desktop)

# Author

> © Mikhail A. Zhigulin of Novosibirsk
