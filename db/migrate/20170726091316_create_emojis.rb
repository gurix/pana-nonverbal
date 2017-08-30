class CreateEmojis < ActiveRecord::Migration[5.1]
  def change
    create_table :emojis do |t|
      t.timestamps
      t.string :set,       null: false # Each emoji appears in one of 4 different sets we test.
      t.string :dimension, null: false # Defines whether it is PA (postitive affect) or NA (negative affect)
      t.string :polarity,  null: false # Each has the polarity «low» or «high». i.e relaxed is NA low but stressed is NA high
      t.string :verbal,    null: false # The verbal representation to the emoji like 😀 = happy
      t.boolean :only_verbal, default: false # If we don't have any image we just use it as distractor
    end
  end

  def down
    drop_table :emojis
  end
end
