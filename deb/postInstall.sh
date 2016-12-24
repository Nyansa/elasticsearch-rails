service_name="voyance-elasticsearchrails"
nyansa_dir=/opt/voyance
package_dir=${nyansa_dir}/${service_name}

echo "Extracting tar ball"
cd ${package_dir}
sudo tar xvf *.tar

echo "Installing gems"
gem install elasticsearch-model elasticsearch-rails

