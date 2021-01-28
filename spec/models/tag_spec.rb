require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Validations' do
    it 'should have name' do
      tag = build(:tag)

      tag.name = nil
      expect(tag.save).to eq(false)

      tag.name = Faker::ProgrammingLanguage.name
      expect(tag.save).to eq(true)
    end
  end
end
