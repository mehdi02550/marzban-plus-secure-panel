#!/bin/bash

echo "🌐 لطفاً دامنه یا ساب‌دامین خود را وارد کنید:"
read DOMAIN

echo "✅ در حال نصب docker و certbot ..."
apt update
apt install -y docker.io docker-compose certbot

echo "🔐 دریافت گواهی SSL برای $DOMAIN ..."
certbot certonly --standalone -d $DOMAIN --non-interactive --agree-tos -m your@email.com

echo "📁 تنظیم مسیر گواهی‌نامه‌ها در docker-compose.yml ..."
sed -i "s|YOUR_DOMAIN|$DOMAIN|g" docker-compose.yml

echo "🚀 راه‌اندازی پنل با docker-compose ..."
docker-compose up -d

echo "✅ نصب کامل شد! حالا می‌تونی پنل رو در https://$DOMAIN ببینی"
