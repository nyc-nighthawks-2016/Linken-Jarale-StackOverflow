
# 10.times do
#   User.create({
#     display_name: Faker::Internet.user_name,
#     email: Faker::Internet.email,
#     password: '1234abcd'})

#   tag = Tag.create({
#     name: Faker::Lorem.word,
#     description: Faker::Lorem.sentence
#     })

#   post = Post.new({
#     title: Faker::Book.title,
#     body: Faker::Lorem.paragraph(2),
#     user_id: rand(1..5)})
#     post.tags << tag
#     post.save

#   Comment.create({
#     content: Faker::Hacker.say_something_smart,
#     user_id: rand(1..5),
#     commentable_id: rand(1..5),
#     commentable_type: ['Post','Answer'].sample})

#   Vote.create({
#     value: [1,-1].sample,
#     votable_id: rand(1..10),
#     votable_type: ['Answer','Post'].sample,
#     user_id: rand(1..5)})

#   Answer.create({
#     body: Faker::Lorem.paragraph(2),
#     user_id: rand(1..5),
#     post_id: rand(1..5)})
# end
10.times do
  Tag.create({
   name: "Broccoli-" + Faker::Lorem.word,
    description: Faker::Lorem.sentence
  })
end

User.create! [
  {
   display_name: 'Master-o-Broccoli',
   email: 'name@email.com',
   password: '1234abcd'
   },

  {
   display_name: 'Broc-o-lantern',
   email: 'grrr@gmail.org',
   password: '1234abcd'
   },

    {
   display_name: 'Davey_Brocclet',
   email: 'davey@hotmail.org',
   password: '1234abcd'
   },

   {
   display_name: 'Cauliflower_Rules',
   email: 'fakeacct@geosites.com',
   password: '1234abcd'
   }
 ]


post = Post.new({
  title: 'Broccoli saved my marriage',
  body: 'My husband and I have been having marital problems until last week when he brought home a bunch of broccoli with him. I have never felt so loved in my life. Thank you broccoli.',
  user_id: rand(1..4)})
  post.tags << Tag.all.sample
  post.save

post1 = Post.new({
  title: 'How do I grow a broccoli tree?',
  body: "I've been wanting to plant my own broccoli tree. Is this how I do it?.",
  user_id: rand(1..4)})
  post1.tags << Tag.all.sample
  post1.save

post2 = Post.new({
  title: 'Broccoli is stupid!',
  body: 'Broccoli sucks and so does this site!.',
  user_id: 4})
  post2.tags << Tag.all.sample
  post2.save



























