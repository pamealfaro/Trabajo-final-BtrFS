## Crear archivo de prueba:
sudo dd if=/dev/zero of=/btrfs/datos/archivo.bin bs=10M count=20
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/4.1%20Archivo%20de%20prueba.png)

## Crear snapshot:
sudo btrfs subvolume snapshot -r \
/btrfs/datos \
/btrfs/snapshot_datos
## Verificar:
sudo btrfs subvolume list /btrfs
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/4.2%20crear%20snapshot.png)

## Simular pérdida:
sudo rm /btrfs/datos/archivo.bin
## Restaurar:
sudo cp /btrfs/snapshot_datos/archivo.bin /btrfs/datos/
## Verificar:
ls /btrfs/datos

![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/4.3%20eliminar%20y%20restaurar%20.png)