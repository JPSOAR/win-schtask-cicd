# Get-CatFacts.py

## Description

This is an example of running a python script as a scheduled task.

In **SchTask_CatFacts.xml**, the command being run is `C:\GithubActions\win-schtask-cicd\venv\Scripts\python.exe` since this is the path to our virtual environment's python executable.

 `C:\GithubActions\win-schtask-cicd\Scripts\CatFacts\get-CatFact.py -outpath C:\GithubData\CatFacts\CatFacts.json` is passed in as the argument.  The first chunk is the full path to the python script.  The second chunk is the path to where the output should be saved.  The result is a JSON File containing today's cat fact.