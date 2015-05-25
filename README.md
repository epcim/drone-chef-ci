# drone-chef-ci
an Dockerfiles for Chef.io/Drone.io CI environment.


# Branches

## Master

Minimalist chefdk image. Supposed to run lint/syntax checks.
If lucky will drive vagrant against remote environment (aka openstack API)

## Ubuntu dind (ubuntu-1404-dind)

Docker in a Docker. Supposed to run kitchen-ci test with docker driver.
Requires priviled mode set on drone.io.

Note: Can't handle all Chef/CI use-cases.

## Ubuntu vbox (ubuntu-1404-vbox)

Similar as DinD. Exposes a host virtualbox. Supposed to run kitchen-ci test with vagrant-virtualbox driver.


