# STAT 471/571/701 Utilities

WIP - chua@wharton.upenn.edu

## TL;DR

This code will install the package from Github.

```r
if(!require("devtools")) {
    install.packages("devtools")
}
devtools::install_github("stillmatic/stat471")
```

## Overview

This package provides a number of helper functions for Wharton's Modern Data Mining, including the data used for the class.

## TODO

### Package

* Get this to work on Windows, without admin or compiler access
* Auto-update package / Github versions
* Add more data 
* Evaluate if `remotes` is stable enough to build around

### Autograder

* May need to abstract into another package
* Can access Canvas API to get data (which may need to be abstracted too)

### Standards

* I guess this includes auto update
* Enforce minimum levels for most important packages and R edition

### Lectures

* Move out of this repo
* Should be done at some point...
* Should also include better R intro
