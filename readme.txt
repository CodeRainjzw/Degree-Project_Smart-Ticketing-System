To run the ticket system, you firstly need to prepare the environment. 

You need to install the Docker Desktop for windows, 
the Vscode with plug-in "IBM Blockchain", 
an IDE(eclipse) to run java and jsp, 
the Tomcat server, the Navicat,  
MySQL and 超级扫码枪(super scan QRcode).

Then open the IDE, import the project "ticketSystem" as maven web project and ensure your IDE has maven. 
Install the related dependencies that we provide in pom.xml. 

Next configure build path. Configure the JRE library,  Maven Dependencies,
Server Runtime and Web App Library. 
In Web App Library, you need to add mysql-connector-java-8.0.15.jar that we provide in the folder /java/WebContent/WEB-INF/lib.

Then turn to the database environment. 
Open Navicat and create the database called ticket_system (we provide the database). Then run the ticket_system.sql to fill tables.
(The database user name and password in the file /java/src/javacode/JDBCTool.java must be the same as your own database user name and password.)

Now we start to prepare the Blockchain environment. 
Firstly open the docker and VS Code. Put the ticket-contract that we provide in work station.
Then open the "IBM Blockchain" and find the "smart contract". Pack the ticket-contract and rename it. After that, find the "Fabric Environment".

You can add the template structure of Blockchain or add self-defined structure that we put in the essay. Then deploy the packed contract
in mychannel. After that,find "fabric wallets". Find the wallet icon in it. Right click and choose "export wallet". You will store a folder which 
contains two keys. Store the keys in the "wallet" folder that we provide. 
Now you have finished the environment.

Before running the system, you need to configure some paths in the java code. 

Open the ticketSystem project and open the src/javacode.
In ClientApp.java, set the paths of wallet and the connection.json. Set the contract name that you previously defined. 
e.g. Contract contract = network.getContract("ticket-contract");.  

In the wallet.java, set the path of wallet folder (The wallet folder is in the folder /java/wallet) again.

Please change the path name of several files to the path of placing projects on your computer.  
(They are analysisQRcode.java, ClientApp.java, generateQRcode, wallet.java)

Now it is time to run the system. Please open the MySQL service, docker and super scan QRcode, then run the index.jsp in th WebContent.
Enjoy the ticket system!
