## objectscript-package-template
T# Ensemble-Interface-DiskSpace-Test
A framework to test for disk space consumption for Ensemble interfaces. 

It has a dual purpose - 
To aid in estimating the required disk space interfaces will consume (both database file growth and journal files) 
As well as verifying the Ensemble Purge mechanism will indeed clean out all the interfaces' related data 

See class reference (specifically of the InterfaceDiskSpace.Main class) for documentation and usage guidelines

Here is a sample Output -
You can see for example it points out an issue with certain persistent entities referenced by Web Service responses that are not deleted by default by the Purge process.
```
ENSEMBLE>write ##class(InterfaceDiskSpace.Main).PreTestRun(.runId)
 
Stopping Production...
 
17:17:30.986:Ens.Director: StopProduction initiated.
17:17:30.986:Ens.Job: System is quiescent
17:17:30.986:Ens.Job: Requesting all jobs to terminate ...
17:17:31.005:Ens.Director: Production 'Test.WSTimeouts.Production' stopped.
Cleaning Production...
Confirm cleaning data <y/n>?
y
Purging...
 
Purged:
deleteCounts=""
deleteCounts("Bitmap Chunks")=0
deleteCounts("Business Processes")=0
deleteCounts("Business Rule Logs")=0
deleteCounts("Ensemble Messages")=0
deleteCounts("Event Logs")=11
deleteCounts("Host Monitor Data")=31
deleteCounts("I/O Logs")=0
deleteCounts("Managed Alerts")=0
deleteCounts("Message Bodies")=0
 
Switching Journal...
Capturing data...
1
ENSEMBLE>write ##class(InterfaceDiskSpace.Main).TestSummary(runId)
1
ENSEMBLE>write ##class(InterfaceDiskSpace.Main).PurgeTest(runId,1)
 
 
Purged:
deleteCounts=""
deleteCounts("Bitmap Chunks")=0
deleteCounts("Business Processes")=0
deleteCounts("Business Rule Logs")=0
deleteCounts("Ensemble Messages")=102
deleteCounts("Event Logs")=33
deleteCounts("Host Monitor Data")=9
deleteCounts("I/O Logs")=0
deleteCounts("Managed Alerts")=0
deleteCounts("Message Bodies")=101
 
1
ENSEMBLE>write ##class(InterfaceDiskSpace.Main).Report(runId)
 
 
Data Usage Report
===========================
 
Database file size used: 1
Journal file size used: 0
Journal space used: 325108
 
Globals growth
----------------------
Ens.MessageBodyD                                                                     .007
Ens.MessageHeaderD                                                                   .02
Ens.MessageHeaderI                                                                   .003
Ens.Util.LogD                                                                        .004
ITest.Proxy.s0.AddressD            ITest.Proxy.s0.Address.cls                        .004
ITest.Proxy.s0.PersonD             ITest.Proxy.s0.Person.cls                         .003
 
Journal Profile
----------------------
Ens.ActiveMessage                                                                    26184
Ens.BusinessProcessD                                                                 3308
Ens.BusinessProcessI                                                                 1456
Ens.Configuration                                                                    424
Ens.JobRequest                                                                       132
Ens.JobStatus                                                                        112
Ens.MessageBodyD                                                                     19508
Ens.MessageHeaderD                                                                   34624
Ens.MessageHeaderI                                                                   89540
Ens.Queue                                                                            37996
Ens.Runtime                                                                          50920
Ens.Suspended                                                                        100
Ens.Util.LogD                                                                        10404
Ens.Util.LogI                                                                        12248
ITest.Proxy.s0.AddressD            ITest.Proxy.s0.Address.cls                        16096
ITest.Proxy.s0.PersonD             ITest.Proxy.s0.Person.cls                         8624
 
Globals remaining after purge
----------------------
ITest.Proxy.s0.AddressD            ITest.Proxy.s0.Address.cls                        .004
ITest.Proxy.s0.PersonD             ITest.Proxy.s0.Person.cls                         .003
1
```

## Installation 

Clone/git pull the repo into any local directory



Or using ZPM
```
IRISAPP>zpm

zpm: IRISAPP> install interfaces-diskspace-validation
```

## How to Test it

See sample above


## How to start coding
This repository is ready to code in VSCode with ObjectScript plugin.
Install [VSCode](https://code.visualstudio.com/) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugin and open the folder in VSCode.



## What's insde the repo

# Dockerfile

The simplest dockerfile which starts IRIS and imports Installer.cls and then runs the Installer.setup method, which creates IRISAPP Namespace and imports ObjectScript code from /src folder into it.
Use the related docker-compose.yml to easily setup additional parametes like port number and where you map keys and host folders.
Use .env/ file to adjust the dockerfile being used in docker-compose.
It also installs ZPM - ObjectScript Package Manager client

# module.xml

This file describes project to be installed as package in ObjectScript Package Manager. 

# .vscode/settings.json

Settings file to let you immedietly code in VSCode with [VSCode ObjectScript plugin](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript))

# .vscode/launch.json
Config file if you want to debug with VSCode ObjectScript

# src/cls/InterfaceDiskSpace
Classes to run collection and reporting process.

# src/cls/InterfaceDiskSpace/Test
Test related classes