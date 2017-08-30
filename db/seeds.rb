# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

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

# Add emoji set from Rahel Kern
set_name = 'RK'

Emoji.create(verbal: 'gestresst', dimension: :na,  polarity: :high, set: set_name)
Emoji.create(verbal: 'verärgert', dimension: :na,  polarity: :high, set: set_name)
Emoji.create(verbal: 'nervös', dimension: :na, polarity: :high, set: set_name)
Emoji.create(verbal: 'besorgt', dimension: :na, polarity: :high, set: set_name, only_verbal: true)

Emoji.create(verbal: 'entspannt', dimension: :na,  polarity: :low, set: set_name)
Emoji.create(verbal: 'friedlich', dimension: :na,  polarity: :low, set: set_name)
Emoji.create(verbal: 'ruhig', dimension: :na, polarity: :low, set: set_name)
Emoji.create(verbal: 'sorgenfrei', dimension: :na, polarity: :low, set: set_name, only_verbal: true)

Emoji.create(verbal: 'energiegeladen', dimension: :pa, polarity: :high, set: set_name)
Emoji.create(verbal: 'hellwach', dimension: :pa,  polarity: :high, set: set_name, only_verbal: true)
Emoji.create(verbal: 'hoch motiviert', dimension: :pa, polarity: :high, set: set_name)
Emoji.create(verbal: 'begeistert', dimension: :pa,  polarity: :high, set: set_name, only_verbal: true)

Emoji.create(verbal: 'energielos', dimension: :pa,  polarity: :low, set: set_name)
Emoji.create(verbal: 'müde', dimension: :pa,  polarity: :low, set: set_name, only_verbal: true)
Emoji.create(verbal: 'lustlos', dimension: :pa, polarity: :low, set: set_name)
Emoji.create(verbal: 'gelangweilt', dimension: :pa, polarity: :low, set: set_name, only_verbal: true)

# Add emoji set from Gioia Loretz
(1..3).each do | i |
  set_name = "GL_#{i}"

  Emoji.create(verbal: 'gestresst', dimension: :na,  polarity: :high, set: set_name, only_verbal: true)
  Emoji.create(verbal: 'verärgert', dimension: :na,  polarity: :high, set: set_name)
  Emoji.create(verbal: 'nervös', dimension: :na, polarity: :high, set: set_name, only_verbal: true)
  Emoji.create(verbal: 'besorgt', dimension: :na, polarity: :high, set: set_name, only_verbal: true)

  Emoji.create(verbal: 'entspannt', dimension: :na,  polarity: :low, set: set_name, only_verbal: true)
  Emoji.create(verbal: 'friedlich', dimension: :na,  polarity: :low, set: set_name)
  Emoji.create(verbal: 'ruhig', dimension: :na, polarity: :low, set: set_name, only_verbal: true)
  Emoji.create(verbal: 'sorgenfrei', dimension: :na, polarity: :low, set: set_name, only_verbal: true)

  Emoji.create(verbal: 'energiegeladen', dimension: :pa, polarity: :high, set: set_name, only_verbal: true)
  Emoji.create(verbal: 'hellwach', dimension: :pa,  polarity: :high, set: set_name)
  Emoji.create(verbal: 'hoch motiviert', dimension: :pa, polarity: :high, set: set_name, only_verbal: true)
  Emoji.create(verbal: 'begeistert', dimension: :pa,  polarity: :high, set: set_name)

  Emoji.create(verbal: 'energielos', dimension: :pa,  polarity: :low, set: set_name, only_verbal: true)
  Emoji.create(verbal: 'müde', dimension: :pa,  polarity: :low, set: set_name)
  Emoji.create(verbal: 'lustlos', dimension: :pa, polarity: :low, set: set_name, only_verbal: true)
  Emoji.create(verbal: 'gelangweilt', dimension: :pa, polarity: :low, set: set_name)

end