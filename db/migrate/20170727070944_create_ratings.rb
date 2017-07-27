class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :emoji, index: true
      t.references :choosen_emoji, index: true
      t.timestamps
      t.datetime :showed_at
      t.datetime :rated_at
    end
  end

  def down
    drop_table :ratings
  end
end
