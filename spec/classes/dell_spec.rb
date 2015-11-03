require 'spec_helper'

describe 'dell', :type => :class do
  context "osfamily = RedHat" do
    let :facts do
      {
        :osfamily     => 'RedHat',
        :manufacturer => 'Dell Inc.',
      }
    end

    context "default usage (osfamily = RedHat)" do
      let(:title) { 'dell-default' }

      it 'should compile' do
        should contain_class('dell::repos')
        should contain_class('dell::openmanage')
      end
    end
  end

  context "osfamily = Debian" do
    let :facts do
      {
        :osfamily     => 'Debian',
        :lsbdistid    => 'debian',
        :lsbdistcodename => 'wheezy',
        :manufacturer => 'Dell Inc.',
      }
    end

    context "default usage (osfamily = Debian)" do
      let(:title) { 'dell-default' }

      it 'should compile' do
        should contain_class('dell::repos')
        should contain_class('dell::openmanage')
      end
    end
  end


end
