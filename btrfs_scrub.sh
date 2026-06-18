#!/bin/bash

LOG="/var/log/btrfs_scrub.log"

echo "==================================" >> $LOG
echo "Inicio del scrub: $(date)" >> $LOG

# Ejecutar scrub
btrfs scrub start -B /btrfs >> $LOG 2>&1

echo "" >> $LOG
echo "Estado del scrub:" >> $LOG

# Mostrar estado
btrfs scrub status /btrfs >> $LOG 2>&1

echo "" >> $LOG
echo "Errores detectados en dispositivos:" >> $LOG

# Estadísticas de errores
btrfs device stats /btrfs >> $LOG 2>&1

echo "" >> $LOG
echo "Mensajes recientes del kernel:" >> $LOG

# Mensajes recientes relacionados con Btrfs
dmesg | tail -20 >> $LOG

echo "Fin del análisis: $(date)" >> $LOG
echo "" >> $LOG
