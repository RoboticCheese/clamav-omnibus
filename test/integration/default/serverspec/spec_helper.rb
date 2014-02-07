# -*- encoding: utf-8 -*-

require 'serverspec'
require 'pathname'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.os = backend(Serverspec::Commands::Base).check_os
    c.path = '/sbin:/usr/sbin'

    begin
      require 'ohai'
    rescue LoadError
      require 'rubygems/dependency_installer'
      Gem::DependencyInstaller.new.install('ohai')
      require 'ohai'
    end
    ohai = Ohai::System.new
    ohai.all_plugins
    @node = ohai.data
  end
end

# vim: ai et ts=2 sts=2 sw=2 ft=ruby
