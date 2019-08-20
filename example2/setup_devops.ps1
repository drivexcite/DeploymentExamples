$organization = 'https://dev.azure.com/hwdevopsorg'
$pat = ''
$project = 'DeploymentExample'
$repository = 'nanofunction'

#  az extension add --name azure-devops

$pat | az devops login --org $organization
az devops project create --name $project --organization $organization --visibility private
az repos create --organization $organization --project $project --name $repository 

$repoUrl = $organization + '/' + $project + '/_git/' + $repository

git clone $repoUrl