##
#
namespace :testdata do
  desc 'Test data for users'
  task user: :environment do
    user = User.create(name: 'Sasha', email: 'Sasha@example.com')
    p user
  end
end
