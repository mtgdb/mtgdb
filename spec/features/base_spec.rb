require 'rails_helper'

RSpec.describe 'Base' do
  describe 'homepage' do
    context 'when visiting the homepage' do
      before do
        visit(root_path)
      end

      it 'returns an ok status' do
        expect(page.status_code).to eq(200)
      end
    end
  end
end
