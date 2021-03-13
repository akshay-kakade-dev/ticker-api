class CreateTimeSeries < ActiveRecord::Migration[6.1]
  def change
    create_table :time_series do |t|
      t.float :price
      t.references :company, null: false, foreign_key: true, index: true
      t.datetime :value_at

      t.timestamps
    end
  end
end
