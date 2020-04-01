# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


[
  '未設定',
  '英語',
  'ドイツ語',
  '中国語',
  'フランス語',
  'その他の言語',
  '数学',
  '物理',
  '情報',
  '電子',
  '機械',
  '建築',
  'デザイン',
  '化学',
  'ビジネス本',
  '自己啓発本',
  '小説',
  '雑誌',
  'マンガ',
  '公務員資格'
].each do |n |
  Category.create!(
    { name: n }
  )
end

[
  'デザイン・建築系',
  '機械系',
  '電子系',
  '情報系',
  '化学系',
  '繊維系',
  'その他'
].each do |n |
  Course.create!(
    { name: n }
  )
end
