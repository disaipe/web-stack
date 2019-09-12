# Web stack: Wordpress

> Basic Wordpress installation script

:exclamation: Backup your *data* and *src* folders before continue!

1. Start installation script
```bash
sudo ./install.sh
# or for russian language
sudo ./install.sh ru
```
2. Start services
```bash
docker-compose -d lamp
```
3. Open configured address in your browser, e.g. http://localhost:5001
4. You must see Wordpress installation page
5. On database options page set up you MariaDB connection from `.env` file and continue installation
	- **Database Name**: *DB_DATABASE* value
	- **Username**: *DB_USER* value
	- **Password**: *DB_USER_PASSWORD* value
	- **Database Host**: mariadb
6. Set site title and create admin user
7. Wordpress ready to work!