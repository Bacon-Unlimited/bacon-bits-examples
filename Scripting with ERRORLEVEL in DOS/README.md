# Script Control with Custom Edit Codes
* https://youtu.be/z-XIrSqokWc

This is example code that shows how to use the last errorcode in DOS to set Bacon job returns to SUCCESS or FAILED
Learn more here: https://ss64.com/nt/errorlevel.html

## Purpose
The command intrpreter will store the errorlevel of the last run function. This example show you how to retrieve and 
set your script logic based on that, even exiting early from the script as needed.

A script that doesn't perform all steps successfully should be marked as FAILed in Bacon, and execution should stop (or not, 
depending on the needs of the job)

# Customizing
This script is a starting place. How to customize for your environment
* CHeck the errorlevel of mission-critical functions in your scripts
* Perform this control flow to application installations
* and more...

# License
This is provided with the MIT License. There are no guarantees or warranties, and you may use or modify as needed.
