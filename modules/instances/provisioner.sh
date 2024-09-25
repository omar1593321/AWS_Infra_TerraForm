#!/bin/bash
 sudo yum update -y
 sudo amazon-linux-extras install nginx1 -y
 sudo systemctl start nginx
 sudo systemctl enable nginx
 sudo echo 'server {
      listen 80;
      location / {
        proxy_pass http://${alb_dns_name};
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
      }
    }' | sudo tee /etc/nginx/conf.d/proxy.conf

    sudo systemctl restart nginx