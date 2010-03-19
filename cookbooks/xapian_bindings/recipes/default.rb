require 'pp'

bash "install-xapian " do
  user "root"
  code 'echo "dev-libs/xapian ~x86" >> /etc/portage/package.keywords/ec2'
end
bash "append-portage" do
  user "root"
  code 'echo "dev-libs/xapian-bindings ~x86" >> /etc/portage/package.keywords/ec2'
end
execute "emerge-xapian" do
  command 'emerge --sync'
  command 'emerge dev-libs/xapian-bindings'
end
