class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.references :visa_form, index: true
      t.string    :family_name
      t.text      :given_names
      t.boolean   :gender
      t.date      :date_of_birth
      t.string    :passport_number
      t.string    :country_of_passport
      t.string    :passport_nationality
      t.date      :date_of_issue
      t.date      :date_of_expired
      t.text      :issueing_authority
      t.string    :birth_city
      t.string    :birth_state
      t.string    :birth_country
      t.integer   :relation_ship_status
      
      t.timestamps
    end
  end
end
