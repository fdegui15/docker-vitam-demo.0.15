This is in unofficial repository for creating a Docker based on Vitam version 0.15. 

If you want to give it a try, you need:
 - a VM (or a Linux PC) with at least 8 GB of Ram and 20 GB of disk
 - and a Linux distro (tested with Ubuntu and Fedora)

If you haven'd already installed Docker, the easiest way is to launch:
    curl -sSL https://get.docker.com/ | sh
Or follow the instructions on https://docs.docker.com/engine/installation/

Then retrieve the file run_docker_vitam_demo.sh in the "batch" directory (https://github.com/fdegui15/docker-vitam-demo.0.15/blob/master/batch/run_docker_vitam_demo.sh) and make it executable:
     chmod +x run_docker_vitam_demo.sh

And launch run_docker_vitam_demo.sh and 
Inside the container, launch:
    vitam_deploy_all

When all is ready, simply click on the following link: 
   http://localhost 

Limitations:
 This docker is for demo only. If you want to implement Vitam on a production system, you have to follow the instructions on github.com/programmevitam/vitam

