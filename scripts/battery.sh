#!/bin/bash
ACPI_OUTPUT=$(acpi)
STATUS=$(echo $ACPI_OUTPUT | cut -d: -f2 | cut -d, -f1 | tr -d "[:space:]")
PERCENTAGE=$(echo $ACPI_OUTPUT | cut -d, -f2 | tr -d "[:space:]")
PERCENTAGE_VALUE=$(echo $PERCENTAGE | cut -d% -f1)
ICON=""
# Discharging
# Not charging
# Charging
if [ "$STATUS" = "Charging" ]; then
    ICON=""
elif [ "$STATUS" = "Not charging" ]; then
    ICON=""
elif [ "$STATUS" = "Full" ]; then
    ICON=""
elif [ "$PERCENTAGE_VALUE" -ge 90 ]; then
    ICON=""
elif [ "$PERCENTAGE_VALUE" -ge 75 ]; then
    ICON=""
elif [ "$PERCENTAGE_VALUE" -ge 50 ]; then
    ICON=""
elif [ "$PERCENTAGE_VALUE" -ge 25 ]; then
    ICON=""
else
    ICON=""
fi

echo "$ICON  $PERCENTAGE"
