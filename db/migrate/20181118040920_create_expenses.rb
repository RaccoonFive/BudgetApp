class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :name
      t.float :amount
      t.references :expense_category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
