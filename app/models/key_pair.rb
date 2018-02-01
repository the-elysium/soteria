class KeyPair < ApplicationRecord
  # :secret
  # ecryped ASE key with system public key
  # this ASE key is used to encrypt :private_key and :password 
  # Deciphered :secret is a json string:
  #   { 
  #     "cipher":"<cipher name>", 
  #     "key":"<encryptipn key>", 
  #     "iv":"<encryptipn iv>"
  #   } 
  #
  # :public_key
  #
  # :private_key
  # ecryped private key with an ASE key
  #
  # :password
  # ecryped private key passwrod with an ASE key
  #
  # decipher :password / :private_key
  # > c = Cryptographer.new
  # > s = c.decipher_secret(@secret) 
  # > plaintext = c.decrypt(@password, s)

  belongs_to :user
end
