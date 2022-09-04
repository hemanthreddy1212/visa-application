# == Schema Information
#
# Table name: visa_forms
#
#  id                        :integer          not null, primary key
#  applying_from             :integer
#  extend_date               :date
#  extend_date_description   :text
#  image                     :string
#  is_more_than_one_occasion :boolean
#  stay_period               :integer
#  types_of_occasion         :text
#  visit_end_date            :date
#  visit_start_date          :date
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
class VisaForm < ApplicationRecord
  has_one :user
  accepts_nested_attributes_for :user

  enum applying_from: { "Outside Australia" => 0, "In Australia" => 1 }
  enum stay: { "Up to 3 months" => 0, "Up to 6 months" => 1, "Up to 12 months" => 2 }

  validates :extend_date_description, presence: true

  validates :visit_start_date, :visit_end_date, presence: true, if: Proc.new { |form| form.applying_from == 1 }
  validates :date_of_extend, presence: true, if: Proc.new { |form| form.applying_from == 1 }

  validates :types_of_occasion, presence: true, if: Proc.new { |form| form.is_more_than_one_occasion }

  mount_uploader :image, ImageUploader
end
