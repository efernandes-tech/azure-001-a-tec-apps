# azure-001-a-tec-apps

## Notes

1 - Create Resource Groups for project.
2 - Create resource: Virtual machine

    - Size: Standard_B1s
    - Port: SSH (22)
    - Disk: HDD standard

3 - Download key

    azure-001-a-tec-apps-vm_key.pem

4 - Connect via SSH with Putty or Linux:

    chmod 400 azure-001-a-tec-apps-vm_key.pem
    ssh -i azure-001-a-tec-apps-vm_key.pem azureuser@172.190.9.160
    sudo apt-get update
    sudo apt install mysql-client-core-8.0
    mysql --version

5 - Create resource: Server MySQL
5.1 - Connect:

    ssh -i azure-001-a-tec-apps-vm_key.pem azureuser@172.190.9.160
    mysql -h azure-001-a-tec-apps-db.mysql.database.azure.com -u ederson -p
    show databases;

6 - Deploy Web App (Node.js)
6.1 - Connect and Install:

    ssh -i azure-001-a-tec-apps-vm_key.pem azureuser@172.190.9.160
    sudo apt-get update
    sudo apt-get install nodejs
    sudo apt-get install npm
    node --version

6.2 - Create database:

    mysql -h azure-001-a-tec-apps-db.mysql.database.azure.com -u ederson -p
    show databases;
    create database tec_apps_db;
    use tec_apps_db;
    -- Execute: tec_apps_db.sql
    show tables;

6.3 - File config.json

    curl https://caelum-online-public.s3.amazonaws.com/2732-azure-cloud-criando-servidor-banco-dados-receber-aplicacao/config.json -o /tmp/config.json

6.4 - Deploy:

    ssh -i azure-001-a-tec-apps-vm_key.pem azureuser@172.190.9.160
    git clone https://github.com/alura-cursos/1862-sequelize.git
    cd 1862-sequelize/api/config
    vim config.js
    -- Edit configs
    :wq
    cd ../..
    npm install express --save
    npm install
    DEBUG=tec_apps_db:* npm start
    -- VM => Networking => Add port 3000

6.5 - Check:

    curl -I http://172.190.9.160:3000/turmas
    curl http://172.190.9.160:3000/turmas
    -- Chrome: http://172.190.9.160:3000/turmas
