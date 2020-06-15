#!/bin/bash

pmset -g batt | grep -oE "[0-9]{1,3}%"
