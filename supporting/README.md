# Supporting: Running a local metaresolver

## Outline

This shows how a Bioregistry resolver can be used to resolve prefixed DRS ids.

## Tutorial

GitHub Repository: https://github.com/biopragmatics/Bioregistry

### **Installation:**

Follow the install instructions [here](https://github.com/biopragmatics/Bioregistry#-installation), using the "development mode for local curation" option.

 As described [here](https://github.com/biopragmatics/Bioregistry#%EF%B8%8F-resolver-app), add the web installation and start the web application locally.

Check the port on which Bioregistry starts, and use that in all calls to Bioregistry.

Note that by default Bioregistry starts on port 5000, which appears to be default port for the DRS server. Take care in the order in which you start services, note port numbers and adjust examples shown here as appropriate. In the following examples we will assume Bioregistry is running on port 5010.

### **Check resolution of regular DRS ids**

Your local Bioregistry should resolve any DRS prefix that has been registered in identifiers.org

For example, http://localhost:5010/4dfc:dg.4dfc:098e18d4-5ece-4bc6-9a79-68f5082da9bc

### Add a prefix for your DRS server to the local registry

Add an entry to the Bioregistry/exports/registry/registry.json file following this patten

 `"`mydrs": {`
   `"description": "Local DRS Server",`
   `"example": "81944ba1",`
   `"homepage": "https://localhost",`
   `"name": "My local DRS server",`
   `"pattern": ".*",`
   `"sampleId": "81944ba1",`
   "uri_format": "https://localhost:5000/ga4gh/drs/v1/objects/$1" }`

You should use values specific to your DRS server as follows:

- "example", and "sampleid": a drs id on your local server
- "uri_format": substitute the port on which your DRS server is running. 5000 is shown in the example. 
- "pattern": optionally add a regex pattern for your ids - not required
- Edit description and name if you like

#### Restart Bioregistry web

Your local Bioregistry should now give you a DRS response to your local DRS ids.  

http://localhost:5010:mydrs:81944ba1



