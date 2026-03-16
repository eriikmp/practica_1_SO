#!/bin/bash
mkdir -p /home/eriikmp/backups
sudo tar -czf /home/eriikmp/backups/copia.tar.gz /etc/nginx /home/eriikmp
sudo find /var/log -name "*.log" -type f -mtime +7 -delete
echo "Mantenimiento completado"
