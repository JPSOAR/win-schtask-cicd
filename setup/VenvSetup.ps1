param (
	[Parameter(Mandatory=$true)]
	[string]$schtask_path
)


python -m venv $schtask_path\venv --clear

#Run the activate.ps1 script to activate the virtual environment
. $schtask_path\venv\Scripts\Activate.ps1
pip install -r $schtask_path\setup\requirements.txt