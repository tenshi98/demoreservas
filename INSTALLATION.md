# Guía de Instalación y Configuración

Este documento contiene las instrucciones necesarias para la configuración inicial, importación de base de datos y despliegue seguro del proyecto **Plataforma coreEngine / Sistema Reservas**.

---

## Tabla de Contenidos

- [1. Importación de la Base de Datos (sistemas_reservas.sql)](#1-importación-de-la-base-de-datos-sistemas_reservassql)
- [2. Configuración de la Aplicación (ConfigAPP.php)](#2-configuración-de-la-aplicación-configappphp)
- [3. Configuración de Base de Datos (ConfigData.php)](#3-configuración-de-base-de-datos-configdataphp)
- [4. Configuración de Correo Electrónico (ConfigMail.php)](#4-configuración-de-correo-electrónico-configmailphp)
- [5. Configuración Segura de Permisos de Almacenamiento (upload)](#5-configuración-segura-de-permisos-de-almacenamiento-upload)
- [6. Verificación Final](#6-verificación-final)

---

## 1. Importación de la Base de Datos (`sistemas_reservas.sql`)

Ubicación del archivo de respaldo SQL:
`bbdd/sistemas_reservas.sql`

Antes de configurar la aplicación, se debe crear e importar el esquema y los datos iniciales de la base de datos en el servidor MySQL / MariaDB.

### Pasos de Importación:

1. **Creación de la Base de Datos:**
   Conéctate a tu servidor MySQL a través de la terminal o tu gestor de base de datos preferido (phpMyAdmin, DBeaver, MySQL Workbench) y crea la base de datos vacía utilizando el cotejamiento `utf8mb4`:
   ```sql
   CREATE DATABASE IF NOT EXISTS `sistemas_reservas` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

2. **Ejecución de la Importación:**

   - **Vía Terminal / Línea de Comandos (Linux / macOS / Windows):**
     Navega a la raíz del proyecto y ejecuta el comando de importación:
     ```bash
     mysql -u [usuario_mysql] -p sistemas_reservas < bbdd/sistemas_reservas.sql
     ```
     *(Reemplaza `[usuario_mysql]` por tu usuario con privilegios de administración, por ejemplo `root`).*

   - **Vía Entornos Docker:**
     Si estás corriendo MySQL dentro de un contenedor Docker, puedes ejecutar:
     ```bash
     docker exec -i [nombre_o_id_contenedor_mysql] mysql -u root -p[contraseña] sistemas_reservas < bbdd/sistemas_reservas.sql
     ```

   - **Vía phpMyAdmin / Herramientas Gráficas:**
     1. Accede a phpMyAdmin y selecciona la base de datos `sistemas_reservas`.
     2. Haz clic en la pestaña **Importar** (*Import*).
     3. Selecciona el archivo `bbdd/sistemas_reservas.sql` ubicado en la carpeta del proyecto.
     4. Haz clic en **Continuar** (*Go*) para procesar las tablas y datos del sistema.

---

## 2. Configuración de la Aplicación (`ConfigAPP.php`)

Ubicación del archivo:
`plataforma/sistemas_reservas/app/config/ConfigAPP.php`

Este archivo centraliza la configuración global del software, parámetros de seguridad contra ataques de fuerza bruta y la selección del proveedor para almacenamiento de archivos (upload driver).

### Pasos de Modificación:

1. **Datos del Software (`const SOFTWARE`):**
   - `SoftwareName`: Ajustar el nombre comercial de la aplicación.
   - `CompanyName` y `CompanyEmail`: Ingresar la razón social y correo electrónico corporativo.
   - `URL`: **[CRÍTICO]** Establecer la URL pública absoluta donde responderá la plataforma (debe incluir el protocolo `http://` o `https://` y la barra final `/`), por ejemplo: `https://mi-dominio.com/sistemas_reservas/public/`.

2. **Parámetros Generales de la Aplicación (`const APP`):**
   - `N_MaxItems`: Número máximo de registros a retornar en consultas antes de aplicar paginación (valor por defecto: `2000`).
   - `checkBruteConections`: Número máximo de intentos fallidos de inicio de sesión permitidos antes de aplicar un baneo temporal de 5 horas a la IP (valor recomendado: `5`).
   - `checkBruteMaxConections`: Umbral máximo de reincidencia de intentos fallidos antes de enviar la IP a la lista negra (*blacklist*) a nivel de servidor (valor recomendado: `20`).

3. **Proveedor de Almacenamiento de Archivos (`uploadServer`):**
   Configurar el driver de subida en la clave `'uploadServer'`. Los valores permitidos son:
   - `'local'`: Almacenamiento directo en el disco del servidor.
   - `'s3'`: Amazon S3 o servicios compatibles (MinIO, DigitalOcean Spaces, Cloudflare R2, Cloudflare, Backblaze B2, Wasabi).
   - `'gcs'`: Google Cloud Storage.
   - `'sftp'`: Servidor de archivos remoto vía SFTP/SSH.

4. **Configuración del Driver Seleccionado:**
   - **Para `uploadServer => 'local'`:**
     - `uploadFolder`: Ruta absoluta en el disco del servidor donde se guardarán los archivos.
     - `uploadUrl`: URL base pública para acceder a los archivos subidos.
   - **Para `uploadServer => 's3'`:**
     - Completar `s3Key`, `s3Secret`, `s3Region`, `s3Bucket`, `s3Prefix`, `s3Endpoint` (si aplica), `s3Acl`, `s3UrlSigned` y `s3UrlExpiry`.
   - **Para `uploadServer => 'gcs'`:**
     - Ingresar `gcsProjectId`, `gcsKeyFile` (ruta al archivo JSON de cuenta de servicio), `gcsBucket`, `gcsPrefix`, `gcsUrlSigned` y `gcsUrlExpiry`.
   - **Para `uploadServer => 'sftp'`:**
     - Especificar `sftpHost`, `sftpPort` (22), `sftpUser`, `sftpPassword` o `sftpPrivateKey`, `sftpBasePath` y `sftpBaseUrl`.

---

## 3. Configuración de Base de Datos (`ConfigData.php`)

Ubicación del archivo:
`plataforma/sistemas_reservas/app/config/ConfigData.php`

En este archivo se especifican las credenciales para la conexión persistente con el motor de base de datos MySQL (u otros motores soportados).

### Pasos de Modificación:

1. **Conexión Principal de Administración (`const MySQL_ADMIN`):**
   Modificar los valores asociativos con las credenciales correspondientes a la base de datos principal:
   - `HOSTNAME`: Dirección del servidor de BD (ej. `localhost`, `127.0.0.1` o nombre del contenedor Docker como `database`).
   - `USERNAME`: Usuario de la base de datos con permisos de lectura/escritura/DDL.
   - `PASSWORD`: Contraseña del usuario de la base de datos.
   - `DATABASE`: Nombre de la base de datos (ej. `sistemas_reservas`).
   - `CHARSET`: Juego de caracteres (se recomienda usar `'utf8mb4'`).
   - `PORT`: Puerto de conexión TCP de MySQL (por defecto `3306`).

2. **Conexión Principal de Aplicación (`const MySQL_1`):**
   - Configurar los mismos parámetros (`HOSTNAME`, `USERNAME`, `PASSWORD`, `DATABASE`, `CHARSET`, `PORT`) para la conexión estándar utilizada por las consultas de los controladores.

3. **Otras Bases de Datos (Opcional):**
   - Si la aplicación utiliza motores adicionales, ajustar `PostGreSQL_1`, `SQLite_1` (ruta absoluta al archivo `.sqlite`), `MongoDB_1`, `Jig_1` o `Redis_1`.

---

## 4. Configuración de Correo Electrónico (`ConfigMail.php`)

Ubicación del archivo:
`plataforma/sistemas_reservas/app/config/ConfigMail.php`

Este archivo contiene las credenciales de los servicios de mensajería y correo transaccional utilizados para notificaciones, recuperación de contraseñas y avisos del sistema.

### Pasos de Modificación:

1. **Servidor SMTP Estándar (`const SMTPSender`):**
   - `SERVERURL`: Host del servidor SMTP (ej. `smtp.titan.email` o `mail.tu-dominio.com`).
   - `SERVERPORT`: Puerto SMTP (ej. `465` para SSL o `587` para TLS).
   - `SERVERSECURE`: Tipo de cifrado (`'SSL'` o `'TLS'`).
   - `USEREMAIL`: Dirección de correo emisor (ej. `contacto@tu-dominio.com`).
   - `USERNAME`: Usuario para autenticación SMTP.
   - `PASSWORD`: Contraseña de la cuenta de correo.

2. **Servidor Gmail (`const GmailSender`):**
   - `SERVERURL`: `'smtp.gmail.com'`
   - `SERVERPORT`: `465`
   - `SERVERSECURE`: `'SSL'`
   - `USEREMAIL`: Cuenta corporativa de Gmail / Google Workspace.
   - `USERNAME`: Nombre de usuario de la cuenta.
   - `PASSWORD`: Contraseña de aplicación generada desde la seguridad de la cuenta de Google.

3. **Servidor Sendinblue / Brevo (`const SendingBlueSender`):**
   - `SERVERURL`: `'https://api.brevo.com/v3/smtp/email'`
   - `SERVERAPI`: Clave API (API Key v3) obtenida del panel de Brevo/Sendinblue.

---

## 5. Configuración Segura de Permisos de Almacenamiento (`upload`)

Ubicación del directorio:
`plataforma/sistemas_reservas/public/upload`

Para prevenir vulnerabilidades de ejecución arbitraria de archivos o denegación de servicio, la carpeta de subidas de archivos debe configurarse siguiendo el principio de mínimos privilegios.

> [!CAUTION]
> **NUNCA asignes permisos `777` (`chmod -R 777`) en entornos de producción.** Asignar permisos `777` permite que cualquier usuario o proceso del sistema pueda modificar o inyectar código malicioso ejecutable.

### Pasos para Configurar Permisos de Forma Segura en Linux:

1. **Asignar la Propiedad al Usuario del Servidor Web:**
   Identifica el usuario bajo el cual se ejecuta el proceso del servidor web (comúnmente `www-data` en Ubuntu/Debian, o `apache`/`nginx` en RHEL/CentOS).

   Ejecuta el siguiente comando para cambiar el propietario y grupo de la carpeta:
   ```bash
   sudo chown -R www-data:www-data plataforma/sistemas_reservas/public/upload
   ```

2. **Establecer Permisos Correctos a Directorios:**
   Los directorios dentro de `upload/` deben tener permisos `755` (lectura, escritura y ejecución únicamente para el propietario; lectura y ejecución para grupo y otros):
   ```bash
   sudo find plataforma/sistemas_reservas/public/upload -type d -exec chmod 755 {} \;
   ```

3. **Establecer Permisos Correctos a Archivos:**
   Los archivos contenidos en `upload/` deben tener permisos `644` (lectura y escritura para el propietario; solo lectura para grupo y otros):
   ```bash
   sudo find plataforma/sistemas_reservas/public/upload -type f -exec chmod 644 {} \;
   ```

4. **Protección Contra Ejecución de Scripts (Seguridad Adicional):**
   Para impedir que un atacante suba un archivo PHP o script ejecutable y lo invoque vía web:

   - **Servidores Apache:** Verifica o crea un archivo `.htaccess` en `plataforma/sistemas_reservas/public/upload/` con las siguientes directivas para deshabilitar el motor PHP en dicha carpeta:
     ```apache
     <FilesMatch "\.(php|php3|php4|php5|phtml|pl|py|jsp|asp|sh|cgi)$">
         Require all denied
     </FilesMatch>
     php_flag engine off
     ```

   - **Servidores Nginx:** En el archivo de configuración del sitio (`/etc/nginx/sites-available/default`), añade la siguiente regla dentro del bloque `server`:
     ```nginx
     location ~ ^/sistemas_reservas/public/upload/.*\.php$ {
         deny all;
         return 404;
     }
     ```

---

## 6. Verificación Final

Una vez realizadas las modificaciones:

1. Verifica que no existan errores de sintaxis en los archivos `.php` editados:
   ```bash
   php -l plataforma/sistemas_reservas/app/config/ConfigAPP.php
   php -l plataforma/sistemas_reservas/app/config/ConfigData.php
   php -l plataforma/sistemas_reservas/app/config/ConfigMail.php
   ```
2. Accede a la URL de la aplicación desde un navegador web y comprueba el correcto inicio de sesión y la subida de archivos de prueba.
