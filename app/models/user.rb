# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  birth_city           :string
#  birth_country        :string
#  birth_state          :string
#  country_of_passport  :string
#  date_of_birth        :date
#  date_of_expired      :date
#  date_of_issue        :date
#  family_name          :string
#  gender               :boolean
#  given_names          :text
#  issueing_authority   :text
#  passport_nationality :string
#  passport_number      :string
#  relation_ship_status :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  visa_form_id         :integer
#
# Indexes
#
#  index_users_on_visa_form_id  (visa_form_id)
#
class User < ApplicationRecord
  belongs_to :visa_form

  enum relation_ship_status: 
    { "Married" => 0, "Seperated" => 1, "Divorced" => 2 }

  validates :family_name, 
            :given_names,
            :gender,
            :date_of_birth,
            :passport_number,
            :country_of_passport,
            :passport_nationality,
            :date_of_issue,
            :date_of_expired,
            :issueing_authority, presence: true,  unless: Proc.new { |record| record.visa_form.is_more_than_one_occasion }
end
