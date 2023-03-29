#!/bin/bash

# Установить размер диска и имя дискового устройства
DISK_SIZE="30G"
DISK_NAME="/dev/sdb"

# Создать физический том
pvcreate ${DISK_NAME}

# Создать Volume Group и добавить в него созданный ранее Physical Volume
vgcreate vg_var ${DISK_NAME}

# Создать Logical Volume с именем var размером 30 ГБ в Volume Group vg_var
lvcreate -n var -L ${DISK_SIZE} vg_var

# Создать файловую систему на созданном логическом томе
mkfs.ext4 /dev/vg_var/var

# Добавить точку монтирования в файл /etc/fstab
echo "/dev/vg_var/var /var ext4 defaults 0 0" >> /etc/fstab

# Смонтировать точку монтирования
mount /var
