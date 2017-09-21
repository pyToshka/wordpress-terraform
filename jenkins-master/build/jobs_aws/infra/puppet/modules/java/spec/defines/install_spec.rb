require 'spec_helper'

describe 'java::install' do

  context 'with java_version => 6' do
    let(:title) { '6' }

    it { should contain_package('openjdk-6-jdk').with_ensure('installed') }
  end

  context 'with java_version => 7' do
    let(:title) { '7' }

    it { should contain_package('openjdk-7-jdk').with_ensure('installed') }
  end

end
