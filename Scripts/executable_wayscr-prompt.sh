#!/usr/bin/env bash

printf "region\noutput\nwindow" | fzf | tee /tmp/screenshot_type
