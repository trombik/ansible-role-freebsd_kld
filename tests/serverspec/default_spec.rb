require "spec_helper"
require "serverspec"

klds = %w[u3g ichsmb]

klds.each do |k|
  describe command "/sbin/kldstat -n /boot/kernel/#{k}.ko" do
    its(:exit_status) { should eq 0 }
  end
end
