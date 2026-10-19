#!/usr/bin/env bash

set -g status-justify left
set -g status-style "fg=#5C6870,bg=#1E2124"
set -g pane-border-style "fg=#5C6870"
set -g pane-active-border-style "fg=#1E2124"
set -g message-style "fg=#DCE5E5,bg=#1E2124,bold"
set -g message-command-style "fg=#DCE5E5,bg=#1E2124,bold"
set -g mode-style "bg=#33383D"

set -g window-status-separator ""
set -g window-status-style "fg=#5C6870"
set -g window-status-format " #I:#W "
set -g window-status-current-format " #I:#W* "
set -g window-status-current-style "fg=#DCE5E5,bold"

set -g status-left ""
set -g status-right "#[fg=#DCE5E5,bold] #S"

set -g clock-mode-colour "#5C6870"
