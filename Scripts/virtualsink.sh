#!/usr/bin/env bash

# this script creates a virtual audio sink and source

pw-cli create-node adapter '{ factory.name=support.null-audio-sink node.name=my-sink media.class=Audio/Sink object.linger=true audio.position=[FL FR FC LFE RL RR] monitor.channel-volumes=true monitor.passthrough=true }'
pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name=my-source channel_map=front-left,front-right
