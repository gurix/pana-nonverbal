class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.timestamps
      t.belongs_to :subject, index: true
      t.belongs_to :emoji, index: true # Emoji shown
      t.references :distractor, index: true # Verbal value of the distractor emoji
      # We display two verbals, side by side with the correct emoji first. But it is randomly reversed
      t.boolean :reversed, default: false

      t.datetime :showed_at # Moment when the emoji is shown
      t.datetime :rated_at # Moment when the emoji was rated
      t.boolean :rated_correctly # True if the emoji value was rated, false when the distractor was rated
    end
  end

  def down
    drop_table :ratings
  end
end
