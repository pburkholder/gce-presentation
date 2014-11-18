def client_rb
  return <<-END_CLIENT
log_level               :info
log_location            STDOUT
chef_server_url         'https://api.opscode.com/organizations/pdbchef'
validation_client_name  'pdbchef-validator'
END_CLIENT
end
