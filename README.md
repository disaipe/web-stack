# Web stack: Bitrix

> Basic Bitrix installation script

:exclamation: Backup your *data* and *src* folders before continue!

1. Start installation script
```bash
sudo ./install.sh
```
2. Start services
```bash
docker-compose -d lemp
```
3. Open configured address in your browser, e.g. http://localhost:5001
4. You must see Bitrix installation script
5. Choose Bitrix distro and continue installation
6. On database options page set up you MariaDB connection from `.env` file and continue installation
	- **Server**: mariadb
	- **User**: *DB_USER* value
	- **Password**: *DB_USER_PASSWORD* value
	- **Database**: *DB_DATABASE* value
7. Create admin user and choose template
8. Bitrix ready to work!