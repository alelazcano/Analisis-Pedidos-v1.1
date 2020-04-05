# Analisis-Pedidos-v1.1

## Pasos para el despliegue incial

### Clonar el código que corresponda ###

```bash 
git clone https://github.com/usuarioregalonatural/Analisis-Pedidos-v1.1.git 
```

### renombrar el directorio: ### 
```bash 
mv Analisis-Pedidos-v1.1 Analisis-Pedidos
```
### Modificaciones de entorno ### 
Según el entorno, procederemos a modificar el fichero de configuracion general:
```bash 
/home/MTTO-TIENDA/Analisis-Pedidos/conf/configuracion.conf
```
solo habrá que modificar esta variable según entorno:
- Preproduccion
```php 
ruta_mysql_origen="/home/PREPRODUCCION/regalonatural.es/tienda/prod-bbdd"
```
- Produccion
```php 
ruta_mysql_origen="/home/PRODUCCION/regalonatural.com/tienda/prod-bbdd"
```
### Modificaciones de Conexión ### 
también hay que modificar le siguiente archivo:

```bash 
/home/MTTO-TIENDA/Analisis-Pedidos/www/model/conexionPDOWeb.php
```
según entorno, comentando o descomentando:

- local 
```php 
// LOCAL //
//    private $usuario = 'victor';
//    private $clave = 'vmsn2004';
//   private $server ='localhost:3306'; // Local
```

-Preproduccion
```php 
//PREPRODUCCION
    private $usuario = 'root';
    private $clave = 'vmsn2004';
    private $server ='regalonatural.es:7071'; // Produccion
```
-Produccion
```php 
//PRODUCCION
    private $usuario = 'root';
    private $clave = 'vmsn2004';
    private $server ='regalonatural.com:7071'; // Produccion
```
### Ejecución Instalacion ### 
Desde 
```bash
/home/MTTO-TIENDA/Analisis-Pedidos/docker/
```
```bash
./01-Instala.sh
```
### Crontab para ejecutar periodicamente ### 
```bash
*/25 * * * * /bin/bash /home/MTTO-TIENDA/Analisis-Pedidos/recupera_pedidos.sh
```

