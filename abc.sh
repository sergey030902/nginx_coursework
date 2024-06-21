#!/bin/bash

sudo ufw deny 23                   # Запрет Telnet
sudo ufw deny 137                  # Запрет NetBIOS Name Service
sudo ufw deny 138                  # Запрет NetBIOS Datagram Service
sudo ufw deny 139                  # Запрет NetBIOS Session Service
sudo ufw deny 445                  # Запрет Microsoft-DS
sudo ufw deny 1433                 # Запрет Microsoft SQL Server
sudo ufw deny 3306                 # Запрет MySQL
sudo ufw deny 5432                 # Запрет PostgreSQL
sudo ufw deny 1521                 # Запрет Oracle
sudo ufw deny 27017                # Запрет MongoDB
sudo ufw deny 6379                 # Запрет Redis
sudo ufw deny 8080                 # Запрет альтернативного HTTP порта


sudo ufw enable

sudo ufw status verbose
