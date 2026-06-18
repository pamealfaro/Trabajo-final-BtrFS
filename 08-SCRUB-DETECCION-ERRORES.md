# **Script de Scrub y detección automática de errores**

## sudo nano /usr/local/bin/btrfs_scrub.sh
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/8.1%20script%20btrfs_scrub.sh%20.png)

## Dar permisos de ejecución:
sudo chmod +x /usr/local/bin/btrfs_scrub.sh
## ## Automatizar con cron:
sudo crontab -l
0 18 * * 5 /usr/local/bin/btrfs_scrub.sh >> /var/log/btrfs_scrub.log 2>&1
## Prueba 
sudo /usr/local/bin/btrfs_scrub.sh
## Ver el informe generado:
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/8.2%20informe.png)
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/8.3%20informe.png)
