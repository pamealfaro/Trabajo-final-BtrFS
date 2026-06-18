# **Creación de subvolúmenes**
## Crear subvolumen de datos:
sudo btrfs subvolume create /btrfs/datos
## Crear subvolumen de backups:
sudo btrfs subvolume create /btrfs/backups
## Crear subvolumen de snaps:
sudo btrfs subvolume create /btrfs/snaps

![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/3.1%20Creación%20de%20subvolúmenes%20.png)

## Verificar:
sudo btrfs subvolume list /btrfs
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/3.2%20Verificacion.png)

# **Configuración de quotas**
## Habilitar quotas:
sudo btrfs quota enable /btrfs
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/3.3%20quotas.png)

## Asignar límite de 300 MB:
sudo btrfs qgroup limit 300M /btrfs/datos
## Verificar:
sudo btrfs qgroup show /btrfs

![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/3.4%20asignar%20y%20verificar.png)