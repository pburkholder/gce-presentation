require 'spec_helper'

describe 'my-app::default' do

  # Database.rb tests
  describe 'my-app::database' do

    it 'enables the mysql server service' do
      expect(service 'mysql').to be_enabled
    end

    it 'listens on port 3306' do
      expect(port '3306').to be_listening.with('tcp')
    end

    # This test will ensure that the database is available, the schema is
    # properly installed, the correct user is available, and the password
    # is correct. It will also check that syncdb has been run.
    it 'seeds the mysql database correctly' do
      host = 'localhost'
      schema = 'opscode'
      user = 'opscode'
      pass = 'opscode'
      expect(database_tables(host, schema, user, pass)).to \
        include('auth_user')
    end
  end

  # Application tests
  describe 'my-app::application' do
    it 'creates the application config directory' do
      expect(file '/opt/conf/mysite').to be_directory
      expect(file '/opt/conf/mysite').to be_mode 755
    end

    # Application directory will only exist if archive unpacks correctly
    it 'creates the application directory' do
      expect(file '/opt/mysite').to be_directory
      expect(file '/opt/mysite').to be_mode 755
    end

    it 'configures the application correctly' do
      config_file = '/opt/conf/mysite/mysite.ini'
      expect(file config_file).to be_mode 644
      expect(file config_file).to be_owned_by 'root'
      expect(file config_file).to be_grouped_into 'root'
      expect(file config_file).to contain 'NAME: opscode'
      expect(file config_file).to contain 'USER: opscode'
      expect(file config_file).to contain 'PASSWORD: opscode'
      expect(file config_file).to contain 'HOST: localhost'
      expect(file config_file).to contain 'PORT: 3306'
    end
  end

  # Webserver tests
  describe 'my-app::webserver' do
    it 'listens on port 8080' do
      expect(port '8080').to be_listening.with('tcp')
    end

    it 'configures the apache web server correctly' do
      config_file = '/etc/apache2/sites-available/mysite.conf'
      expect(file config_file).to be_mode 644
      expect(file config_file).to be_owned_by 'root'
      expect(file config_file).to be_grouped_into 'root'
      expect(file config_file).to contain 'Listen 8080'
      expect(file config_file).to contain '<VirtualHost *:8080>'
      expect(file config_file).to contain 'ServerName default-ubuntu-1204'
      expect(file config_file).to contain \
      'ErrorLog /var/log/apache2/www.mysite.com-web-error.log'
      expect(file config_file).to contain \
      'CustomLog /var/log/apache2/www.mysite.com-web-access.log combined'
    end

    it 'enables the apache virtualhost' do
      expect(file '/etc/apache2/sites-enabled/mysite.conf').to be_linked_to \
        '../sites-available/mysite.conf'
    end
  end

  # Load balancer tests
  describe 'my-app::database' do
    it 'listens on port 80' do
      expect(port '80').to be_listening.with('tcp')
    end

    it 'configures the apache web server correctly' do
      config_file = '/etc/apache2/sites-available/mysite-proxy.conf'
      expect(file config_file).to be_mode 644
      expect(file config_file).to be_owned_by 'root'
      expect(file config_file).to be_grouped_into 'root'
      expect(file config_file).to contain '<VirtualHost *:80>'
      expect(file config_file).to contain 'ServerName default-ubuntu-1204'
      expect(file config_file).to contain \
      'BalancerMember http://127.0.0.1:8080 route=0'
      expect(file config_file).to contain \
      'ProxyPassReverse / http://127.0.0.1:8080/'
      expect(file config_file).to contain \
      'ErrorLog /var/log/apache2/www.mysite.com-proxy-error.log'
      expect(file config_file).to contain \
      'CustomLog /var/log/apache2/www.mysite.com-proxy-access.log combined'
    end

    it 'enables the apache virtualhost' do
      expect(file '/etc/apache2/sites-enabled/mysite-proxy.conf').to be_linked_to \
        '../sites-available/mysite-proxy.conf'
    end
  end
end
