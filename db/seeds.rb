#
20.times do |i|
  User.create(email: "example#{i}@mail.com", password: "12345678#{i}", password_confirmation: "12345678#{i}")
end
# 10.times do  |i|
#   Project.create()
# end
# 10.times do |i|
#   Task.create()
# end
# UserToProject.create()