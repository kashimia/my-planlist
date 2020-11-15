class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :content
      t.string :complete
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
