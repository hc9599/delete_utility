Disclaimer: “All scripts and documented procedures (“Documentation”) provided by Data Dynamics are provided “as is” and are not 
intended to be used other than by Data Dynamics for specific demonstration, troubleshooting, support or other uses.  
We expressly disclaim any and all liability and all warranties, whether express or implied, for use of the Documentation by customers; 
any such use of the Documentation is at the customer’s sole risk.”

1. this script will accept CIFS path or local path as a parameter
2. path should contain all the LAF output files
3. this script will only be executed on the files and not on the folders, if the criteria match is Operation equal to Copied

4. to execute this script

    .\delete.ps1 -folder "<path>"

    Examples:

    .\del.ps1 -folder "\\localhost\fornew\huie2023-01-12_07-15-28\20230112_071528.603_0171\"