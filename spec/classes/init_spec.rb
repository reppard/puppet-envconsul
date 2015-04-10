require 'spec_helper'
describe 'envconsul' do

  context 'with defaults for all parameters' do
    it { should contain_class('envconsul') }
  end
end
