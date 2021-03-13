class CreateSheetUploads < ActiveRecord::Migration[6.1]
  def change
    create_table :sheet_uploads do |t|
      t.string :object_key
      t.references :company, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
