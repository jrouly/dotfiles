# Dotfiles

This repo uses [rcm][]. Also, all dotfiles are kept in tag-specific directories.
This allows for easy cherry-picking.

For example, if you want only my vim setup:

```
$ git clone https://github.com/jrouly/dotfiles .jrouly-dotfiles
$ rcup -d .jrouly-dotfiles -t vim
```

These options could be made the default in your own `~/.rcrc`.

See more details with `man 7 rcm`.

[rcm]: https://github.com/thoughtbot/rcm
