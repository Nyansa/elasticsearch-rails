#!/bin/sh -e

service_name="voyance-elasticsearchrails"
nyansa_dir=/opt/voyance
package_dir=${nyansa_dir}/${service_name}
supervisor_dir=/etc/supervisor/conf.d