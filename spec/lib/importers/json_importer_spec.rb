require 'rails_helper'

RSpec.describe MTGDB::Importers::JSONImporter do
  describe '.run' do
    let(:json) {
      {
        'name' => 'Aether Revolt',
        'code' => 'AER',
        'cards' => [
          {
            'name' => 'Aerial Modification',
            'artist' => 'Jung Park',
            'cmc' => 5,
            'colorIdentity' => ['W'],
            'colors' => ['White'],
            'layout' => 'normal',
            'manaCost' => '{4}{W}',
            'number' => '1',
            'rarity' => 'Uncommon',
            'subtypes' => ['Aura'],
            'text' => 'Some long text',
            'type' => 'Enchantment - Aura',
            'types' => ['Enchantment']
          }
        ]
      }
    }

    it 'should create a magic set' do
      expect{MTGDB::Importers::JSONImporter.run(json)}.to change{MagicCard.count}.from(0).to(1)
    end

    context 'sets the correct fields' do
      let(:magic_card) { MagicCard.first }

      before do
        MTGDB::Importers::JSONImporter.run(json)
      end

      it 'returns the name' do
        expect(magic_card.name).to eq('Aerial Modification')
      end

      it 'returns the artist' do
        expect(magic_card.artist).to eq('Jung Park')
      end

      it 'returns the cmc' do
        expect(magic_card.cmc).to eq('5')
      end

      it 'returns the color identity' do
        expect(magic_card.color_identity).to eq(['W'])
      end

      it 'returns the colors' do
        expect(magic_card.colors).to eq(['White'])
      end

      it 'returns the layout' do
        expect(magic_card.layout).to eq('normal')
      end

      it 'returns the mana cost' do
        expect(magic_card.mana_cost).to eq('{4}{W}')
      end

      it 'returns the number' do
        expect(magic_card.number).to eq('1')
      end

      it 'returns the rarity' do
        expect(magic_card.rarity).to eq('Uncommon')
      end

      it 'returns the subtypes' do
        expect(magic_card.subtypes).to eq(['Aura'])
      end

      it 'returns the text' do
        expect(magic_card.text).to eq('Some long text')
      end

      it 'returns the type' do
        expect(magic_card.type_of_card).to eq('Enchantment - Aura')
      end

      it 'returns the types' do
        expect(magic_card.types).to eq(['Enchantment'])
      end
    end
  end
end
