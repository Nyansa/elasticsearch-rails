service_name="voyance-elasticsearchrails"
nyansa_dir=/opt/voyance
package_dir=${nyansa_dir}/${service_name}

echo "Extracting tar ball"
cd ${package_dir}
sudo tar xvf *.tar

echo "Installing the bundler"
sudo gem install bundler

echo "Installing Elastic Model"
cd ${package_dir}/elasticsearch-model
bundle install
rake install

echo "Installing Elastic Search Rails"
cd ${package_dir}/elasticsearch-rails
bundle install
rake install
