require 'spec_helper'

describe 'java' do
  let(:title) { '6' }

  it { should compile }
  it { should contain_java__install('6').that_comes_before('Java::Config[6]') }
  it { should contain_java__config('6') }
end

