#
# Cookbook Name:: basic
# Recipe:: default
#
# Copyright 2015, AsNet Co.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "build-essential"
include_recipe 'postgresql'

# ensure the local APT package cache is up to date
include_recipe 'apt'
# install ruby_build tool which we will use to build ruby
# include_recipe 'ruby_build'
# ruby_build_ruby '2.0.0-p598' do
#   prefix_path '/usr/local/'
#   environment 'CFLAGS' => '-g -O2'
#   action :install
# end

# gem_package 'bundler' do
#   version '1.2.3'
#   gem_binary '/usr/local/bin/gem'
#   options '--no-ri --no-rdoc'
# end
# we create new user that will run our application server
# user_account 'vagrant' do
#   create_group true
#   ssh_keygen false
# end
# we define our application using application resource provided by application cookbook
application 'lot' do
  owner 'vagrant'
  group 'vagrant'
  path '/home/vagrant/lot'
  revision 'master'        
  repository 'git://github.com/duyphan/lot.git'
  rails do
    database do
      database "lot"
      username "lot_user"
      password "12345"
    end
    bundler true
  end
  unicorn do
    worker_processes 2
  end
end