target_age_group = TargetAgeGroup.find_or_initialize_by(title: "3 years and older")
target_age_group.update_attributes(min_age: 3, max_age: 13)

target_age_group = TargetAgeGroup.find_or_initialize_by(title: "13 years and older")
target_age_group.update_attributes(min_age: 13, max_age: 18)

target_age_group = TargetAgeGroup.find_or_initialize_by(title: "18 years and older")
target_age_group.update_attributes(min_age: 18, max_age: nil)
