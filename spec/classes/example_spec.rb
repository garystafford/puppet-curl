require 'spec_helper'

describe 'curl' do
  context 'supported operating systems' do
    ['Amazon', 'Debian', 'RedHat'].each do |osfamily|
      describe "curl class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should include_class('curl::params') }
        it { should contain_class('curl::install') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'curl class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
