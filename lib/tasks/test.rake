##
#
namespace :test do
  desc 'Say hello'
  task say: :environment do
   puts 'Hello'
  end
end
