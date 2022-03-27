@description('Specifies the location for resources.')
param location string =  resourceGroup().location

@description('App name')
param appname string = 'grabowjtestapp'

resource serverFarm 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: 'grabowjtestfarm'
  location: location  
  sku: {
    name: 'P1v2'
    capacity: 1
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource sites 'Microsoft.Web/sites@2021-03-01' = {
  name: appname
  location: location
  kind: 'app,linux'
  properties: {
    serverFarmId: serverFarm.id
    siteConfig: {
      linuxFxVersion: 'JAVA|11-java11'
    }
  }

  resource staging 'slots' = {
    name: 'staging'
    location: location
    properties: {}
  }

  resource sandbox 'slots' = {
    name: 'sandbox'
    location: location
    properties: {}
  }
}
