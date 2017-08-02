# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Add emoji set from Maren Lebender
set_name = 'ML_simple'

Emoji.create(verbal: 'gestresst', dimension: :na,  polarity: :high, set: set_name)
Emoji.create(verbal: 'verärgert', dimension: :na,  polarity: :high, set: set_name)
Emoji.create(verbal: 'nervös', dimension: :na, polarity: :high, set: set_name)
Emoji.create(verbal: 'besorgt', dimension: :na, polarity: :high, set: set_name)

Emoji.create(verbal: 'entspannt', dimension: :na,  polarity: :low, set: set_name)
Emoji.create(verbal: 'friedlich', dimension: :na,  polarity: :low, set: set_name)
Emoji.create(verbal: 'ruhig', dimension: :na, polarity: :low, set: set_name)
Emoji.create(verbal: 'sorgenfrei', dimension: :na, polarity: :low, set: set_name)

Emoji.create(verbal: 'energiegeladen', dimension: :pa, polarity: :high, set: set_name)
Emoji.create(verbal: 'hellwach', dimension: :pa,  polarity: :high, set: set_name)
Emoji.create(verbal: 'hoch motiviert', dimension: :pa, polarity: :high, set: set_name)
Emoji.create(verbal: 'begeistert', dimension: :pa,  polarity: :high, set: set_name)

Emoji.create(verbal: 'energielos', dimension: :pa,  polarity: :low, set: set_name)
Emoji.create(verbal: 'müde', dimension: :pa,  polarity: :low, set: set_name)
Emoji.create(verbal: 'lustlos', dimension: :pa, polarity: :low, set: set_name)
Emoji.create(verbal: 'gelangweilt', dimension: :pa, polarity: :low, set: set_name)
