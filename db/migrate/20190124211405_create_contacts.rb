class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name, default: ''
      t.string :address, default: ''
      t.string :phone, default: ''
      t.string :email, default: ''
      t.string :position, default: ''
      t.references :company, foreign_key: { on_delete: :nullify }, index: true

      t.timestamps
    end
  end
end
