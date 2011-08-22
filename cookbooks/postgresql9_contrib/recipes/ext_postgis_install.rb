postgis_version = "1.5.2"
proj_version = "4.6.1"

enable_package "sci-libs/proj" do
  version proj_version
end

enable_package "dev-db/postgis" do
  version postgis_version
end

package "dev-db/postgis" do
  version postgis_version
  action :install
end


