class CreateVisaForms < ActiveRecord::Migration[7.0]
  def change
    create_table :visa_forms do |t|
      t.integer   :applying_from
      t.date      :visit_start_date
      t.date      :visit_end_date
      t.integer   :stay_period
      t.boolean   :is_more_than_one_occasion
      t.text      :types_of_occasion
      t.date      :extend_date
      t.text      :extend_date_description
      t.string    :image

      t.timestamps
    end
  end
end
