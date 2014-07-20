require 'spec_helper'

describe 'vim::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs vim' do
    expect(chef_run).to install_package('vim')
  end
end
