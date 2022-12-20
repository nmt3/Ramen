# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create(email: "admin@admin.com", password: "PortfolioAdmin")


Tag.create([
    { genre: '醤油' },
    { genre: 'とんこつ' },
    { genre: 'みそ' },
    { genre: '塩' },
    { genre: '魚介' },
    { genre: '家系' },
    { genre: '二郎系' },
    { genre: '中村屋系' },
    { genre: 'チェーン系' },
    { genre: '辛口' },
    { genre: '濃厚' },
    ])