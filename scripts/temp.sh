#!/bin/bash
echo $(sensors | grep -i "Core 0" | awk '{print $3}')
