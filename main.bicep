param location string = 'eastus'

param vnetName string = 'vnet-github-demo'

param addressPrefix string = '10.10.0.0/16'

param subnetName string = 'snet-workload'

param subnetPrefix string = '10.10.1.0/24'

resource vnet 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}

output virtualNetworkId string = vnet.id
output virtualNetworkName string = vnet.name
output subnetId string = vnet.properties.subnets[0].id
