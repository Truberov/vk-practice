#!/bin/bash

# Установить размер файла подкачки
SWAP_SIZE="4G"

# Создать файл подкачки размером 4 ГБ
sudo fallocate -l ${SWAP_SIZE} /swapfile

# Установить права доступа к файлу подкачки только для пользователя root
sudo chmod 600 /swapfile

# Создать файл подкачки на базе файла
sudo mkswap /swapfile

# Включить файл подкачки с помощью команды swapon
sudo swapon /swapfile

# Добавить файл подкачки в файл /etc/fstab, чтобы он автоматически включался при каждой загрузке системы
echo "/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab > /dev/null
