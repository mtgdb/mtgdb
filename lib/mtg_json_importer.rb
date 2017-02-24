class MtgJsonImporter
  def self.run(data)
    magic_set = MagicSet.where(code: data['code']).first_or_initialize.tap do |set|
      set.name = data['name']
      set.code = data['code']
      set.gatherer_code = data['gathererCode']
      set.old_code = data['oldCode']
      set.magic_cards_info_code = data['magicCardsInfoCode']
      set.release_date = data['releaseDate']
      set.border = data['border']
      set.type_of_set = data['type']
      set.block = data['block']
      set.online_only = data['onlineOnly']
      set.booster = data['booster']
      set.mkm_name = data['mkm_name']
      set.mkm_id = data['mkm_id']
      set.magic_rarities_codes = data['magicRaritiesCodes']
      set.save
    end

    return if data['cards'].nil?

    data['cards'].each do |value|
      MagicCard.where(unique_id: value['id']).first_or_initialize.tap do |card|
        card.unique_id = value['id']
        card.layout = value['layout']
        card.name = value['name']
        card.names = value['names']
        card.mana_cost = value['manaCost']
        card.cmc = value['cmc']
        card.colors = value['colors']
        card.color_identity = value['colorIdentity']
        card.type_of_card = value['type']
        card.supertypes = value['supertypes']
        card.types = value['types']
        card.subtypes = value['subtypes']
        card.rarity = value['rarity']
        card.text = value['text']
        card.flavor = value['flavor']
        card.artist = value['artist']
        card.number = value['number']
        card.power = value['power']
        card.toughness = value['toughness']
        card.loyalty = value['loyalty']
        card.multiverse_id = value['multiverseid']
        card.variations = value['variations']
        card.image_name = value['imageName']
        card.watermark = value['watermark']
        card.border = value['border']
        card.timeshifted = value['timeshifted']
        card.hand = value['hand']
        card.life = value['life']
        card.reserved = value['reserved']
        card.release_date = value['releaseDate']
        card.starter = value['starter']
        card.mci_number = value['mciNumber']
        card.rulings = value['rulings']
        card.foreign_names = value['foreignNames']
        card.printings = value['printings']
        card.original_text = value['originalText']
        card.original_type = value['originalType']
        card.legalities = value['legalities']
        card.promo_source = value['source']
        card.magic_set_id = magic_set.id
        card.save
      end
    end
  end
end
