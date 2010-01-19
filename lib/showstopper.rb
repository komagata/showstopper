Capistrano::Configuration.instance.load do
  namespace :deploy do
    desc 'Executing RSpec tests'
    task :spec do
      unless system 'ruby script/spec spec -f progress > /dev/null 2>&1'
        logger.trace 'rspec test failed'
        exit(1)
      end
    end
    before :deploy, 'deploy:spec'
  end
end
