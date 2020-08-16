p "Loading TargetGroups"
target_age_group = TargetAgeGroup.find_or_initialize_by(title: "3 years and older")
target_age_group.update_attributes(age: 3)

target_age_group = TargetAgeGroup.find_or_initialize_by(title: "13 years and older")
target_age_group.update_attributes(age: 13)

target_age_group = TargetAgeGroup.find_or_initialize_by(title: "18 years and older")
target_age_group.update_attributes(age: 18)
