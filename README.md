# Plataforma Reservas

Demo de funcionalidad de la plataforma de reservas

---

## Tabla de Contenidos

- [Resumen de la Plataforma](#resumen-de-la-plataforma)
- [Requisitos del Sistema](#requisitos-del-sistema)
- [Demo Plataforma](#demo-plataforma)
- [Stack Tecnológico](#stack-tecnológico)
- [Arquitectura y Patrones de Diseño](#arquitectura-y-patrones-de-diseño)
- [Estrategia de Seguridad](#estrategia-de-seguridad)
- [¿Por qué Fat-Free Framework?](#porque-fat-free-y-no-otro)
- [Configuraciones](#configuraciones)
- [Estructura de Carpetas del Proyecto](#estructura-de-carpetas-del-proyecto)
- [Tecnologías Frontend](#tecnologías-frontend)
- [Tecnologías Backend](#tecnologías-backend)
  - [Controladores (controller)](#controladores-vendorsapplicationcontroller)
  - [Funciones Helper (functions)](#funciones-helper-vendorsapplicationfunctions)
  - [Modelos del Sistema (models)](#modelos-del-sistema-vendorsapplicationmodels)
  - [Librerías y SDKs Externos (libs)](#librerías-y-sdks-externos-vendorslibs)
- [Escalabilidad del Sistema](#escalabilidad-del-sistema)
  - [Crecimiento Significativo del Volumen de Usuarios](#crecimiento-significativo-del-volumen-de-usuarios)
  - [Integración con Sistemas Institucionales Existentes](#integración-con-sistemas-institucionales-existentes)
- [Operación y Soporte](#operación-y-soporte)
  - [Control de Cambios](#control-de-cambios)
  - [Respaldo de Información y Recuperación (Backup & DRP)](#respaldo-de-información-y-recuperación-backup--drp)

---

## Resumen de la Plataforma

Plataforma Básica enfocada al manejo e interacción con los distintos módulos instalados, algunos independientes de otros, y otros dependientes de la instalación de otros módulos.

Esta plataforma está diseñada específicamente para **pequeñas y medianas empresas (PyMEs)** con infraestructura de alojamiento estándar, compatible con entornos **LAMP/LEMP** (servidores **Apache o Nginx**, **PHP** y **MySQL**).

---

## Requisitos del Sistema

Para desplegar y ejecutar correctamente la plataforma, el servidor debe cumplir con los siguientes requisitos:

- **Servidor Web:** Apache 2.4+ o Nginx (con el módulo de reescritura de URLs `mod_rewrite` habilitado).
- **Entorno PHP:** PHP 8.0 o superior.
- **Base de Datos:** MySQL 5.7+ / MariaDB 10.3+ (soporte nativo ampliable a PostgreSQL, SQLite, MongoDB o Redis).
- **Extensiones PHP Requeridas:**
  - `pdo` y `pdo_mysql`: Para la conexión y gestión persistente de base de datos.
  - `gd`: Para el procesamiento, redimensionamiento y recorte de imágenes.
  - `curl`: Para integraciones HTTP, servicios de mail y APIs externas.
  - `mbstring`: Manejo de cadenas de texto multibyte y codificaciones UTF-8.
  - `openssl`: Para cifrado seguro y generación de tokens de seguridad.
  - `json`: Procesamiento de respuestas JSON y tokens JWT.
  - `fileinfo`: Validación de tipos MIME en la subida segura de archivos.

---

## Demo Plataforma

| Dato | Descripción |
|-----------|-------------|
| URL Demo | [demoreservas.digitalcreations.cl](https://demoreservas.digitalcreations.cl/) |

| Usuario | Contraseña | Rol |
|-----------|-------------|-------------|
| admin@test.cl | 1234 | Super Administrador (permite ver todas las opciones de la plataforma) |
| administrador@test.cl | 1234 | Administrador (permite la administracion de usuarios, datos de la plataforma, los mantenedores, etc) |
| operador@test.cl | 1234 | Operador (solo permite ejecutar la tarea encargada dentro de los permisos otorgados) |
| visualizador@test.cl | 1234 | Visualizador (solo permite visualizar informes) |


---

## Stack Tecnológico

El proyecto se basa en **Fat-Free Framework (F3)**, un **micro *framework*** reconocido por su ligereza y mínima demanda de recursos de servidor, ideal para entornos de alojamiento compartido o limitados.

| Componente | Tecnologías Clave | Propósito |
| :--- | :--- | :--- |
| **Backend / Lógica** | **Fat-Free Framework (F3)** | Micro *framework* PHP ligero. |
| **Base de Datos** | **MySQL** | Utiliza el **ORM nativo de F3**, permitiendo una fácil **portabilidad** a otras bases de datos relacionales. |
| **Interfaz Gráfica (UI)** | **Bootstrap 5**, Glyphicons, Boxicons. | Componentes visuales y *frontend* responsivo. |
| **Funcionalidad *Frontend*** | **jQuery**, SweetAlert, Chart.js, ApexCharts, Plotly.js, Material-Picker, etc. | Interactividad avanzada, notificaciones, visualización de datos (**gráficos y *dashboards***), etc. |

---

## Arquitectura y Patrones de Diseño

La plataforma adopta la **Arquitectura *Screaming***, la cual prioriza la **modularidad** y la fácil instalación de nuevos componentes (*plugins* o módulos).

* **Estructura Interna:** Cada módulo es independiente de otros y sigue el patrón de diseño **arquitectura de tres niveles (3-Tier Architecture)**, los cuales se dividen en la capa de presentación, la capa de controlador y la capa de datos, pero puede utilizar cualquier otro gracias a su modularidad.
* **Principios de Diseño:** La implementación adhiere rigurosamente a los principios **SOLID**, **DRY** (*Don't Repeat Yourself*) y **KISS** (*Keep It Simple, Stupid*), asegurando un código limpio, mantenible y extensible.
* **Separación de Preocupaciones:** Se utiliza el **motor de plantillas nativo de F3** para desacoplar la lógica de negocio de la presentación visual. Esto permite **reutilizar la funcionalidad** con diferentes bibliotecas (por ejemplo pasar de **Bootstrap** a **Tailwind CSS**) sin comprometer la compatibilidad funcional.
* **Utilidades:** Se han desarrollado **bibliotecas internas** para el manejo estandarizado de elementos críticos (fechas, horas, montos financieros, validaciones, notificaciones y mailing, etc.), promoviendo la consistencia en toda la aplicación.

---

## Estrategia de Seguridad

Se implementa un robusto sistema de gestión de sesiones y acceso centrado en la **autorización estricta** y la **detección de intrusos**.

* **Gestión de Sesiones:** Soporte para el manejo de sesiones mediante **cookies** tradicionales o **JSON Web Tokens (JWT)**.
* **Autorización Dinámica de Rutas:** Las rutas a las que un usuario puede acceder son **generadas dinámicamente** y son establecidas en base a sus **permisos asignados** durante el inicio de sesión. Esto asegura que se pueda acceder sólo a las **transacciones autorizadas**.
* **Mecanismo Anti-Intrusión (basado Tokens):**
    1. Al iniciar sesión, se genera un **token de seguridad** que incluye el **ID de usuario**, la **dirección IP**, y un **token CSRF**.
    2. Este token se valida en **cada interacción** del usuario con la plataforma, validando que el token CSRF y la dirección IP del equipo que hace la interacción sea el mismo que el que realizó el inicio de sesión.
    3. **Respuesta a Intrusos**: Si se detecta un intento de sesión no autorizado a una transacción no autorizada o un *spoofing* repetitivo, el intruso es **inicialmente baneado** por un período de 5 horas.
    4. **Lista Negra (*Blacklisting*):** En caso de persistencia en el ataque, la dirección IP maliciosa se puede enviar a la **lista negra (*blacklist*) a nivel del servidor** de forma automática, si el entorno de *hosting* lo permite, para una mitigación más severa.

---

## ¿Porque Fat Free y no otro?

Porque es el framework mas limpio que encontre y uno de los que tiene el mejor benchmark frente a otros frameworks populares, existe otro aun mas rapido llamado kumbia, pero este implementa su propia forma de organizar sus componentes y es demasiado restrictiva lo que impide la reutilizacion de componentes y funciones

#### benchmarks

Respuestas por segundo

<img src='https://github.com/tenshi98/demoreservas/blob/main/src/img_1.png' />

<img src='https://github.com/tenshi98/demoreservas/blob/main/src/img_2.png' />

Latencia

<img src='https://github.com/tenshi98/demoreservas/blob/main/src/img_3.png' />

Sobrecarga

<img src='https://github.com/tenshi98/demoreservas/blob/main/src/img_4.png' />

---

## Configuraciones

La carpeta `plataforma/sistemas_reservas/app/config/` concentra la gestión centralizada de configuraciones del sistema. En esta carpeta se definen los parámetros operacionales, parámetros de bases de datos, correo electrónico y llaves de seguridad necesarias para la ejecución global de la aplicación.

A continuación se detalla la función de cada archivo de configuración:

- **`ConfigAPP.php`**: Define los datos institucionales del software (nombre, slogan, empresa, URLs públicas base), límites globales de paginación de registros, parámetros de seguridad contra ataques de fuerza bruta (número máximo de intentos fallidos antes de aplicar bloqueos temporales o lista negra) y la selección del proveedor de almacenamiento de archivos subidos (drivers locales, Amazon S3 / S3-compatible, Google Cloud Storage y SFTP).
- **`ConfigData.php`**: Centraliza las credenciales e identificadores de conexión hacia los diferentes motores de bases de datos soportados por el framework y la plataforma (MySQL principal y administrativo, PostgreSQL, SQLite, MongoDB, bases de datos livianas en disco como Jig, y almacenes en memoria con Redis).
- **`ConfigMail.php`**: Contiene la configuración técnica y perfiles de conexión para el envío de correos electrónicos transaccionales del sistema, soportando servidores SMTP tradicionales, integraciones vía Gmail y servicios SaaS de envío masivo/transaccional como Sendinblue (Brevo).
- **`ConfigToken.php`**: Define la parametrización de autenticación basada en tokens JSON Web Tokens (JWT), incluyendo claves secretas de encriptación, tiempos de expiración (TTL) y una colección de llaves de cifrado en capas para proteger las comunicaciones y peticiones sensibles.

---

## Estructura de Carpetas del Proyecto

```text
demoreservas/
├── LICENSE
├── README.md
├── plataforma/
│   ├── sistemas_reservas/
│   │   ├── app/
│   │   │   ├── config/
│   │   │   ├── helpers/
│   │   │   ├── modules/
│   │   │   │   ├── espacios/
│   │   │   │   ├── estados/
│   │   │   │   ├── main/
│   │   │   │   ├── periodicidad/
│   │   │   │   ├── recursos/
│   │   │   │   ├── reservas/
│   │   │   │   ├── root/
│   │   │   │   ├── sistema/
│   │   │   │   ├── solicitantes/
│   │   │   │   ├── unidades/
│   │   │   │   └── usuarios/
│   │   │   ├── templates/
│   │   │   └── utils/
│   │   └── public/
│   │       ├── css/
│   │       ├── img/
│   │       ├── js/
│   │       ├── upload/
│   │       ├── vendor/
│   │       ├── .htaccess
│   │       ├── index.php
│   │       └── robots.txt
│   └── vendors/
│       ├── application/
│       │   ├── controller/
│       │   ├── functions/
│       │   └── models/
│       ├── fatfree/
│       └── libs/
│           ├── PHPPresentation/
│           ├── PHPWord/
│           ├── PhpSpreadsheet/
│           ├── aws-sdk/
│           ├── gcs-sdk/
│           ├── php-ai-sdk/
│           ├── php-jwt/
│           ├── predis/
│           └── sftp-sdk/
└── src/
```

---

## Tecnologías Frontend

Las bibliotecas frontend ubicadas en la carpeta `plataforma/sistemas_reservas/public/vendor` proporcionan interactividad, componentes de interfaz de usuario, generación de gráficos y elementos visuales:

| Librería | Descripción Breve |
| :--- | :--- |
| **PDFObject** | Script de JavaScript para incrustar documentos PDF directamente en páginas HTML mediante elementos HTML5. |
| **ViewerJS** | Visor de documentos en línea (PDF, OpenDocument) renderizados en HTML5/JS sin depender de plugins externos. |
| **aos (Animate On Scroll)** | Librería de animaciones desencadenadas al desplazarse (scroll) por la página web. |
| **apexcharts** | Librería moderna para la generación de gráficos vectoriales interactivos y dashboards en tiempo real. |
| **audio_player** | Reproductor multimedia HTML5 estilizado para reproducción de archivos de audio local o remoto. |
| **autosize** | Utilidad ligera para autoajustar la altura de campos `<textarea>` según la cantidad de texto ingresado. |
| **bootstrap** | Framework de diseño CSS/JS responsivo (Bootstrap 5) base para la maquetación y la UI general. |
| **bootstrap-icons** | Set de iconos vectoriales oficial de Bootstrap para elementos de menú, botones y acciones. |
| **bootstrap_colorpicker** | Componente selector de color (colorpicker) integrado con inputs de formularios de Bootstrap. |
| **bootstrap_fileinput** | Plugin de subida de archivos avanzado con vista previa de imágenes, arrastrar y soltar (drag & drop) y barra de progreso. |
| **bootstrap_touchspin** | Componente spinner para números que agrega botones incrementales/decrementales táctiles a campos numéricos. |
| **boxicons** | Colección de iconos vectoriales de alta calidad para interfaces web modernas. |
| **chart.js** | Librería popular basada en HTML5 Canvas para el renderizado de gráficos estadísticos (barras, líneas, dona, etc.). |
| **clock_timepicker** | Selector de horas con formato de reloj analógico interactivo para selección rápida de tiempo. |
| **echarts** | Apache ECharts, motor interactivo de visualización de datos de alto rendimiento y gráficos complejos. |
| **form_validator** | Motor de validación de formularios en el cliente para verificar formatos y campos obligatorios antes del envío. |
| **fullcalendar** | Componente de calendario interactivo para la gestión de agendas, reservas, citas y eventos. |
| **glyphicons** | Fuentes e iconos tipográficos clásicos para botones e indicadores de interfaz. |
| **jstree** | Plugin de jQuery para representar y gestionar estructuras de datos en árbol jerárquico e interactivo. |
| **leaflet** | Biblioteca de código abierto para mapas interactivos georreferenciados y manipulación de coordenadas. |
| **material_datetimepicker** | Selector de fechas y horas con estética inspirada en el diseño Material Design. |
| **mejs-player** | MediaElement.js, reproductor universal HTML5 para contenido de audio y video con controles personalizados. |
| **meteo** | Widget / componente para visualizar datos climáticos e informes meteorológicos. |
| **php-email-form** | Controlador JS para envío AJAX de formularios de contacto con retroalimentación visual de estado. |
| **plotly_js** | Librería de gráficos científicos y analíticos avanzados para representación de datos complejos. |
| **popover-ex** | Extensión para mejorar y personalizar los avisos contextuales (popovers) de Bootstrap. |
| **printerDocs** | Módulo de impresión de documentos y reportes con formatos limpios para impresora. |
| **prism** | Resaltador de sintaxis de código fuente ligero y extensible para bloques de código HTML/JS/PHP. |
| **radio_player** | Componente reproductor de streaming para emisiones de radio e transmisiones de audio continuo. |
| **remixicon** | Sistema de iconos vectoriales neutros y elegantes para la interfaz de usuario. |
| **rss_reader** | Parseador y lector cliente de noticias en formatos RSS/Atom. |
| **rut_validate** | Validador y formateador automático del Rol Único Tributario (RUT / RUN) chileno. |
| **select2** | Reemplazo avanzado de la etiqueta `<select>` de HTML, añadiendo soporte de búsqueda, selección múltiple y AJAX. |
| **simple-datatables** | Alternativa liviana sin jQuery para crear tablas HTML ordenables, paginadas y con buscador. |
| **sweetalert2** | Reemplazo estético y personalizable para las alertas de JavaScript emergentes (`alert`, `confirm`). |
| **tinymce** | Editor de texto enriquecido (WYSIWYG) completo para la edición e inserción de contenido HTML en formularios. |
| **upload_and_crop_image** | Herramienta para subir, recortar y previsualizar imágenes antes de enviarlas al servidor. |

---

## Tecnologías Backend

El backend está construido con un enfoque modular y arquitectura MVC. A continuación se presentan las librerías, modelos, controladores y funciones auxiliares ubicados en la carpeta `plataforma/vendors/`.

### Controladores (`vendors/application/controller`)

| Archivo | Descripción Breve |
| :--- | :--- |
| **`ControllerBase.php`** | Clase base para controladores. Proporciona la infraestructura core para la ejecución de consultas CRUD generadas, gestión de sesiones de usuario, comprobación de permisos/niveles y despachador de correo electrónico. |
| **`ControllerWeb.php`** | Controlador enfocado en peticiones y utilidades del frontend web, resolviendo rutas dinámicas hacia las vistas y envíos de notificaciones. |

### Funciones Helper (`vendors/application/functions`)

| Archivo | Descripción Breve |
| :--- | :--- |
| **`FunctionsCommonData.php`** | Funciones de uso común para manipulación de arreglos (agrupación por clave, conversión recursiva de objetos), análisis de rutas y sanitización segura de paths (`safePath`). |
| **`FunctionsConvertions.php`** | Utilidades para conversión de formatos de datos, transformaciones de unidades y codificaciones. |
| **`FunctionsDataDate.php`** | Helper especializado en operaciones con fechas (formateo, cálculos de diferencias, días laborables y calendarios). |
| **`FunctionsDataNumbers.php`** | Funciones para formateo de montos numéricos, moneda (CLP, USD), porcentajes y operaciones matemáticas. |
| **`FunctionsDataOperations.php`** | Operaciones lógicas y procesamiento de arreglos de datos complejos. |
| **`FunctionsDataSQL.php`** | Generador de fragmentos de código SQL, construcción de cláusulas de consulta y sanitización de términos para la base de datos. |
| **`FunctionsDataText.php`** | Manipulación de texto, limpieza de caracteres especiales, generación de slugs y truncado de cadenas. |
| **`FunctionsDataTime.php`** | Operaciones y conversiones de formato sobre horas, minutos, segundos y timestamps. |
| **`FunctionsDataValidations.php`** | Funciones de validación de datos de entrada (validación de RUT chileno, emails, teléfonos y tipos). |
| **`FunctionsLocation.php`** | Cálculo de coordenadas geográficas, distancias entre puntos y estructura territorial (regiones/comunas). |
| **`FunctionsSecurityCodification.php`** | Métodos de cifrado, descifrado, generación de hashes y codificación de cadenas (Base64, etc.). |
| **`FunctionsSecurityPasswords.php`** | Generación y comprobación segura de contraseñas mediante algoritmos de hashing fuertes (Bcrypt/Argon2). |
| **`FunctionsServerClient.php`** | Detección de metadatos del cliente (dirección IP, navegador, sistema operativo y agente de usuario). |
| **`FunctionsServerIA.php`** | Funciones helper para comunicación y envío de requerimientos a servicios de Inteligencia Artificial. |
| **`FunctionsServerSecurity.php`** | Mecanismos de seguridad del servidor, prevención de ataques de fuerza bruta y gestión de baneos por IP. |
| **`FunctionsServerServer.php`** | Métodos para consultar el estado del servidor (memoria, almacenamiento, variables globales y entorno PHP). |
| **`FunctionsServerSocial.php`** | Integración y formateo de metadatos para plataformas sociales (Facebook, X, Instagram, LinkedIn). |
| **`FunctionsServerWeb.php`** | Utilidades para el manejo de peticiones HTTP, cabeceras, consumo de cURL y respuestas JSON. |
| **`UIFormInputs.php`** | Generador dinámico de campos e inputs de formulario HTML5 con estilos preconfigurados. |
| **`UIWidgetsCommon.php`** | Creación dinámica de componentes de interfaz comunes (tarjetas, botones, tarjetas de estado, alertas, modales). |
| **`UIWidgetsGraphics.php`** | Renderizador de inicialización para gráficos e indicadores dashboard. |
| **`UIWidgetsMaps.php`** | Helper para la construcción de mapas interactivos y marcadores visuales mediante Leaflet. |

### Modelos del Sistema (`vendors/application/models`)

| Archivo | Descripción Breve |
| :--- | :--- |
| **`CheckData.php`** | Modelo de validación de datos que evalúa reglas de negocio, campos requeridos, datos únicos y formatos antes de operar sobre la base de datos. |
| **`FileManager.php`** | Gestor central de almacenamiento de archivos con soporte multi-driver (Local, S3, GCS, SFTP) para subida, descarga, renombrado y eliminación. |
| **`ImageManager.php`** | Procesador de imágenes para redimensionado, recorte (cropping), optimización de peso y conversión de formatos. |
| **`MailSender.php`** | Gestor de plantillas y despacho físico de correos electrónicos a través de SMTP, Gmail o Sendinblue. |
| **`QueryBuilder.php`** | Motor de construcción y ejecución de consultas SQL (selects, inserciones, actualizaciones, borrados y creación de tablas) que abstrae la capa PDO/ORM. |
| **`TemplateRenderer.php`** | Motor de renderizado de plantillas HTML y componentes visuales asociando parámetros dinámicos. |

### Librerías y SDKs Externos (`vendors/libs`)

| Directorio / SDK | Descripción Breve |
| :--- | :--- |
| **`PHPPresentation`** | Biblioteca de PHP para la creación, manipulación y exportación de presentaciones de diapositivas (PowerPoint / OpenXML). |
| **`PHPWord`** | Biblioteca de PHP para procesar, crear y modificar documentos de texto enriquecido (DOCX, ODT, RTF). |
| **`PhpSpreadsheet`** | Biblioteca de PHP para la lectura, escritura y manipulación avanzada de planillas de cálculo (Excel XLSX, CSV). |
| **`aws-sdk`** | SDK oficial de Amazon Web Services (AWS SDK for PHP) para la gestión e integración con Amazon S3 y servicios Cloud. |
| **`gcs-sdk`** | SDK oficial de Google Cloud Storage para PHP que permite operar sobre buckets y objetos en GCP. |
| **`php-ai-sdk`** | SDK e integración PHP para conexión con APIs de proveedores de Inteligencia Artificial (modelos de lenguaje/LLM). |
| **`php-jwt`** | Biblioteca para la generación, firmado, decodificación y verificación de tokens de autenticación JSON Web Tokens (JWT). |
| **`predis`** | Cliente nativo de PHP para comunicación y gestión de caché y datos en servidores Redis. |
| **`sftp-sdk`** | SDK basado en `phpseclib` para conexiones SSH2 y transferencia segura de archivos vía protocolo SFTP. |

## Escalabilidad del Sistema

### Crecimiento Significativo del Volumen de Usuarios

La plataforma ha sido concebida con una arquitectura ligera basada en **Fat-Free Framework (F3)**, lo que le permite mantener un consumo mínimo de memoria RAM (~1-2 MB por petición) y una latencia baja en comparación con frameworks monolíticos tradicionales.

Para escalar ante un incremento masivo en el tráfico y volumen de usuarios activos, la estrategia de evolución comprende las siguientes fases:

1. **Desacoplamiento del Almacenamiento de Archivos (Stateless Web Nodes):**
   - **Estado actual:** Almacenamiento local en `public/upload`.
   - **Evolución:** Activar los drivers ya implementados en la plataforma (`FileManager.php` / `ConfigAPP.php`) para utilizar repositorios de objetos en la nube como **Amazon S3** o **Google Cloud Storage (GCS)**, junto a una CDN (Content Delivery Network) como Cloudflare o AWS CloudFront. Esto elimina el estado local en los servidores web y acelera la entrega de archivos multimedia globales.

2. **Manejo de Sesiones Distribuido y Caching con Redis:**
   - **Estado actual:** Sesiones PHP basadas en servidor o cookies/tokens individuales.
   - **Evolución:** Configurar **Redis** como almacén centralizado de sesiones y caché de aplicación mediante la clave `Redis_1` de `ConfigData.php` y la librería `predis/` ya disponible en `vendors/libs/predis`. Esto permite la distribución de peticiones mediante un balanceador de carga (Nginx, AWS ALB o HAProxy) hacia múltiples instancias de servidor web sin perder el estado del usuario (*Stateless Horizontal Scaling*).

3. **Escalamiento de la Capa de Datos (Base de Datos):**
   - **Estado actual:** Instancia relacional MySQL principal.
   - **Evolución:** Implementar **Réplicas de Lectura (Read Replicas)** en MySQL/MariaDB. Aprovechando las múltiples claves de conexión definidas en `ConfigData.php` (`MySQL_ADMIN`, `MySQL_1`), las consultas de lectura masiva (reportes, consultas de catálogo, calendarios) se derivarán a los nodos réplica, reservando el nodo primario para escrituras y transacciones críticas.

4. **Contenedores y Auto-Scaling:**
   - Empaquetamiento de la aplicación en contenedores **Docker** bajo orquestación con **Kubernetes (K8s)** o **AWS ECS**, permitiendo el escalado y desescalado automático (*Auto-Scaling*) de pods/contenedores según la demanda de CPU y memoria.

---

### Integración con Sistemas Institucionales Existentes

Para integrarse de manera fluida en ecosistemas universitarios o corporativos existentes (ERPs, CRMs, Portales de Alumnos/Empleados), la solución evolucionará en los siguientes puntos:

1. **Autenticación Centralizada (SSO / IAM):**
   - Integración de módulos de autenticación mediante estándares institucionales como **OAuth2 / OpenID Connect (OIDC)**, **SAML 2.0** o **LDAP / Microsoft Active Directory**. Esto permitirá que los usuarios inicien sesión con sus credenciales institucionales unificadas.

2. **Exposición de API RESTful con JWT:**
   - Extensión de la capa de controladores (`ControllerBase.php`) para habilitar endpoints Web API RESTful formateados en JSON, resguardados mediante los tokens de autenticación configurados en `ConfigToken.php`.
   - Documentación estandarizada de la API mediante especificaciones **OpenAPI 3.0 (Swagger)**.

3. **Sincronización Asíncrona vía Webhooks y Colas de Mensajería:**
   - Implementación de colas de mensajes (como RabbitMQ o Redis Queue) para procesar eventos institucionales en segundo plano (por ejemplo, sincronización periódica de matrículas, actualización de roles de personal o notificaciones masivas) sin afectar los tiempos de respuesta al usuario.

---

## Operación y Soporte

### Control de Cambios

La gestión de cambios y mantenimiento del código fuente sigue un flujo normado para garantizar la estabilidad operativa del entorno de producción:

1. **Estrategia de Ramificación (GitFlow):**
   - `main` / `master`: Contiene exclusivamente el código en estado de producción, etiquetado mediante versiones semánticas (ej. `v1.2.0`).
   - `staging` / `qa`: Entorno de pruebas integradas previo a la salida a producción.
   - `feature/*`: Ramas dedicadas al desarrollo de nuevas funcionalidades o módulos.
   - `hotfix/*`: Ramas de corrección urgente directamente desplegables tras aprobación.

2. **Pipeline de Integración y Despliegue Continuo (CI/CD):**
   - **Validación Automática:** Todo *Pull Request* o *Merge* ejecuta un pipeline automatizado (ej. GitHub Actions / GitLab CI) que efectúa:
     - Análisis estático de código y comprobación de errores sintácticos en PHP (`php -l`).
     - Verificación de estándares de código (PSR-12).
     - Pruebas unitarias e integrales del motor de consultas (`QueryBuilder`).
   - **Despliegue Sin Interrupción (*Zero-Downtime Deployment*):** Uso de enlaces simbólicos o despliegue azul/verde (*Blue-Green Deployment*) para asegurar que la actualización de la plataforma no genere interrupciones en las sesiones de usuarios activos.

3. **Documentación e Histórico de Cambios:**
   - Mantenimiento actualizado de la historia de versiones en un archivo `CHANGELOG.md`, registrando nuevas características, correcciones de errores, cambios mayores e incompatibilidades.

---

### Respaldo de Información y Recuperación (Backup & DRP)

La estrategia de respaldo y continuidad de negocio está diseñada para mitigar cualquier riesgo de pérdida de datos por fallos de hardware, corrupción de base de datos o desastres operacionales.

1. **Respaldos de Base de Datos:**
   - **Automatización de Dumps Diarios:** Ejecución programada (mediante tareas Cron en el servidor o servicios de BD administrados como AWS RDS / GCP Cloud SQL) de respaldos completos diarios codificados.
   - **Recuperación en el Punto en el Tiempo (PITR):** Habilitación del registro binario de MySQL (*Binary Logging* / WAL) para permitir la restauración exacta de la base de datos a cualquier segundo específico del día en caso de falla crítica.
   - **Almacenamiento Offsite Cifrado:** Los archivos de respaldo se cifran mediante AES-256 y se replican automáticamente en un depósito externo inmutable (ej. Amazon S3 Glacier o Google Cloud Storage con retención WORM).

2. **Respaldos de Archivos Multimedia (`upload`):**
   - En entornos locales, ejecuciones rsync/snapshot periódicas hacia un servidor de respaldo secundario.
   - En entornos Cloud (S3 / GCS), activación del **versionamiento de objetos** y **replicación entre regiones (*Cross-Region Replication*)** para garantizar durabilidad de 99.999999999% en los archivos adjuntos y comprobantes subidos por usuarios.

3. **Objetivos de Recuperación ante Desastres (DRP):**
   - **RPO (Recovery Point Objective):** Máximo 1 hora de pérdida de datos en el peor escenario.
   - **RTO (Recovery Time Objective):** Restablecimiento completo de los servicios en menos de 2 horas tras un fallo catastrófico, mediante infraestructura como código (Docker / Terraform) y procedimientos de restauración automatizados.
