
gce = data_bag_item("gce", "service_account")

gce_instance "my-gce-instance" do
  boot_disk_name 'my-gce-instance'
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
  action :delete
end
