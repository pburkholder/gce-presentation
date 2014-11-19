# Encoding: utf-8
require_relative 'spec_helper'

describe 'dc_devfest::default' do
  let :chef_run do
    ChefSpec::SoloRunner.new(log_level: :debug, step_into: ['gce']).converge(described_recipe)
  end

  before do
   stub_data_bag_item("gce", "service_account").and_return({
     'client_email' => '',
     'key_location' => '',
     'project_id'   => ''
   })
 end

  it 'should do converge' do
    expect(chef_run).to be
  end

  it '' do
    expect(chef_run).to create_file('/tmp/t').with_content(/asldfj/)
  end
end
