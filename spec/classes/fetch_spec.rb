require 'spec_helper'

describe 'envconsul::fetch' do
  let(:params) do
    {
      :base_url  => 'https://releases.hashicorp.com/envconsul/0.6.1',
      :base_name => 'envconsul_0.6.1_linux_amd64',
      :extension => '.zip'
    }
  end

  let(:expected_url) do
    [
      'https://releases.hashicorp.com/envconsul/',
      '0.6.1/envconsul_0.6.1_linux_amd64.zip'
    ].join
  end

  it { should contain_wget__fetch('envconsul_file_url').with_source(expected_url) }
end
