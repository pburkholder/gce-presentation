gce = data_bag_item("gce", "service_account")

env = node.environment
client = client_rb(env)
validation = validation_pem()

node['dc_devfest']['webserver_instances'].times do |instance_index|
  gce_instance "#{env}-webserver-#{instance_index}" do
    boot_disk_image node['dc_devfest']['boot_disk_image']
    tags ["http-server", "webserver", "myapp-webserver"]
    first_boot_json "{\"run_list\":  [\"role[debian_base]\",\"recipe[my-app::balancer]\"]}"
    # boilerplate:
    client_rb client
    validation_pem validation
    client_email gce['client_email']
    key_location gce['key_location']
    project_id gce['project_id']
    machine_type "n1-standard-1"
    zone_name "us-central1-a"
    service_account_scopes [
      "compute", "userinfo.email", "devstorage.full_control"
    ]
    auto_restart true
    on_host_maintenance "MIGRATE"
    action :create
  end
end
