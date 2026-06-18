#!/bin/bash
#Manejo errores
set -euo pipefail

LOG="/var/log/btrfs_snapshot.log" #El archivo de log

MOUNTPOINT="/btrfs" #El punto de montaje del filesystem.
ORIGEN="/btrfs/datos" #El subvolumen de origen.
DESTINO="/btrfs/snaps" #El directorio donde se almacenarán los snapshots.

# Función de Logging permite:
# Mostrar mensajes por pantalla.
# Guardarlos simultáneamente en el archivo de log.
# Registrar fecha y hora de cada operación.
log() {
    echo "$(date '+%F %T') - $1" | tee -a "$LOG"
}
# Verificación de permisos
if [[ $EUID -ne 0 ]]; then
    echo "Debe ejecutarse como root"
    exit 1
fi
# Verificación del punto de montaje
if ! mountpoint -q "$MOUNTPOINT"; then
    log "ERROR: $MOUNTPOINT no está montado"
    exit 1
fi
# Generación del nombre del snapshot
FECHA=$(date +%Y-%m-%d-%H%M)

SNAPSHOT="$DESTINO/snapshot-$FECHA"

log "Creando snapshot"
#Creación del Snapshot
btrfs subvolume snapshot -r \
"$ORIGEN" \
"$SNAPSHOT"

log "Snapshot creado"
# Búsqueda de snapshots antiguos
SNAPS_ANTIGUOS=$(find "$DESTINO" \
-maxdepth 1 \
-type d \
-name "snapshot-*" \
-mtime +5)
# Verificación de existencia
if [[ -z "$SNAPS_ANTIGUOS" ]]; then
    log "No hay snapshots antiguos para eliminar"
else
    echo "$SNAPS_ANTIGUOS" | while read -r snap
    do
        NOMBRE=$(basename "$snap")

        log "Eliminando snapshot: $NOMBRE"

        btrfs subvolume delete "$snap" #Eliminación automática

        log "Snapshot eliminado: $NOMBRE"
    done
fi
