gce = data_bag_item("gce", "service_account")
timestamp = Time.now.to_i.to_s

file '/tmp/t' do
  content validation_pem
end

client = client_rb()
validation = validation_pem()

gce_instance "http-server-#{timestamp}" do
  tags ["http-server"]
  first_boot_json "{\"run_list\": [\"recipe[pdb_motd]\"]}"
  client_rb client
  validation_pem validation
# validation_pem(validation_pem)
# validation_pem(validation_pem())
  client_email gce['client_email']
  key_location gce['key_location']
  project_id gce['project_id']
  machine_type "n1-standard-1"
  zone_name "us-central1-a"
  boot_disk_image "chef-motd-debian-7-wheezy-v20141108"
  service_account_scopes [
    "compute", "userinfo.email", "devstorage.full_control"
  ]
  auto_restart true
  on_host_maintenance "MIGRATE"
  action :create
end
