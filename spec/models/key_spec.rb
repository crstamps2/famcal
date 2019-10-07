require 'rails_helper'

RSpec.describe Key, type: :model do
  before :each do
    @key = Key.create!(name: 'bob', value: 'test string')
  end

  it 'encrypts key values' do
    expect(@key.encrypted_value).to_not be_nil
    expect(@key.name).to_not be_nil
    expect(@key.encrypted_value_iv).to_not be_nil
  end
end
