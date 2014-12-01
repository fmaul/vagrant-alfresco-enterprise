vagrant-alfresco-enterprise
===========================

Creates a linux VM with vagrant, downloads, installs and runs the lastest Alfresco enterprise build

VM
---
- Uses Vagrant Vitualbox provider
- Creates a VM based on Ubuntu Trusty 64bit
- VM with 4 CPUs, 4GB of memory
- Alfresco is exposed to **local port 8080**

Alfresco Setup
---
- Standard Alfresco installation with PostgresQL
- Admin login defaults to admin:admin
- Install location: /opt/alfresco

Usage
---
- Checkout using 
    
        git clone https://github.com/fmaul/vagrant-alfresco-enterprise.git

- Download the alfresco linux installation file
        
        alfresco-enterprise-5.0-installer-linux-x64.bin
    
  from  
	
		https://myalfresco.force.com/support 
  
  and put it into the vagrant-alfresco-enterprise folder.
		
- Start the vagrant VM

        vagrant up
        
- Wait 5-10 minutes for Alfresco being available at

        http://localhost:8080/
        





