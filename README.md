# [Learn Terraform with Azure by Building a Dev Environment – Full Course for Beginners](https://youtu.be/V53AHWun17s)
## Setup
- [Install Azure CLI](https://youtu.be/V53AHWun17s?t=165)
- ```az cloud set --name AzureUSGovernment``` initiates a login process.
- [Terraform extension](https://youtu.be/V53AHWun17s?t=294)
## [Resource Group](https://youtu.be/V53AHWun17s?t=686)
- [Terraform backend is local! (for now)](https://youtu.be/V53AHWun17s?t=592)
    - the provider is a compiled GO file
    [The .terraform.lock.hcl assures this will run.  Commit this to your repository](./terraform-azure/.terraform.lock.hcl)
- [Terraform init only cares about provider stuff](https://youtu.be/V53AHWun17s?t=691)
    - not sufficient for testing your code
- [Resource Group](https://youtu.be/V53AHWun17s?t=729)
    - Read the notes
- [terraform plan](https://youtu.be/V53AHWun17s?t=909)    
## [Virtual Network](https://youtu.be/V53AHWun17s?t=686)
- [Standalone Network Resource](https://youtu.be/V53AHWun17s?t=1073)
    - [Referencing another resources creates an implicit dependency ](https://youtu.be/V53AHWun17s?t=1243)
## [All Hail Terraform State!](https://youtu.be/V53AHWun17s?t=1411)
- [State should be stored remotely ](https://youtu.be/V53AHWun17s?t=1481)
- [A better way to see state](https://youtu.be/V53AHWun17s?t=1558)
    - ```terraform state list```
## [DESTROY!!!!](https://youtu.be/V53AHWun17s?t=1658)
## [Subnet](https://youtu.be/V53AHWun17s?t=1829)
## [Security Group](https://youtu.be/V53AHWun17s?t=2161)
# Resources
- [Azure CLI Download](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)

- [Azure Government Documentation](https://learn.microsoft.com/en-us/azure/azure-government/documentation-government-get-started-connect-with-cli)


URL: https://portal.azure.us/#home
evansc.dev@axientcorp.onmicrosoft.us

```az cloud set --name AzureUSGovernment``` initiates a login process.

Yielded this:
```
[
  {cd   
    "cloudName": "AzureUSGovernment",
    "homeTenantId": "3ffbc5ec-b740-451c-ab2d-36a9f55bfa3c",
    "id": "ea7bd72c-c0b0-4a15-9ceb-4474dbd32bd7",
    "isDefault": true,
    "managedByTenants": [],
    "name": "Azure Government Enterprise - RIMFIRE",
    "state": "Enabled",
    "tenantId": "3ffbc5ec-b740-451c-ab2d-36a9f55bfa3c",
    "user": {
      "name": "evansc.dev@axientcorp.onmicrosoft.us",
      "type": "user"
    }
  }
]
```