require 'serverspec'

describe 'force_default-cookbook::default' do
  describe file('/tmp/string_attribute') do
   its(:content) { should match /^force_default_string$/ }
  end

  describe file('/tmp/array_attribute') do
   its(:content) { should match /^force_default_array$/ }
  end
end
