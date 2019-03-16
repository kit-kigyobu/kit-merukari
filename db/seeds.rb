# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


[
  [1001,'英語'],
  [1002,'ドイツ語'],
  [1003,'中国語'],
  [1004,'フランス語'],
  [1099,'その他の言語'],
  [2000,'数学'],
  [2100,'物理'],
  [3000,'情報'],
  [3100,'電子'],
  [3200,'機械'],
  [4000,'建築'],
  [4100,'デザイン'],
  [5000,'化学'],
  [10000,'ビジネス本'],
  [10001,'自己啓発本'],
  [100010,'小説'],
  [100011,'雑誌'],
  [100012,'マンガ'],
  [200000,'公務員資格']
].each do |c, n |
  Category.create!(
    { category_id: c, name: n }
  )
end

[
  [1001,'デザイン・建築系'],
  [2001,'機械系'],
  [3001,'電子系'],
  [4001,'情報系'],
  [5001,'化学系'],
  [6001,'繊維系'],
  [99999,'その他']
].each do |c, n |
  Course.create!(
    { course_id: c, name: n }
  )
end
