#!/bin/bash
jq . "$1" >/dev/null || cat "$1"