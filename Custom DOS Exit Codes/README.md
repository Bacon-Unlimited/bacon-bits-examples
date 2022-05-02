# Script Control with Custom Edit Codes
* https://youtu.be/znTYfrF0dMQ

This is example code that shows how to use custom exit codes in DOS to set Bacon job returns to SUCCESS or FAILED
Learn more here: https://ss64.com/nt/exit.html

## Purpose
Sometimes the command interpreter will continue operation when a function returned an error, and return SUCCESS on completion of running.
This is often anathema to the requirements of IT admins when running mission critical scripts.

A script that doesn't perform all steps successfully should be marked as FAILed in Bacon, and execution should stop (or not, 
depending on the needs of the job)

# Customizing
This script is a starting place. How to customize for your environment
* set your own exit codes as needed
* Perform this control flow to application installations
* and more...

# License
This is provided with the MIT License. There are no guarantees or warranties, and you may use or modify as needed.
