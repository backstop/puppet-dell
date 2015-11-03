require 'spec_helper'

describe 'dell::repos', :type => :class do
  context "osfamily = RedHat" do
    context "On RHEL 6" do
      let :facts do
        {
          :osfamily                  => 'RedHat',
          :operatingsystemmajrelease => 6,
        }
      end
      it 'should compile' do
        should compile
        should contain_yumrepo('dell-omsa-indep')
        should contain_yumrepo('dell-omsa-specific')
        should contain_package('yum-dellsysid')
        should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-dell')
        should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-libsmbios')
        should contain_exec('dell-RPM-GPG-KEY-dell')
        should contain_exec('dell-RPM-GPG-KEY-libsmbios')
      end
    end

    context "On RHEL 7" do
      let :facts do
        {
          :osfamily                  => 'RedHat',
          :operatingsystemmajrelease => 7,
        }
      end
      it 'should compile' do
        should compile
        should_not contain_yumrepo('dell-omsa-indep')
        should contain_yumrepo('dell-omsa-specific')
        should_not contain_package('yum-dellsysid')
        should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-dell')
        should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-libsmbios')
        should contain_exec('dell-RPM-GPG-KEY-dell')
        should contain_exec('dell-RPM-GPG-KEY-libsmbios')
      end
    end
  end

  context "osfamily = Debian" do
    context "In Debian Wheezy" do
      let :facts do
        {
          :osfamily        => 'Debian',
          :lsbdistid       => 'debian',
          :lsbdistcodename => 'wheezy',
          :manufacturer    => 'Dell Inc.',
        }
      end
      it do
        should compile
        should contain_apt__key('dell-community')
        should contain_apt__source('dell-community')
      end
    end
  end

end
