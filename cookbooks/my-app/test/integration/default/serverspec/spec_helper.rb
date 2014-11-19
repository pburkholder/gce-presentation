require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.os = backend(Serverspec::Commands::Base).check_os
    c.path = '/sbin:/usr/sbin'
  end
end

# For mysql tests
begin
  gem 'mysql'
rescue LoadError
  require 'rubygems/dependency_installer'
  Gem::DependencyInstaller.new(Gem::DependencyInstaller::DEFAULT_OPTIONS).install('mysql')
end

require 'mysql'

def database_tables(host, schema, user, pass)
  connection = ::Mysql.new host, user, pass
  connection.select_db(schema).list_tables
end
