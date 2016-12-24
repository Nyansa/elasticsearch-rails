#!/bin/bash -e

echo "Initializing project"
gradle init clean

echo "Updating version in build.gradle"
version=`git describe`
sed -i -e "s/VERSION_STRING/${version}/g" build.gradle

echo "Creating a ES tar ball"
tar -czf /tmp/es-rails.tar *
mv /tmp/es-rails.tar deb/.

echo "Generating debians"
gradle build buildDeb

echo "Reverting version string in build.gradle files"
version=`git describe`
sed -i -e "s/${version}/VERSION_STRING/g" build.gradle
sudo rm -rf build.gradle-e

echo "Cleaning up tar file"
sudo rm -rf deb/ui.tar

deb_file=`ls build/distributions/ | grep deb`
repository_key="packages-dev"
echo "Publishing \"${deb_file}\" file to \"${repository_key}\" repository"
curl -u admin:${ARTIFACTORY_ADMIN_PASSWORD} -f -X PUT "https://voyance.jfrog.io/voyance/packages-dev/pool/${deb_file};deb.distribution=voyance;deb.component=private;deb.architecture=amd64" -T build/distributions/${deb_file} > /dev/null
