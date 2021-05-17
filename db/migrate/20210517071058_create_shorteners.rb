class CreateShorteners < ActiveRecord::Migration[6.1]
  def change
    create_table :shorteners do |t|
      t.string :given_url
      t.string :slug
      t.integer :count, :default => 0

      t.timestamps
    end
  end
end
