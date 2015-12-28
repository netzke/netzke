require "bundler/gem_tasks"

CLIENT_DOC = "doc/client"

require_relative "#{CLIENT_DOC}/netzke-core/lib/netzke/core/version"
require_relative "#{CLIENT_DOC}/netzke-basepack/lib/netzke/basepack/version"

namespace :client_doc do
  desc "Generate client-side docs"
  task :generate do
    version = "Core #{Netzke::Core::VERSION}, Basepack #{Netzke::Basepack::VERSION}"
    puts "Generating client-side docs #{version}..."
    `rm -rf doc/client/build`
    `yuidoc #{CLIENT_DOC} --project-version "#{version}"`
  end

  desc "Publish client-side docs"
  task publish: :generate do
    server = "netzke.com"
    dir = 'www/api.netzke.org/client'
    puts "Publishing to #{server}:/home/mxgrn/#{dir}..."
    `ssh #{server} "mkdir -p #{dir}"`
    `rsync -r #{CLIENT_DOC}/build/* #{server}:#{dir}`
    puts "Done"
  end
end
