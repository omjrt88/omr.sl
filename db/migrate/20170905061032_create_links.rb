class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :in_url
      t.string :token
      t.integer :accesses, :default => 0
      t.string :title

      t.timestamps
      t.timestamps
    end
  end
end
