# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning database"
Job.destroy_all
User.destroy_all



puts "creating consultants"
user1 = User.new(email: 'ben@keyman.com', password:123456, name:'ben', position: 'consultant', company: "keyman")
user1.save!
user2 = User.new(email: 'guy@gmail.com', password:123456, name:'guy', position: 'consultant', company: "keyman")
user2.save!


puts "creating clients"
user3 = User.new(email: 'dan@gmail.com', password:123456, name:'dan', position: 'contracts manager', company: "Bam")
user3.save!
user4 = User.new(email: 'curtis@gmail.com', password:123456, name:'curtis', position: 'project manager', company: "galldris")
user4.save!

@userid = user1.id
@user2 = user2.id

puts "creating jobs"

job1 = Job.new(
  role: "Site Engineer",
  location: "london",
  contract: "contract",
  rate: 220 ,
  sector: "construction",
  user_id: user1.id
)
job1.save!

job2 = Job.new(
  role: "Project Manager",
  location: "london",
  contract: "contract",
  rate: 55000 ,
  sector: "construction",
  user_id: user2.id
)
job2.save!

puts "done"
