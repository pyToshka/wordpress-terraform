require 'spec_helper'

describe 'java::config' do
  let(:title) { '6' }
  let(:params) { { 
    :java_default_version => '6' 
  } }

  context 'with operatingsystem => Ubuntu and operatingsystemrelease => 10.04' do
    let(:facts) { {
      :operatingsystem => 'Ubuntu', 
      :operatingsystemrelease => '10.04'
    } }

    it { should contain_exec('set_java').with_command(/\/usr\/lib\/jvm\/java-6-openjdk\/jre\/bin\/java/) }
  end

  context 'with operatingsystem => Ubuntu and operatingsystemrelease => 12.04' do
    let(:facts) { {
      :operatingsystem => 'Ubuntu', 
      :operatingsystemrelease => '12.04',
      :architecture => 'amd64'
    } }

    it { should contain_exec('set_java').with_command(/\/usr\/lib\/jvm\/java-6-openjdk-amd64\/jre\/bin\/java/) }
  end

  context 'with operatingsystem => Ubuntu and operatingsystemrelease => foo' do
    let(:facts) { {
      :operatingsystem => 'Ubuntu', 
      :operatingsystemrelease => 'foo'
    } }

    it do
      expect {
        should compile
      }.to raise_error(Puppet::Error, /not supported on Ubuntu release foo/)
    end
  end

  context 'with operatingsystem => foo' do
    let(:facts) { {
      :operatingsystem => 'foo' 
    } }

    it do
      expect {
        should compile
      }.to raise_error(Puppet::Error, /not supported on an foo distribution/)
    end
  end

end
