class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :title, null: false
      t.text :description
      t.string :doc_type, null: false
      t.string :status, null: false, default: 'draft'

      t.timestamps
    end
    
    add_index :documents, :status
    add_index :documents, :doc_type
  end
end
