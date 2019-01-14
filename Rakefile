#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rspec/core/rake_task'

APP_ROOT="."
require 'jettywrapper'
# re-using hydra_jetty.rake from hydra-head
load "tasks/hydra-access-controls.rake"

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  if ENV['COVERAGE'] and RUBY_VERSION =~ /^1.8/
    t.rcov = true
    t.rcov_opts = %w{--exclude spec\/*,gems\/*,ruby\/* --aggregate coverage.data}
  end
end

desc "clean"
task :clean do
  #nop, required by hydra-head ci
end
