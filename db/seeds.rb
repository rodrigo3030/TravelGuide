# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

until Country.count == 20 do
    Country.create(name: Faker::Address.country) if
!Country.pluck(:name).include?(Faker::Address.country)
end

    countries = Country.all

until Article.count == 100 do
    Article.create(title: Faker::Book.title, description:
Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), when_went:
Faker::Date.between(from: 10.years.ago, to: Date.today), country_id:
countries.sample.id)
end

until Country.count == 20 do
    Country.create(name: Faker::Address.country) if
!Country.pluck(:name).include?(Faker::Address.country)
end
    countries = Country.all

until Article.count == 100 do
    Article.create(title: Faker::Book.title, description:
Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
when_went: Faker::Date.between(from: 10.years.ago, to: Date.today),
country_id: countries.sample.id)
end

i = 0
until User.count == 20 do
    User.create(email: "test#{i}@gmail", password: "asdasdasd",
"password_confirmation": "asdasdasd", photo: Faker::Avatar.image, name:
Faker::Name.name)
    i += 1
end

articles = Article.all
users = User.all

until Comment.count == 1000 do
    Comment.create(content: Faker::Lorem.paragraph_by_chars(number: 200,
supplemental: false), article_id: articles.sample.id, user_id:
users.sample.id)
end

r_type = %w[article comment]
comments = Comment.all
kinds = Article::Kinds

until Reaction.count == 1000 do
    rel_type = r_type.sample
    if rel_type == "article"
        Reaction.create(article_id: articles.sample.id, user_id:
users.sample.id, kind: kinds.sample, reaction_type: rel_type)
    else
        Reaction.create(comment_id: comments.sample.id, user_id:
users.sample.id, kind: kinds.sample, reaction_type: rel_type)
    end
    
end