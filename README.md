# <font color="blue">**Trabajo Final Sistema de Archivos BtrFS**.</font>
## **Introducion**
El presente trabajo tiene como objetivo explorar, implementar y analizar el sistema de archivos BtrFS en un entorno Ubuntu. Se construyó una infraestructura de almacenamiento utilizando múltiples discos virtuales, aprovechando las capacidades avanzadas de BtrFS para la administración de almacenamiento, redundancia de datos, snapshots, recuperación ante fallos y automatización de tareas.
Durante la práctica se configuraron perfiles RAID nativos de BtrFS, subvolúmenes, cuotas de almacenamiento, snapshots manuales y automáticos, además de realizar pruebas de recuperación de datos y reconstrucción del sistema tras la pérdida de un dispositivo.
## **Objetivos**
Implementar y administrar un sistema de archivos BtrFS utilizando múltiples dispositivos de almacenamiento, aplicando mecanismos de redundancia, snapshots y automatización
* Instalar y configurar BtrFS en Ubuntu
* Crear un filesystem BtrFS con redundancia RAID1
* Administrar subvolúmenes y cuotas
* Crear y restaurar snapshots
* Automatizar la generación y retención de snapshots
* Simular la pérdida de un dispositivo de almacenamiento
* Realizar el proceso de reconstrucción (rebuild) del sistema
## **Entorno de Trabajo**
### Sistema Operativo
* Ubuntu 22.04
### Herramientas utilizadas
* btrfs-progs
* lvm2
* cron
## **Conceptos Fundamentales**
### Copy-on-Write (CoW)
BtrFS utiliza la tecnología Copy-on-Write (CoW), que evita sobrescribir directamente los bloques de datos existentes.
### Subvolúmenes
Los subvolúmenes son estructuras lógicas independientes dentro de un mismo filesystem BtrFS.
### Snapshots
Los snapshots permiten capturar el estado exacto de un subvolumen en un momento determinado.
## **Desarrollo de la Práctica**
### Instalación de Herramientas
* btrfs-progs
* lvm2
### Creación del Filesystem BtrFS
Creación del filesystem con:
* RAID1 para datos.
* RAID1 para metadatos.
### Creación de Subvolúmenes
Se crearon subvolúmenes para organizar la información:
* datos
* backups
* snaps
### Configuración de Cuotas
Se habilitaron cuotas mediante qgroups y se limitó el subvolumen datos a 300 MB
### Generación de Datos de Prueba
Se generaron archivos de prueba mediante el comando dd
### Creación de Snapshots
Se creó un snapshot readonly del subvolumen datos
# Restauración de Información
Usando el mecanismo Copy-on-Write (CoW), fue posible recuperar archivos eliminados restaurándolos desde los snapshots creados previamente.
### Automatización de Snapshots
Se desarrolló un script Bash para:
* Crear snapshots automáticos.
* Registrar eventos mediante logs.
* Eliminar snapshots con más de 5 días.
#### El script incluye:
* Validación del punto de montaje.
* Manejo de errores mediante set -euo pipefail.
* Registrar todas las operaciones realizadas.
### Adición de Discos en Caliente
Se incorporó un nuevo dispositivo al filesystem utilizando y posteriormente se redistribuyeron los datos:
* btrfs device add
* btrfs balance start
### Script de Scrub y detección automática de errores
Con el objetivo de verificar periódicamente la integridad del sistema de archivos, se desarrolló un script en Bash encargado de ejecutar un proceso de scrub sobre el filesystem BtrFS y registrar los resultados en un archivo de log.
### Simulación de Falla de Disco
Se desconectó un dispositivo virtual para evaluar el comportamiento del sistema.
Posteriormente:
* Se montó el filesystem en modo degradado.
* Se verificó el acceso a los datos.
### Reconstrucción (Rebuild)
Se agregó un nuevo disco para reemplazar el dispositivo perdido.
Luego se ejecutó:
* btrfs device add
* btrfs balance start -dconvert=raid1 -mconvert=raid1
BtrFS redistribuyó automáticamente los bloques para restaurar la redundancia.

