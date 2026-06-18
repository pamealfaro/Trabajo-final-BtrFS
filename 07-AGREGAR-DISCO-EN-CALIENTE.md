## Agregar disco:
sudo btrfs device add -f /dev/sdd /btrfs

## Balancear:
sudo btrfs balance start /btrfs

![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/7.1%20Agregar%20disco%20y%20Balancear.png)

## Verificar:
sudo btrfs filesystem usage /btrfs
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/7.2%20verificacion.png)