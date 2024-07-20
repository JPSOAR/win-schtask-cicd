# ExportLogonEvents.ps1

## Description

This is an example of running a powershell script as a scheduled task.  In **SchTask_ExportLogonEvents.xml** `Powershell` is the command being run and `-f C:\GithubActions\win-schtask-cicd\Scripts\LogonEvents\ExportLogonEvents.ps1 -OutputFilePath C:\GithubData\LogonEvents\LogonEvents.csv` is passed in as an argument.  The result is a CSV file created containing all Logon events obtained from the Windows Event Viewer in the last 10 days.
