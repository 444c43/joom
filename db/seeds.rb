# create 10 published posts
tags = ["culture", "health", "jacksonville", "technology"]
10.times do | title, blurb, body, created_at, updated_at, published|
  Post.create(
    title: Faker::Book.title,
    blurb: Faker::Lorem.characters(50),
    body: Faker::Lorem.paragraphs(3),
    created_at: Faker::Time.between(DateTime.now - 10, DateTime.now),
    updated_at: Date.today,
    published: true,
    tag_list: tags.sample
  )
end

# create 4 unpublished posts
4.times do | title, blurb, body, created_at, updated_at, published|
  Post.create(
    title: Faker::Book.title,
    blurb: Faker::Lorem.characters(50),
    body: Faker::Lorem.paragraphs(3),
    created_at: Faker::Time.between(DateTime.now - 10, DateTime.now),
    updated_at: Date.today,
    published: false,
    tag_list: tags.sample
  )
end

# create admin account
Admin.create(
  email:                 "me@example.com",
  password:              "password",
  password_confirmation: "password"
)
