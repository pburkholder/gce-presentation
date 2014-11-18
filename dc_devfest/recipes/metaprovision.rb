validation_pem = <<-END_VALIDATION
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAxEzTfvpL3rcVV3DDe0aJvaL2290diUaX6NRJglxHrn0WNaUQ
+xsNTmWgt86O3AbqxZ36tLLaOsa+2FJY7pnvjn+q5+aaxzHcS+6Oa6xemHgaFV9L
ItVMd4aCNCkX83J3WSEQVhBhCP0O24SQkLTv4jXTItXKZOss5T2wlnxteL6dOBbB
NfiCGtyUmqtiRMpMx3vaPRQ5jj+bYNo7D1jhn3FHtOieTGMm+LiNm2DV41WS8gOK
vhx6nhytS53s+dCdXUHKTPIZAMclrIl8GRhx8/peW9zvcPlISDScT5M3en0zdkbk
fJldXexUjdM3qZKIr+T92p40QXZD+7+R0FOwnQIDAQABAoIBAGJrClbNcyCUtnSC
qt+xu/mCLTaKo/ZhmGQ5mylqzt2jBXGb8umS5Jb7yRqey21xYl/2Fu5mBZgWcTTQ
BJqMP1k4lR1ztwJL82F2l51QbJUREjLI9kjenFoI7Fruh32dVE0xkJk12RDCn6Jb
0oda0DKgPd1nRvRWHMpKpbCtbc1tEsiTl/l/YDrL6NBPjorq8yTT+Wi8kcMasZ8l
EW1aYXBtZfb09ZU0oeolplxECQpTli0pXXx+X6G0QbPqq8g2Ppr2Zt0uoMrv7sMP
kSFGr8aCkObtiWszQond3UOUqgVUicHmeNu+L4AHXGc6zbqP4SopvoGeMmpjbq+K
EgzFBQECgYEA8Yg5JjIZpg03tU3dtsbiRrTEFBUVOsAY2uEDzXJY1ubpI0vlX9j0
oETiJYij+33Lc0tcQZ2VtuwuaNj6VgmsWNNPnto63XBg1ZycWVpCTGzJjXj9yEKj
fjiigSAIJW2EARgaKix5Lr9owI24AZexXzMN+ezegxR6re8uswe8fuECgYEA0A79
9yjmH33hrVOAOD39+oNKYpiT4R+shP4AVwAOxsawgz2f5zhvk7kfj58ZXrvEPcf4
xoih2Gc3BnndwqOl/6/xcE8hRQ6YIaKVXBTWC38Z0jrwWmTaGY1szyYd16YMcqgY
SynZAi1Vb5SIb1ren9GNoi+/4PozmITiwgchFT0CgYEAigfMiSyGheP12zIVq9e7
BqdVixiFWl7flW6UaruXU7EAuUAtZHorStAy4TpWZGn+c/Q0U/dH0RLmbtrZLYQ3
r0eLr/+NNnF7lXf7zgCL9PsSsDvd5K1Ym9Cn5d01apZMowdwJHvoATQ4HBqhdp+H
KR2XNiYM/6Ibff07leqs6WECgYEAjCB8xbkC/FTA6QajBb4iz1UbhToz5tx5Sfz0
Z6P/T7tD6LBZgNYOt9RnwEgsQxR9QArtr3EYZ/JkKfVr+QpU49cw6i4xPxxsM8MX
izPxUT7iOig99vOTvL/2d7G5SaNpINO7wOvHX2L+9q54EV+HLuZo2MIGHlUE6QUe
4AUDMBUCgYEAnl/OvZpVlzvccwsEeNAwNCZ/37b7nnrdU+lmnbrnLxBPv8K9/QBo
Wlx2wz/zMif1ChkOqktzVmojQHw7bMz9H0qmbWQiEkV9/ZpYT5YQc5UlxGaZRZF7
tXBDJE/kkZ3+/ucnTdi0i5aNQt014WDZTUzayxcU1toDv1eCLP6CDC8=
-----END RSA PRIVATE KEY-----
END_VALIDATION

client_rb = <<-END_CLIENT
# This is standard ~/.chef/knife.rb stuff:
log_level               :info
log_location            STDOUT
chef_server_url         'https://api.opscode.com/organizations/pdbchef'
validation_client_name  'pdbchef-validator'
END_CLIENT

gce = data_bag_item("gce", "service_account")

gce_instance "motd_instance" do
  boot_disk_name 'motd_instance'
  first_boot_json StringIO.new('{"run_list": ["recipe[pdb_motd]"]}')
  validation_pem  StringIO.new(validation_pem)
  client_rb       StringIO.new(client_rb)
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
