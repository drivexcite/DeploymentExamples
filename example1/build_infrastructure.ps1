$resourceGroup = 'AcrResourceGroup'
$storageAccount = 'acrfunctionappstore'
$webAppPlan = 'AcrLinuxWebAppPlan'
$functionApp = 'HwAcrFunctionApp'
$containerRegistry = 'HwMainContainerRegistry'

az group create --name $resourceGroup --location westus
az storage account create --resource-group $resourceGroup --name $storageAccount --assign-identity --location westus --sku Standard_LRS
az appservice plan create --resource-group $resourceGroup --name $webAppPlan --is-linux --location westus --sku B1
az functionapp create --resource-group $resourceGroup --name $functionApp --plan $webAppPlan --os-type Linux  --runtime node --storage-account $storageAccount
az acr create --resource-group $resourceGroup --name $containerRegistry --admin-enabled --sku Basic 
az configure --defaults acr=$containerRegistry