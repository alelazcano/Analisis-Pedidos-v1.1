mkdir -p ../bbdd
chmod 777 ../bbdd
docker stop analisis-pedidos-phpMyAdmin
docker rm  analisis-pedidos-phpMyAdmin
docker stop analisis-pedidos-www
docker rm  analisis-pedidos-www
docker stop analisis-pedidos-bbdd
docker rm  analisis-pedidos-bbdd





docker run -d -p 7071:3306 -v /home/MTTO-TIENDA/Analisis-Pedidos/bbdd:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=vmsn2004 -e MYSQL_DATABASE=RN_AnalisisPedidos -e MYSQL_USER=victor -e MYSQL_PASSWORD=vmsn2004 --name analisis-pedidos-bbdd -h db-analisispedidos mysql:5.7 --default-authentication-plugin=mysql_native_password
docker run -d -p 7070:80 -v /home/MTTO-TIENDA/Analisis-Pedidos/www:/var/www/html --name analisis-pedidos-www -h analisispedidos --link analisis-pedidos-bbdd:db vicsoft01/ubuntu18.04-apache2.2-php7.3.11
docker run -d -p 7072:80 --name analisis-pedidos-phpMyAdmin -h admin-db-analisispedidos --link analisis-pedidos-bbdd:db phpmyadmin/phpmyadmin


