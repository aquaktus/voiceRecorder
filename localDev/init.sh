#!/bin/bash

# Setting up nginx server configuration
cp /home/user/voiceRecorder/nginx/server /etc/nginx/sites-available/server
# Adding lim-Link so NGINX reus the code
ln -s /etc/nginx/sites-available/server /etc/nginx/sites-enabled/server
rm /etc/nginx/sites-enabled/default
# start up the nginx service
service nginx start

# Building dependencies for node application
cd /home/user/voiceRecorder || echo "/home/user/voiceRecorder not found"
npm install

# start the pm2 node app for the serverPortal
pm2 start app.js --name "voiceRecorder" --watch
