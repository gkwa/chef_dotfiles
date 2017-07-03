require 'spec_helper'

case os[:family]
when 'windows'
  describe file('c:\Users\vagrant\.tmux.conf') do
    it { should be_a_file }
  end
when 'macOS'
  describe file('/Users/travis/.tmux.conf') do
    it { should be_a_file }
  end
else
  describe file('/root/.tmux.conf') do
    it { should be_a_file }
  end
end
