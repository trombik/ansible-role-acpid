require "spec_helper"
require "serverspec"

package = "acpid"
service = "acpid"
events_dir = "/etc/acpi/events"

describe package(package) do
  it { should be_installed }
end

case os[:family]
when "redhat"
  describe file "/etc/sysconfig/acpid" do
    it { should be_file }
    its(:content) { should match(/# Managed by ansible/) }
    its(:content) { should match Regexp.escape('OPTIONS=""') }
  end
when "ubuntu"
  describe file "/etc/default/acpid" do
    it { should be_file }
    its(:content) { should match(/# Managed by ansible/) }
    its(:content) { should match Regexp.escape('OPTIONS=""') }
  end
end

describe file("#{events_dir}/foo") do
  it { should be_file }
  its(:content) { should match(/# Managed by ansible/) }
  its(:content) { should match Regexp.escape("event=foo/bar") }
  its(:content) { should match Regexp.escape("action=/bin/echo foo") }
end

describe service(service) do
  it { should be_running }
  it { should be_enabled }
end
