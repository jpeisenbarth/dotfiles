#!/bin/sh
 
if grep -q XHC.*enabled /proc/acpi/wakeup ; then
  echo XHC > /proc/acpi/wakeup
fi
