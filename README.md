# [Learn Terraform with Azure by Building a Dev Environment – Full Course for Beginners](https://youtu.be/V53AHWun17s)

# [This is my current attempt](https://docs.docker.com/registry/deploying/)
  - along with the fact that the tag includes the host name

    ```docker run -it localhost:5000/my-ubuntu``` 
    
    works


# Currently working on [this](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04) DONE
# Adding a local docker repositoyr
- netextender connection attempt

```netExtender -u user -p password -d 'domain' --always-trust host```


# History from latest session so I can repeat it.

  1.  ```cat /tmp/diditwork```
  1. ```java --version```
  1. ```cat /tmp/diditwork```
  1. ```nodejs```
  1. ```npm```
  1. ```ls```
  1. ```ps```
  1. ```ps -ef```
  1. ```ps -ef | grep apt```
  1. ```cat /tmp/diditwork```
  1. ```sudo apt-get install openjdk-11-jdk -y &&  echo "java11" >> /tmp/diditwork```
  1. ```sudo add-apt-repository ppa:openjdk-r/ppa```
  1. ```sudo add-apt-repository ppa:openjdk-r/ppa -y```
  1. ```sudo apt-get install openjdk-11-jdk -y &&  echo "java11" >> /tmp/diditwork```
  1. ```sudo apt update```
  1. ```java -version```
  1. ```sudo apt-get upgrade```
  1. ```sudo apt-get install openjdk-11-jdk```
  1. ```sudo apt-get install openjdk-11-jdk -y```
  1. ```sudo apt-get update && sudo apt-get upgrade```
  1. ```sudo apt-get install openjdk-17-jdk```
  1. ```sudo apt-get install openjdk-17-jre -y```
  1. ```history```

[https://minikube.sigs.k8s.io/docs/start/](https://minikube.sigs.k8s.io/docs/start/)

[Install and Set Up kubectl on Linux
](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)


For a local docker repository which is necessary for local kubernetes and skaffold setup.
## Setup
- [Install Azure CLI](https://youtu.be/V53AHWun17s?t=165)
- ```az cloud set --name AzureUSGovernment``` sets the cloud environment
- ```az login``` initiates a login process.
- [Terraform extension](https://youtu.be/V53AHWun17s?t=294)
### Also Handy
[This is the Microsoft Azure Government Console Login Link](https://portal.azure.us/
#home)
[Skaffold older versions](https://github.com/GoogleContainerTools/skaffold/releases)
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
  - Security Group Rule is created in this area
## [Security Group Association](https://youtu.be/V53AHWun17s?t=2517)
- Associates security group to subnet

## [A Public IP](https://youtu.be/V53AHWun17s?t=2655)
- Will not have an IP until other resources, I.e. a virtual machine, are provisioned.

## [A Network Interface](https://youtu.be/V53AHWun17s?t=2881)
- Have to add public IP address ID.  Not in the documentation example.

## [A Key Pair](https://youtu.be/V53AHWun17s?t=3189)
- ssh-keygen to create a key pair
- Used by the Linux vm 
- **I actually logged in!!!***

## [Bootstrap Using Custom Data Element](https://youtu.be/V53AHWun17s?t=3477)
- Run the commands in a shell first to make sure they are correct
- Docker is there after ```terraform apply```

## [SSH Config Scripts](https://youtu.be/V53AHWun17s?t=3769)
- files were added in this section

## [Provisioner (local stuff only)](https://youtu.be/V53AHWun17s?t=3975)

- Lightweight and does not affect overall deployment
- Last resort
- Provisioners don't get picked up by state
- So just replace it
- Didn't get this to work because windows stinks:
  ```terraform state list```
  ```terraform apply -replace <RESOURCE_FROM_ABOVE>```

## [Terraform Datasources](https://youtu.be/V53AHWun17s?t=4518)
- Uses the AZ or AWS API
- Not in the terraform state

# Resources
- [Azurerm Docs](https://registry.terraform.io/providers/hashicorp/azurerm/3.59.0)
- [Azure CLI Download](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)
- [Netextender Installation Article](https://www.sonicwall.com/support/knowledge-base/how-can-i-download-and-install-netextender-on-linux/180105195559153/)

- [Azure Government Documentation](https://learn.microsoft.com/en-us/azure/azure-government/documentation-government-get-started-connect-with-cli)
- [Windows script tpl file\()https://youtu.be/V53AHWun17s?t=3889]
    ```ssh-keygen -t rsa  ```


- [Java install ](https://www.linuxcapable.com/how-to-install-openjdk-17-on-ubuntu-linux/)

URL: https://portal.azure.us/#home
evansc.dev@axientcorp.onmicrosoft.us

```az cloud set --name AzureUSGovernment``` sets the cloud environment.

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

## Linux Tidbits
To change java version: ```sudo update-alternatives --config java```