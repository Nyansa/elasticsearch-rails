service_name="voyance-elasticsearchrails"
nyansa_dir=/opt/voyance
package_dir=${nyansa_dir}/${service_name}

echo "Adding ${service_name}"
sudo adduser --system ${service_name}
