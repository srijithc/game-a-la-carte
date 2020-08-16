users = [["Adrian", "adrian@gmail.com", 15],
         ["Vladimir", "vladimir@gmail.com", 43],
         ["Naveen", "naveen@gmail.com", 5],
         ["Xi", "xi@gmail.com", 17],
         ["Mitsuki", "mitsuki@gmail.com", 32],
         ["Olivier", "olivier@gmail.com", 26],
         ["Roberto", "roberto@gmail.com", 12],
         ["Sharzad", "sharzad@gmail.com", 37]]

users.each do |name, email, age|
  default_password = "user1234"
  user = User.find_or_initialize_by({email: email})
  user.password = default_password
  user.confirm

  user.personal_information = user.build_personal_information if user.personal_information.blank?

  user.personal_information.name = name
  user.personal_information.age = age
  user.save
end