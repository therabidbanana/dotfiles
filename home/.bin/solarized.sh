#!/bin/bash
#
# Author: benley@gmail.com (Benjamin Staffin)
# Set your terminal's color palette to match the Solarized color scheme by
# using escape sequences.  Uses OSC 4 to set colors.
#
# This will work with many terminal emulators, but not all.

set -o nounset

# This next line would set the colors in the 256 color pallette which normally approximate
# solarized.  Not a universal solution, but it helps with getting vim to look
# right! Stick this in your .vimrc just before "colorscheme solarized":
# let g:solarized_termtrans=1
# let g:solarized_termcolors=256
# See https://github.com/altercation/solarized/issues/8 for more information.
printf '\x1B]4;234;rgb:00/2b/36;235;rgb:07/36/42;240;rgb:58/6e/75;241;rgb:65/7b/83;244;rgb:83/94/96;245;rgb:93/a1/a1;254;rgb:ee/e8/d5;230;rgb:fd/f6/e3;136;rgb:b5/89/00;166;rgb:cb/4b/16;160;rgb:dc/32/2f;125;rgb:d3/36/82;61;rgb:6c/71/c4;33;rgb:26/8b/d2;37;rgb:2a/a1/98;64;rgb:85/99/00\a'

base03="00/2b/36"
base02="07/36/42"
base01="58/6e/75"
base00="65/7b/83"
base0="83/94/96"
base1="93/a1/a1"
base2="ee/e8/d5"
base3="fd/f6/e3"
yellow="b5/89/00"
orange="cb/4b/16"
red="dc/32/2f"
magenta="d3/36/82"
violet="6c/71/c4"
blue="26/8b/d2"
cyan="2a/a1/98"
green="85/99/00"

function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

#black
cset 0 $base02
cset 8 $base03

#red
cset 1 $red
cset 9 $orange

#green
cset 2 $green
cset 10 $base01

#yellow
cset 3 $yellow
cset 11 $base00

#blue
cset 4 $blue
cset 12 $base0

#magenta
cset 5 $magenta
cset 13 $violet

#cyan
cset 6 $cyan
cset 14 $base1

#white
cset 7 $base2
cset 15 $base3
