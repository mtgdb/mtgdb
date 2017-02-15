class CreateMagicSets < ActiveRecord::Migration[5.0]
  def change
    create_table :magic_sets do |t|
      t.string :name
      t.string :code
      t.string :gatherer_code
      t.string :old_code
      t.string :magic_cards_info_code
      t.date :release_date
      t.string :border
      t.string :type_of_set
      t.string :block
      t.boolean :online_only
      t.json :booster
      t.string :mkm_name
      t.string :mkm_id
      t.string :magic_rarities_codes
      t.string :slug
    end

    add_index :magic_sets, :slug, unique: true
  end
end
