param(
    [string]$folder
)

$input_message = Read-Host 'All scripts and documented procedures (“Documentation”) provided by Data Dynamics are provided “as is” and are not intended to be used other than by Data Dynamics for specific demonstration, troubleshooting, support or other uses.We expressly disclaim any and all liability and all warranties, whether express or implied, for use of the Documentation by customers; any such use of the Documentation is at the customer sole risk. Do you accept terms and conditions ? Type yes or no'

if ($input_message -eq "yes") 
{
    # script commands here

    # get all the files from the folder
    $files = Get-ChildItem -Path $folder -Filter "*.tsv"

    # create a timestamp string
    $timestamp = (Get-Date).ToString("yyyy-MM-dd_HH-mm-ss")
    # create log file path
    $logFile = "deleted_files_$timestamp.log"

    # recurse into the children and get the row values
    foreach($file in $files)
    {
        $file = Import-Csv -Path $file.FullName -Delimiter "`t"
        foreach($row in $file)
        {
            if($row."File or Folder" -eq "File" -and $row.Operation -eq "Copied")
            {
                $path = $row."Path Name"
                Write-Warning "$path will be deleted"
                Remove-Item -Path $path -Force -Confirm:$false
                # write the path to a log file
                Add-Content -Path $logFile -Value $path
            }
        }

    }
    # get the current working directory
    $currentDirectory = Get-Location

    # get the full path of the log file
    $logFilePath = Resolve-Path $logFile

    # display the log file location
    Write-Host "Log file saved at $logFilePath in $currentDirectory"

} else {
    Write-Host "Please accept the terms and conditions"
}
