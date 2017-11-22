require 'rails_helper'

RSpec.describe ChangeController do
  describe '.make_change' do
    context '$0.00'  do
      it 'makes correct change' do
        change_hash = JSON.parse(ChangeService.make_change('0.0').to_json)
        expect(change_hash['silver-dollar']).to eq(0)
        expect(change_hash['half-dollar']).to eq(0)
        expect(change_hash['quarter']).to eq(0)
        expect(change_hash['dime']).to eq(0)
        expect(change_hash['nickel']).to eq(0)
        expect(change_hash['penny']).to eq(0)
      end
    end

    context '$0.99' do
      it 'makes correct change' do
        change_hash = JSON.parse(ChangeService.make_change(0.99).to_json)
        expect(change_hash['silver-dollar']).to eq(0)
        expect(change_hash['half-dollar']).to eq(1)
        expect(change_hash['quarter']).to eq(1)
        expect(change_hash['dime']).to eq(2)
        expect(change_hash['nickel']).to eq(0)
        expect(change_hash['penny']).to eq(4)
      end
    end

    context '$1.56' do
      it 'makes correct change' do
        change_hash = JSON.parse(ChangeService.make_change(1.56).to_json)
        expect(change_hash['silver-dollar']).to eq(1)
        expect(change_hash['half-dollar']).to eq(1)
        expect(change_hash['quarter']).to eq(0)
        expect(change_hash['dime']).to eq(0)
        expect(change_hash['nickel']).to eq(1)
        expect(change_hash['penny']).to eq(1)
      end
    end

    context '$12.85' do
      it 'makes correct change' do
        change_hash = JSON.parse(ChangeService.make_change(12.85).to_json)
        expect(change_hash['silver-dollar']).to eq(12)
        expect(change_hash['half-dollar']).to eq(1)
        expect(change_hash['quarter']).to eq(1)
        expect(change_hash['dime']).to eq(0)
        expect(change_hash['nickel']).to eq(1)
        expect(change_hash['penny']).to eq(0)
      end
    end

    context 'the meaning of life'  do
      it 'handles invalid input' do
        change_hash = JSON.parse(ChangeService.make_change('the meaning of life').to_json)
        expect(change_hash['silver-dollar']).to eq(0)
        expect(change_hash['half-dollar']).to eq(0)
        expect(change_hash['quarter']).to eq(0)
        expect(change_hash['dime']).to eq(0)
        expect(change_hash['nickel']).to eq(0)
        expect(change_hash['penny']).to eq(0)
      end
    end
  end
end
