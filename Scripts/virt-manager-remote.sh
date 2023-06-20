#!/bin/bash

eval `ssh-agent -s`
ssh-add ~/.ssh/home-server

virt-manager &
