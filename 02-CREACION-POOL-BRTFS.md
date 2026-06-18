# <code style="color : fuchsia">**Creación del pool BtrFS**</code>
Se configuró un sistema de almacenamiento utilizando múltiples discos virtuales

## Formatear dos discos
sudo mkfs.btrfs /dev/sdb /dev/sdc
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/1.1%20Formatear%20dos%20discos.png)
## Crear punto de montaje
sudo mkdir /btrfs
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/1.2%20punto%20de%20montaje.png)
## Montar el sistema
sudo mount /dev/sdb /btrfs
![evidencias TP Final (Capturas)](evidencias%20TP%20Final%20(Capturas)/1.3%20montar%20en%20el%20sistema.png)
