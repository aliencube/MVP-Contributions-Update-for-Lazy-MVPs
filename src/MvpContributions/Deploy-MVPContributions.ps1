# This deploys a series of ARM templates to the designated resource group

Param(
    [string] [Parameter(Mandatory=$true)] $SubscriptionName,
    [string] [Parameter(Mandatory=$true)] $ResourceGroupName,
    [string] [Parameter(Mandatory=$true)] $ResourceGroupLocation,
    [securestring] [Parameter(Mandatory=$true)] $ApiKey
)

# Login to Azure
Login-AzureRmAccount -Subscription $SubscriptionName

# Create a Resource Group
Write-Host "Creating Resource Group..."

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation -Force

# Create a Custom Connector for MVP API

Write-Host "Creating MVP API Custom Connector..."

New-AzureRmResourceGroupDeployment -Name MVPContribution -ResourceGroupName $ResourceGroupName `
    -TemplateFile ./mvp-contributions-connector.json `
    -TemplateParameterFile ./mvp-contributions-connector.parameters.json `
    -Verbose

# Create connectors
Write-Host "Creating MVP Contribution Connector..."

New-AzureRmResourceGroupDeployment -Name MVPContribution -ResourceGroupName $ResourceGroupName `
    -TemplateFile ./connector-mvpcontributions.json `
    -TemplateParameterFile ./connector-mvpcontributions.parameters.json `
    -Verbose

Write-Host "Creating Excel (Online) Connector..."

New-AzureRmResourceGroupDeployment -Name MVPContribution -ResourceGroupName $ResourceGroupName `
    -TemplateFile ./connector-excel.json `
    -TemplateParameterFile ./connector-excel.parameters.json `
    -Verbose

Write-Host "Creating One Drive Connector..."

New-AzureRmResourceGroupDeployment -Name MVPContribution -ResourceGroupName $ResourceGroupName `
    -TemplateFile ./connector-onedrive.json `
    -TemplateParameterFile ./connector-onedrive.parameters.json `
    -Verbose

# Create Logic Apps
Write-Host "Creating Logic Apps to Get Contribution Areas..."

New-AzureRmResourceGroupDeployment -Name MVPContribution -ResourceGroupName $ResourceGroupName `
    -TemplateFile ./mvp-contributions-contribution-areas.json `
    -TemplateParameterFile ./mvp-contributions-contribution-areas.parameters.json `
    -Verbose `
    -connectorApiKey $ApiKey

Write-Host "Creating Logic Apps to Get Contribution Types..."

New-AzureRmResourceGroupDeployment -Name MVPContribution -ResourceGroupName $ResourceGroupName `
    -TemplateFile ./mvp-contributions-contribution-types.json `
    -TemplateParameterFile ./mvp-contributions-contribution-types.parameters.json `
    -Verbose `
    -connectorApiKey $ApiKey

Write-Host "Creating Logic Apps to Get Contributions from Excel..."

New-AzureRmResourceGroupDeployment -Name MVPContribution -ResourceGroupName $ResourceGroupName `
    -TemplateFile ./mvp-contributions-excel.json `
    -TemplateParameterFile ./mvp-contributions-excel.parameters.json `
    -Verbose

Write-Host "Creating Logic Apps to Get Contributions from Site..."

New-AzureRmResourceGroupDeployment -Name MVPContribution -ResourceGroupName $ResourceGroupName `
    -TemplateFile ./mvp-contributions-site.json `
    -TemplateParameterFile ./mvp-contributions-site.parameters.json `
    -Verbose `
    -connectorApiKey $ApiKey

Write-Host "Creating Logic Apps to Upload Contributions..."

New-AzureRmResourceGroupDeployment -Name MVPContribution -ResourceGroupName $ResourceGroupName `
    -TemplateFile ./mvp-contributions-main.json `
    -TemplateParameterFile ./mvp-contributions-main.parameters.json `
    -Verbose `
    -connectorApiKey $ApiKey
