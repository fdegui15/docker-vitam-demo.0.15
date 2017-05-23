#*******************************************************************************
# Copyright French Prime minister Office/SGMAP/DINSIC/Vitam Program (2015-2019)
#
# contact.vitam@culture.gouv.fr
#
# This software is a computer program whose purpose is to implement a digital archiving back-office system managing
# high volumetry securely and efficiently.
#
# This software is governed by the CeCILL 2.1 license under French law and abiding by the rules of distribution of free
# software. You can use, modify and/ or redistribute the software under the terms of the CeCILL 2.1 license as
# circulated by CEA, CNRS and INRIA at the following URL "http://www.cecill.info".
#
# As a counterpart to the access to the source code and rights to copy, modify and redistribute granted by the license,
# users are provided only with a limited warranty and the software's author, the holder of the economic rights, and the
# successive licensors have only limited liability.
#
# In this respect, the user's attention is drawn to the risks associated with loading, using, modifying and/or
# developing or reproducing the software by the user in light of its specific status of free software, that may mean
# that it is complicated to manipulate, and that also therefore means that it is reserved for developers and
# experienced professionals having in-depth computer knowledge. Users are therefore encouraged to load and test the
# software's suitability as regards their requirements in conditions enabling the security of their systems and/or data
# to be ensured and, more generally, to use and operate it in the same conditions as regards security.
#
# The fact that you are presently reading this means that you have had knowledge of the CeCILL 2.1 license and that you
# accept its terms.
#*******************************************************************************
VITAMDOCKER_IMAGE=vitam.15
VITAMDOCKER_CONTAINER=docker-vitam.15

echo "#### VITAM development environment ####"

if [ -z "$(docker ps -a | grep ${VITAMDOCKER_CONTAINER})" ]; then
	echo "Docker container not found locally ; launching it..."

	echo
	echo "################################################"
	echo
	echo "Launching docker container as daemon (launching systemd init process...)"
	docker run -d --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 -p 8082:8082 -p 9102:9102 -p 9104:9104 -p 9200:9200 -p 9201:9201 -p 9300:9300 -p 9301:9301 -p 9002:9002 -p 9900:9900 -p 27016:27016 -p 27017:27017 -p 10514:10514 -p 8000-8010:8000-8010 -p 8100-8110:8100-8110 -p 8200-8210:8200-8210 -p 8090:8090 -p 8300-8310:8300-8310 -p 5601:5601 -p 8500:8500 -p 8443:8443 -p 8444:8444 --cap-add=SYS_ADMIN --security-opt seccomp=unconfined --name=${VITAMDOCKER_CONTAINER} --net=bridge --dns=127.0.0.1 --dns=10.100.211.222 --dns=8.8.8.8 ${VITAMDOCKER_IMAGE}

	if (( ${?} != 0 )); then
		echo "The daemon container refused to start. Please try again..."
		docker rm ${VITAMDOCKER_CONTAINER}
		exit 1
	fi
else
	echo "Starting existing container : please wait..."
	docker start ${VITAMDOCKER_CONTAINER}
fi

echo "Opening console..."
docker exec -it ${VITAMDOCKER_CONTAINER} bash
echo "Stopping container..."
docker stop ${VITAMDOCKER_CONTAINER}
echo "Container stopped !"
echo "Hint : your container is now stopped, but not removed ; it will be used the next time you use this command."
echo "To restart from scratch, run 'docker rm ${VITAMDOCKER_CONTAINER}' to remove the existing container."

