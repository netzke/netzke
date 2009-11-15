begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.version = "0.6.0"
    gemspec.name = "netzke"
    gemspec.summary = "RIA with Rails and ExtJS made easy"
    gemspec.description = "Framework integrating Rails and ExtJS"
    gemspec.email = "sergei@playcode.nl"
    gemspec.homepage = "http://github.com/skozlov/netzke"
    gemspec.authors = ["Sergei Kozlov"]
    gemspec.add_dependency("netzke-core", ">=0.4.5.2")
    gemspec.add_dependency("netzke-basepack", ">=0.5.5.1")
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "netzke-core #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end
