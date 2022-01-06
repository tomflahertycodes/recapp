class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :role
      t.string :location
      t.string :contract
      t.integer :rate
      t.string :sector
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
