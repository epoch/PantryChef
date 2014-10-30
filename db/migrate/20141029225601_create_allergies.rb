class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.string :allergy_name
      t.string :api_request

      t.timestamps
    end
  end
end
