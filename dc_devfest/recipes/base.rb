# This was to create a base instance which I 
# could image for future runs.
# Note that is leaves /etc/chef/client.pem in place :(


gce = data_bag_item("gce", "service_account")
timestamp = Time.now.to_i.to_s

client = client_rb()
validation = validation_pem()

gce_instance "base-#{timestamp}" do
  tags ["base"]
  first_boot_json "{\"run_list\": [\"role[debian_base]\"]}"
  client_rb client
  validation_pem validation
# validation_pem(validation_pem) # nil
# validation_pem(validation_pem()) # nil - what gives?
  client_email gce['client_email']
  key_location gce['key_location']
  project_id gce['project_id']
  machine_type "n1-standard-1"
  zone_name "us-central1-a"
  boot_disk_image node['dc_devfest']['boot_disk_image']
  service_account_scopes [
    "compute", "userinfo.email", "devstorage.full_control"
  ]
  auto_restart true
  on_host_maintenance "MIGRATE"
  action :create
end
