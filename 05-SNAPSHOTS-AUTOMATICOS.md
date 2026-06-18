# **Snapshots Automaticos**
## Script:
* Crear snapshot con fecha.
* Eliminar snapshots mayores a cinco días.

sudo nano /usr/local/bin/btrfs_snapshot.sh
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/5.1%20Snapshots%20Automaticos.png)

## Automatizar con cron:
sudo crontab -l
0 18 * * 5 /usr/local/bin/btrfs_snapshot.sh >> /var/log/btrfs_snapshot.log 2>&1
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/5.2%20Automatizar%20con%20cron.png)

## Comprobación del log generado por el script:
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/5.3%20Comprobación%20del%20log.png)