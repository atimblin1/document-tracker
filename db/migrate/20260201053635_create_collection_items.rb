class CreateCollectionItems < ActiveRecord::Migration[7.1]
  def change
    create_table :collection_items do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true
      t.integer :position, null: false, default: 0

      t.timestamps
    end
    
    add_index :collection_items, [:collection_id, :document_id], unique: true
    add_index :collection_items, [:collection_id, :position]
  end
end
