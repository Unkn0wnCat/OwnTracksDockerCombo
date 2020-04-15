# OwnTracks NGINX Configuration

## Installation

### 1. Customizing the Config

First of all you'll have to customize the config in this directory. You'll have to replace `YOUR.HOST.TLD` with the domain you want to serve the frontend from. 
If you've changed the default ports in the docker-compose.yaml you will have to use those here as well.
Likewise you'll have to adjust the path where the .passwd is, if you chose not to clone this repo to `/opt/owntracks`.

### 2. Setting your Password

Secondly we'll set up your password, so only you can access the frontend and recorder.


For that we first have to install a little helper program named `apache2-utils`.

```bash
sudo apt-get update
sudo apt-get install apache2-utils
```

Following that you'll be able to create the file and your first user using the following command substituting `<USERNAME>` for your new username:

```bash
sudo htpasswd -c /opt/owntracks/.passwd <USERNAME>
```

You'll be able to add additional users by using the following command:

```bash
sudo htpasswd /opt/owntracks/.passwd <USERNAME>
```

### 3. Deploying the Config

Next we'll deploy the config to NGINX. To do this you'll have to run the commands below in this directory.

```bash
sudo cp owntracks.conf /etc/nginx/sites-available/owntracks.conf               # Copy the config to the NGINX directory.
sudo ln -s /etc/nginx/sites-available/owntracks.conf /etc/nginx/sites-enabled  # Activate the config.

sudo nginx -t                # Test the config. (Do not proceed if this fails!)

sudo systemctl reload nginx  # Reload NGINX.

sudo certbot	                # If you want to secure your site using free Let's Encrypt SSL.
```
