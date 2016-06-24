
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
