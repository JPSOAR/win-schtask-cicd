# win-schtask-cicd

Windows Scheduled Tasks in 2024!? Yes!  Use this template repository to deploy Windows Scheduled Tasks to your *On Premise* Windows Server using Github Actions.

## Blog Post

For a full overview and tutorial visit my blog post about this project at [https://jpit.io/posts/deploy-onprem-windows-scheduled-tasks-using-git/](https://jpit.io/posts/deploy-onprem-windows-scheduled-tasks-using-git/)

## Quick Setup Guide

### Setup Repository

1. Create a new private repository from this template
2. Add the following repository secrets to the repository
   | Secret Name | Description |
   | --- | --- |
   | WIN_GH_ACTIONS_PATH | The local path to the shared GithubActions folder on your Windows server |
   | WIN_HOSTNAME | The hostname of your Windows server |
   | WIN_USER | The local user account on the Windows server that will be used to for transferring files and configuring the Scheduled Tasks |
   | WIN_PW | The password for the local Windows user account
3. Create a Linux based Self Hosted Github Runner for the repository

### Windows Server Setup

1. Create a new local user account on the Windows Server that will be used to run all Scheduled Tasks and transfer files
2. Install OpenSSH Server on the Windows Server
3. Enable Public Key Authentication and create a new Private/Public key pair by following this [guide](https://www.youtube.com/watch?v=9dhQIa8fAXU&t=584s)
4. Create a new shared folder named `GithubActions` on the server so it's accessible from `\\WIN_HOSTNAME\GithubActions`
5. Install Python on the Windows Server

### Self Hosted Runner Setup

1. Install the Github Self Hosted Runner as a service
2. Ensure rsync and supporting tools are installed by running `sudo apt-get install cifs-utils`
3. Copy the generated private key to the linux host and configure the SSH client to use it when connecting to the Windows Server

### Local Dev Setup

1. Clone the repository to your local machine
2. New Scheduled Tasks are created by adding an additional folder for each task you want to deploy to the `Scripts` folder.  Each new folder you create should contain the automation script you want the scheduled task to trigger and an XML file that defines the scheduled task itself
3. XML scripts can be created by either copying one of my examples and editing it or using the Windows Task Scheduler UI to first create the task and then export it as an XML file
