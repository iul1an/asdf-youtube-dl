<div align="center">

# asdf-youtube-dl [![Build](https://github.com/iul1an/asdf-youtube-dl/actions/workflows/build.yml/badge.svg)](https://github.com/iul1an/asdf-youtube-dl/actions/workflows/build.yml) [![Lint](https://github.com/iul1an/asdf-youtube-dl/actions/workflows/lint.yml/badge.svg)](https://github.com/iul1an/asdf-youtube-dl/actions/workflows/lint.yml)


[youtube-dl](https://github.com/ytdl-org/youtube-dl) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents
- [Compatibility](#compatibility)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Compatibility
This plugin works with Linux and MacOS, both amd64 and arm64 CPU architecture.

# Install

Plugin:

```shell
asdf plugin add youtube-dl
# or
asdf plugin add youtube-dl https://github.com/iul1an/asdf-youtube-dl.git
```

youtube-dl:

```shell
# Show all installable versions
asdf list-all youtube-dl

# Install specific version
asdf install youtube-dl latest

# Set a version globally (on your ~/.tool-versions file)
asdf global youtube-dl latest

# Now youtube-dl commands are available
youtube-dl --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/iul1an/asdf-youtube-dl/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Iulian Mandache](https://github.com/iul1an/)
