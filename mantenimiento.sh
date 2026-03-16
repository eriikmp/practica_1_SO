#!/bin/bash
mkdir -p /home/eriikmp/backups
sudo tar --exclude='/home/eriikmp/practica_1/backups'\ --exclude='/home/eriikmp/practica_1/.git'\ -czf /home/eriikmp/backups/copia.tar.gz /etc/nginx /home/eriikmp
sudo find /var/log -name "*.log" -type f -mtime +7 -delete
echo "Mantenimiento completado"

cd ~/practica_1
git add backups
git commit -m "Nueva copia de seguridad"
git push -f origin main
