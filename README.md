# anton-deployment

This repo is just me trying some basic k8s stuff.

- Create a simple deployment
- Create a service to expose the deployment
- Setup the k8s dashboard
- Create an admin user to access the dashboard

# Requirements

You need to have docker desktop installed and you need to make sure to enable the kubernetes feature in docker's
settings.

If you have access to another development cluster, you could also change the context in deploy.sh to point to that.

Currently, deply.sh sets the context to `docker-desktop` to reduce likelyhood that someone will accidentally deploy to a production cluster.
