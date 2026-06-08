#!/bin/bash

# Exit immediately if any command fails
set -e

echo "🚀 Starting deployment..."

# 1. Pull the latest changes from Git
echo "📦 Pulling latest changes from GitHub..."
git pull origin main

# 2. Create the necessary target folders in Linux (if they don't exist)
echo "📁 Ensuring target directories exist..."
sudo mkdir -p /etc/nginx/sites-available
sudo mkdir -p /var/www/funfriday/public

# 3. Copy the files to their respective folders
# (These paths assume your repo mirrors the root directory structure)
echo "📋 Copying files to system directories..."
sudo cp etc/nginx/sites-available/default /etc/nginx/sites-available/default
sudo cp var/www/funfriday/public/robots.txt /var/www/funfriday/public/robots.txt

# 4. Test the Nginx configuration
# This is a critical safety check to prevent a bad config from taking down your site
echo "🔍 Testing Nginx configuration..."
sudo nginx -t

# 5. Restart Nginx
echo "🔄 Restarting Nginx service..."
sudo systemctl restart nginx

echo "✅ Deployment completed successfully!"

