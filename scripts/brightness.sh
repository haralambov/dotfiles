#!/bin/bash

echo "$(light -G | cut -d\. -f 1)%"
