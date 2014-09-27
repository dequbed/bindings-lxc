bindings-lxc
============

[![Build Status](https://travis-ci.org/fizruk/bindings-lxc.svg?branch=master)](https://travis-ci.org/fizruk/bindings-lxc)

Direct Haskell bindings to LXC (Linux containers) C API.

The package provides direct bindings to LXC C API through @bindings-dsl@.

## Requirements

Before installation make sure you have LXC installed on your system with header files.

On Ubuntu 14.04 LTS (Trusty Tahr):

```
$ sudo apt-get install lxc-dev
```

## Installation

Get the latest stable version from Hackage:

```
$ cabal install bindings-lxc
```

or clone this repository:

```
$ git clone https://github.com/fizruk/bindings-lxc.git
$ cd bindings-lxc
$ cabal install
```

## Documentation

Haddock documentation is available at http://fizruk.github.io/bindings-lxc/docs/

## Contributing

Contributions and bug reports are welcome!

Please feel free to contact me via GitHub or on the #haskell IRC channel on irc.freenode.net.

-Nickolay Kudasov