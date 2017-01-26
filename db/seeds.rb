# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


val_from1=DateTime.new(2016, 12, 01)
val_from2=DateTime.new(2016, 12, 01)
val_until1=DateTime.new(2016, 12, 19)
val_until2=DateTime.new(2016, 12, 19)

list = List.create(name: 'Lista Seed')

SimpleTask.create(description: 'simple task 1', state: 'pending', priority: 3, list: list)
SimpleTask.create(description: 'simple task 2', state: 'done', priority: 1, list: list)

LongTask.create(description: 'long task 1', state: 'on_it', priority: 3, percentage: '10', list: list)
LongTask.create(description: 'long task 2', state: 'pending', priority: 1, percentage: '90', list: list)

TemporalTask.create(description: 'temporal task 1', state: 'pending', priority: 2, valid_from: val_from1, valid_until: val_until1, list: list)
TemporalTask.create(description: 'temporal task 2', state: 'pending', priority: 1, valid_from:val_from2, valid_until: val_until2, list: list)
