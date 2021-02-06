# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Student.create(name: 'Eli', grade: 8, parent: 'Micah Levine', email: 'micah.levine@outlook.com', phone_number: 667-555-5555, teacher_id: 1)
Student.create(name: 'Fozzie', grade: 4, parent: 'Micah Levine', email: 'micah.levine@outlook.com', phone_number: 667-555-5555, teacher_id: 2)
Student.create(name: 'Ariana', grade: 2, parent: 'Brett Lebowitz', email: 'brett@brett.com', phone_number: 410-555-5555, teacher_id: 3)
Student.create(name: 'Art', grade: 7, parent: 'Eli Levine', email: 'art@gmail.com', phone_number: 410-555-3214, teacher_id: 4)

Teacher.create(name: 'Levine', grade: 8)
Teacher.create(name: 'Lebowitz', grade: 4)
Teacher.create(name: 'Jackson', grade: 2)
Teacher.create(name: 'Kelly', grade: 5)
Teacher.create(name: 'Levinowitz', grade: 7)