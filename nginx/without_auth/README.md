# OwnTracks NGINX Configuration (No Auth, NOT RECOMMENDED)

***Warning: This may allow anyone on the internet to view your location.***

## Installation

### 1. Customizing the Config

First of all you'll have to customize the config in this directory. You'll have to replace `YOUR.HOST.TLD` with the domain you want to serve the frontend from. 
If you've changed the default ports in the docker-compose.yaml you will have to use those here as well.


### 2. Deploying the Config

Next we'll deploy the config to NGINX. To do this you'll have to run the commands below in this directory.

```bash
sudo cp owntracks.conf /etc/nginx/sites-available/owntracks.conf               # Copy the config to the NGINX directory.
sudo ln -s /etc/nginx/sites-available/owntracks.conf /etc/nginx/sites-enabled  # Activate the config.

sudo nginx -t                # Test the config. (Do not proceed if this fails!)

sudo systemctl reload nginx  # Reload NGINX.

sudo certbot	                # If you want to secure your site using free Let's Encrypt SSL.
```
