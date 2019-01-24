class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, default: ''
      t.string :address, default: ''
      t.string :phone, default: ''
      t.string :email, default: ''
      t.string :website, default: ''

      t.timestamps
    end
  end
end
