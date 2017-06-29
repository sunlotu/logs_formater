# ENV['args']
# task :test => :environment do
#   puts ENV['args']
# end
# rake test args=name

# task 'test',[:arg1, :arg2] => :environment do |t, args|
#   puts args
# end
# rake test['hello', 'Li']
# {arg1: 'hello', arg2: 'Li'}

namespace 'logs_formater' do
  desc 'Toggle gem'
  task :toggle => :environment do
    p LogsFormater::Railtie.config.logs_formater.enable
  end
end