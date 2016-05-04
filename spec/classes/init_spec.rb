require 'spec_helper'
describe 'envconsul' do
  let (:facts) {{
    'kernel' => 'Linux'
  }}

  context 'with defaults for all parameters' do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('envconsul') }
    it { is_expected.to contain_class('envconsul::fetch') }
    it { is_expected.to contain_class('envconsul::install') }
    it { is_expected.to contain_class('envconsul::params') }
  end
end
