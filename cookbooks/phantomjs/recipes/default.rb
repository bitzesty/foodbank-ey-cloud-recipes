#
# Cookbook Name:: phantomjs
# Recipe:: default
#

if ['app', 'app_master'].include?(node[:instance_role])

  bash "install_phantomjs" do
    not_if "phantomjs --version | grep -q '1.9.8'"
    user "root"
    cwd "/tmp"
    timeout 7200
    code <<-EOH
      (cd /engineyard/portage/distfiles && sudo wget https://phantomjs.googlecode.com/files/phantomjs-1.9.8-source.zip)
      (cd /engineyard/portage/www-client/phantomjs/ && sudo wget http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/www-client/phantomjs/phantomjs-1.9.8.ebuild && sudo ebuild phantomjs-1.9.8.ebuild digest)
      sudo sh -c 'echo "=www-client/phantomjs-1.9.8 ~amd64" >> /etc/portage/package.accept_keywords'
      sudo emerge --autounmask-write phantomjs
    EOH
  end

end
