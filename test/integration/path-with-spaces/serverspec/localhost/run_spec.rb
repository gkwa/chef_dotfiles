require 'spec_helper'

case os[:family]
when 'windows'
  describe file('c:\Users\vagrant\path with spaces\.tmux.conf') do
    it { should be_a_file }
  end
when 'macOS'
  describe file('/Users/travis/path with spaces/.tmux.conf') do
    it { should be_a_file }
  end
else
  describe file('/root/path with spaces/.tmux.conf') do
    it { should be_a_file }
  end
end
