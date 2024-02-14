# anton-deployment

This repo is just me trying some basic k8s stuff.

- Create a simple deployment.
- Create a service to expose the deployment.
- Setup the k8s dashboard.
- Create an admin user to access the dashboard.

# Requirements

You need to have docker desktop installed and you need to make sure to enable the kubernetes feature in docker's
settings.

If you have access to another development cluster, you could also change the context in deploy.sh to point to that.

Currently, deploy.sh sets the context to `docker-desktop` to reduce likelyhood that someone will accidentally deploy to a production cluster.

# How to use

Run `./deploy.sh`.

# Exploration

- Run `kubectl get pods` to see the pods that are running.
- Run `kubectl get services` to see the services that are running.
- Run `kubectl get deployments` to see the deployments that are running.
- Run `kubectl get nodes` to see the nodes that are running.
- Run `kubectl get all` to see everything that is running.
- Learning k8s without access to the internet:
   - Run `kubectl api-resources` to see the API resources that are available.
   - Run `kubectl explain deployments --recursive` to see the fields that are available for an API resource like deployments.
   - Run `kubectl explain Pod` to see documentation about Pods along with their available fields.
   - Run `kubectl explain Pod.spec` to see documentation about one field in Pod (spec).
   - Run `kubectl explain Pod.spec.volumes` you can explore subfields as much as you want!
