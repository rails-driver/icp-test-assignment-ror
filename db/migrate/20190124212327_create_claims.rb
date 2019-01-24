class CreateClaims < ActiveRecord::Migration[5.1]
  def change
    create_table :claims do |t|
      t.integer :price_drop, default: 0
      t.integer :percentage_drop, default: 0
      t.integer :status, default: 1
      t.integer :cap_drop, default: 0
      t.references :company, foreign_key: true
      t.integer :traded_inflation, default: 0
      t.integer :signed_losses, default: 0
      t.integer :total_potential_income, default: 0
      t.integer :current_potential_income, default: 0
      t.text :data_provided
      t.text :likely_bookbuild

      t.timestamps
    end
  end
end
