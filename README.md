# drone-chef-ci
Dockerfile for Chef.io/Drone.io CI infrastructure.

Is executed by Drone.io, it's Docker in a Docker (DIND) so expose the outside docker using wrapdocker to a container when CI is executed using chef-dk and kitchen-ci.
