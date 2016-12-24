service_name="voyance-elasticsearchrails"
nyansa_dir=/opt/voyance
package_dir=${nyansa_dir}/${service_name}
supervisor_dir=/etc/supervisor/conf.d

# Start the service
echo "Removing ${service_name} files"
sudo rm -rf ${package_dir}