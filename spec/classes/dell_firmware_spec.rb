require 'spec_helper'

describe 'dell::firmware', :type => :class do
  context "On RHEL6" do
    let :facts do
      {
        :osfamily        => 'RedHat',
        :operatingsystemmajrelease => 6,
      }
    end

    it 'should compile' do
      should compile
      should contain_package('dell_ft_install')
    end
  end

  context "On RHEL7" do
    let :facts do
      {
        :osfamily        => 'RedHat',
        :operatingsystemmajrelease => 7,
      }
    end

    it 'should compile' do
      should compile
      should_not contain_package('dell_ft_install')
    end
  end
end
