#
# Cookbook Name:: site-cookbooks\ricty
# Recipe:: non-display_em-space
#
# Copyright (C) 2013 tarVolcano
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

["fontforge", "unzip"].each do |package|
  yum_package package do
    action :install
  end
end


bash "creat_ricty_non-display_em-space" do
  user "vagrant"
  cwd "/home/vagrant"
  code <<-EOH
  wget https://github.com/yascentur/Ricty/archive/master.zip
  wget http://levien.com/type/myfonts/Inconsolata.otf
  wget 'http://sourceforge.jp/frs/redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F59022%2Fmigu-1m-20130617.zip'
  unzip -o master
  unzip -o migu-1m-20130617.zip
  sh Ricty-master/ricty_generator.sh -z Inconsolata.otf migu-1m-20130617/migu-1m-regular.ttf migu-1m-20130617/migu-1m-bold.ttf
  cp -f Ricty*.ttf /vagrant/
  EOH
end
