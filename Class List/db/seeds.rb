# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Student.create(name: 'Eli', parent: 'Micah Levine', email: 'micah.levine@outlook.com', phone_number: 667-555-5555, user_id: 1, teacher_id: 1)
Student.create(name: 'Fozzie', parent: 'Micah Levine', email: 'micah.levine@outlook.com', phone_number: 667-555-5555, user_id: 1, teacher_id: 2)
Student.create(name: 'Ariana', parent: 'Brett Lebowitz', email: 'brett@brett.com', phone_number: 410-555-5555, user_id: 1, teacher_id: 3)

Teacher.create(name: 'Levine', grade: 8)
Teacher.create(name: 'Lebowitz', grade: 4)
Teacher.create(name: 'Jackson', grade: 2)
Teacher.create(name: 'Kelly', grade: 5)
Teacher.create(name: 'Levinowitz', grade: 7)