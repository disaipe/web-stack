# Web stack: Evolution CMS

> Basic Evolution CMS installation script

:exclamation: Backup your *data* and *src* folders before continue!

1. Start installation script
```bash
sudo ./install.sh
```
2. Start services
```bash
docker-compose -d lamp
```
3. Open configured address in your browser, e.g. http://localhost:5001
4. You must see Evolution CMS installation page
5. On database options page set up you MariaDB connection from `.env` file and continue installation
	- **Server**: mariadb
	- **User**: *DB_USER* value
	- **Password**: *DB_USER_PASSWORD* value
	- **Database**: *DB_DATABASE* value
6. Create admin user and choose template
7. On *"Check before installation"* page create empty configuration file:
```bash
sudo ./create_config.sh
```
8. After installation run script:
```bash
sudo ./post_install.sh
```
9. Evolution CMS ready to work!