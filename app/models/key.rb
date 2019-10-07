class Key < ApplicationRecord
  attr_encrypted :value, key: ENV.fetch('SECRET_KEY_BASE').bytes[0..31].pack( "c" * 32 )

  validates :name, presence: true
  validates :encrypted_value, presence: true
  validates :encrypted_value_iv, presence: true
end
