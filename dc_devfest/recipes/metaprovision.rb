gce = data_bag_item("gce", "service_account")
cbk_path = "/Users/pburkholder/Projects/GCE/dc_devfest"

gce_instance "motd-instance" do
  first_boot_json "#{cbk_path}/stuff/first-boot.json"
  validation_pem  "#{cbk_path}/stuff/validation.pem"
  client_rb       "#{cbk_path}/stuff/client.rb"
  client_email gce['client_email']
  key_location gce['key_location']
  project_id gce['project_id']
  machine_type "n1-standard-1"
  zone_name "us-central1-a"
  boot_disk_image "debian-7-wheezy-v20140318"
  service_account_scopes [
    "compute", "userinfo.email", "devstorage.full_control"
  ]
  auto_restart true
  on_host_maintenance "MIGRATE"
  action :create
end
