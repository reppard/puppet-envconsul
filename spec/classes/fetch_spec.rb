require 'spec_helper'

describe 'envconsul::fetch' do
  context 'version <= 0.5.0' do
    let(:params) do
      { :arch => 'amd64', :platform => 'linux', :version => '0.5.0' }
    end

    let(:expected_url) do
      [
        'https://github.com/hashicorp/envconsul/releases/download',
        'v0.5.0',
        'envconsul_0.5.0_linux_amd64.tar.gz'
      ].join("/")
    end

    it { should contain_wget__fetch('file_url').with_source(expected_url) }
  end

  context 'version >= 0.6.0' do
    let(:params) do
      { :arch => 'amd64', :platform => 'linux', :version => '0.6.1' }
    end

    let(:expected_url) do
      [
        'https://github.com/hashicorp/envconsul/releases/download',
        'v0.6.1',
        'envconsul_0.6.1_linux_amd64.zip'
      ].join("/")
    end

    it { should contain_wget__fetch('file_url').with_source(expected_url) }
  end
end
