require 'spec_helper'

describe 'envconsul::install' do
  context 'zip file' do
    let(:params) { { :file_name => 'file.zip' } }

    it { is_expected.to contain_exec('envconsul_unpack')
          .with( :command => 'unzip -o /tmp/file.zip')
    }
  end

  context 'tar.gz file' do
    let(:params) { { :file_name => 'file.tar.gz' } }

    it { is_expected.to contain_exec('envconsul_unpack')
          .with( :command => 'tar zxf /tmp/file.tar.gz --strip-components 1')
    }
  end
end
