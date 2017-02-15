class CreateMagicCards < ActiveRecord::Migration[5.0]
  def change
    create_table :magic_cards do |t|
      t.string :unique_id
      t.string :layout
      t.string :name
      t.json :names
      t.string :mana_cost
      t.string :cmc
      t.json :colors
      t.json :color_identity
      t.string :type_of_card
      t.json :supertypes
      t.json :types
      t.json :subtypes
      t.string :rarity
      t.string :text
      t.string :flavor
      t.string :artist
      t.string :number
      t.string :power
      t.string :toughness
      t.string :loyalty
      t.string :multiverse_id
      t.json :variations
      t.string :image_name
      t.string :watermark
      t.string :border
      t.string :timeshifted
      t.string :hand
      t.string :life
      t.boolean :reserved
      t.string :release_date
      t.boolean :starter
      t.string :mci_number
      t.json :rulings
      t.json :foreign_names
      t.json :printings
      t.string :original_text
      t.string :original_type
      t.json :legalities
      t.string :promo_source
      t.string :slug

      t.references :magic_set, foreign_key: true
    end

    add_index :magic_cards, :slug, unique: true
  end
end
