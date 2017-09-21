require 'spec_helper'

describe 'jenkins', :type => :module do
  # Switching OS Family to prevent duplicate declaration
  let(:facts) { { :osfamily => 'Suse', :operatingsystem => 'OpenSuSE' } }

  context 'repo::suse' do
    describe 'default' do
      it { should contain_zypprepo('jenkins').with_baseurl('https://pkg.jenkins.io/opensuse-stable/') }
    end

    describe 'lts = true' do
      let(:params) { { :lts => true } }
      it { should contain_zypprepo('jenkins').with_baseurl('https://pkg.jenkins.io/opensuse-stable/') }
    end

    describe 'lts = false' do
      let(:params) { { :lts => false } }
      it { should contain_zypprepo('jenkins').with_baseurl('https://pkg.jenkins.io/opensuse/') }
    end
  end

end
