class CreateAssociates < ActiveRecord::Migration
  def change
    create_table :associates do |t|
      t.string :company_name
      t.string :title
      t.string :first_name
      t.string :last_name
      t.integer :mobile_number
      t.integer :landline_number
      t.string :bussiness_category
      t.string :address_building
      t.string :address_street
      t.string :address_landmark
      t.string :address_area
      t.string :address_city
      t.integer :address_pincode
      t.string :contact_person
      t.string :contact_person_designation
      t.integer :fax_number
      t.integer :fax_number_two
      t.integer :toll_free_number
      t.integer :toll_free_number_two
      t.string :email_id
      t.string :website
      t.boolean :display_hours_status
      t.integer :year_of_establishment
      t.integer :annual_turnover
      t.string :number_of_employees
      t.string :professional_association
      t.string :certifications
      t.references :payment_mode, index: true, foreign_key: true
      t.string :monday_from
      t.string :monday_to
      t.boolean :monday_status
      t.string :tuesday_from
      t.string :tuesday_to
      t.boolean :tuesday_status
      t.string :wednesday_from
      t.string :wednesday_to
      t.boolean :wednesday_status
      t.string :thursday_from
      t.string :thursday_to
      t.boolean :thursday_status
      t.string :friday_from
      t.string :friday_to
      t.boolean :friday_status
      t.string :saturday_from
      t.string :saturday_to
      t.boolean :saturday_status
      t.string :sunday_from
      t.string :sunday_to
      t.boolean :sunday_status
      t.references :center, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
