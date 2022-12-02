This directory contains output from instances.social.

* list.json is the output of https://instances.social/list.json, on 12/2/2022
  Do NOT open with Emacs. You'll have to force-quit to continue.
* list-formatted.json is list.json, pretty-printed:
    jq --indent 2 '.' list.json >list-formatted.json
  This file IS safe to open with Emacs.
  I used homebrew to install jq on my Mac:
    brew install jq
