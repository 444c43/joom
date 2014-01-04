namespace :db do
  desc 'fill the database with goodies to work with'
  task :populate => :environment do

    Admin.create(email: 'dl@example.com', password: 'password')

  end
end
