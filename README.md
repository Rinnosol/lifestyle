# lifestyle - How to deploy

1. Download and Install python, pip , mysql server, mysql workbench and git.

python - https://www.python.org/downloads/ 
mysql community server : https://dev.mysql.com/downloads/windows/installer/8.0.html (mysql username and password : root / root )
mysql workbench - https://dev.mysql.com/downloads/workbench/
git - https://git-scm.com/downloads
pip - curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py   and after that run python get-pip.py

2. Ensure system env path are set properly for all the above installed software.

   C:\Program Files\MySQL\MySQL Server 8.0
   C:\Users\<yourusername>\AppData\Local\Programs\Python\Python313\Scripts
   C:\Users\<yourusername>\AppData\Local\Programs\Python\Python313

4. Check for installed versions in cmd:

mysql --version
python --version
pip --version

4. Add required dependencies by running following command :
   pip install flask requests mysql.connector bcrypt pymysql cryptography

5. download the application from git using command : git clone https://github.com/Rinnosol/lifestyle.git

6. Open Mysql workbench and Create database lifestyle using sql statement : Create database lifestyle
   
7. Import the lifestyle.sql schema file in the mysql D server using mysql workbench - data import
8. Ensure all services are running .
