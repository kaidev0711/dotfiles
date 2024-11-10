#!/bin/sh
set -x  # Debug mode

case "$1" in
  "explorer")
    left_pane_id=$(wezterm cli get-pane-direction left)
    if [ -z "${left_pane_id}" ]; then
      left_pane_id=$(wezterm cli split-pane --left --percent 20)
    fi
    
    left_program=$(wezterm cli list --format json | jq --arg pane_id "$left_pane_id" -r '.[] | select(.pane_id == ($pane_id | tonumber)) | .title' | awk '{ print $1 }')
    
    if [ "$left_program" != "br" ]; then
      printf "br\r" | wezterm cli send-text --pane-id "$left_pane_id" --no-paste
    fi
    
    wezterm cli activate-pane-direction --pane-id "$left_pane_id" left
    ;;
  *)
    echo "Unknown command: $1"
    exit 1
    ;;
esac
