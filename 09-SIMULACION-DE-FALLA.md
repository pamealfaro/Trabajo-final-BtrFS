# **Simulacion de Falla**
* Apagar la VM.
* Desconectar un disco desde VirtualBox.
* Arrancar nuevamente.
  
## lsblk
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/9.1%20simulacion%20falla.png)

## Montar degradado:
sudo mount -o degraded /dev/sdb /btrfs
## Verificar:
sudo btrfs filesystem show

![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/9.2%20simulacion%20falla.png)

##  Se agregó un nuevo disco
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/9.3%20simulacion%20falla.png)