require "spec_helper"
require "serverspec"

package = "freebsd_kld"
service = "freebsd_kld"
config  = "/etc/freebsd_kld/freebsd_kld.conf"
user    = "freebsd_kld"
group   = "freebsd_kld"
ports   = [PORTS]
log_dir = "/var/log/freebsd_kld"
db_dir  = "/var/lib/freebsd_kld"

case os[:family]
when "freebsd"
  config = "/usr/local/etc/freebsd_kld.conf"
  db_dir = "/var/db/freebsd_kld"
end

describe package(package) do
  it { should be_installed }
end

describe file(config) do
  it { should be_file }
  its(:content) { should match Regexp.escape("freebsd_kld") }
end

describe file(log_dir) do
  it { should exist }
  it { should be_mode 755 }
  it { should be_owned_by user }
  it { should be_grouped_into group }
end

describe file(db_dir) do
  it { should exist }
  it { should be_mode 755 }
  it { should be_owned_by user }
  it { should be_grouped_into group }
end

case os[:family]
when "freebsd"
  describe file("/etc/rc.conf.d/freebsd_kld") do
    it { should be_file }
  end
end

describe service(service) do
  it { should be_running }
  it { should be_enabled }
end

ports.each do |p|
  describe port(p) do
    it { should be_listening }
  end
end
