require 'base64'

# all the ciphertext will be kept in base64.

class Cryptographer
  DEFAULT_KEY_PAIR_OPTIONS = {key_size:2048, pk_password:nil, 
    cipher:"AES-256-CBC"}

  def create_key_pair(options = {})
    options = DEFAULT_KEY_PAIR_OPTIONS.merge(options)

    rsa_key = OpenSSL::PKey::RSA.new(options[:key_size])
    public_key = rsa_key.public_key.to_pem
    private_key = nil

    if options[:pk_password]
      cipher =  OpenSSL::Cipher.new(options[:cipher])
      private_key = rsa_key.to_pem(cipher,options[:pk_password])
    else
      private_key = rsa_key.to_pem
    end

    return {public_key: public_key, private_key: private_key, 
      pk_password: options[:pk_password]}
  end

  DEFAULT_SECRET_OPTIONS = {cipher:"AES-256-CBC"}

  def create_secret(options = {})
    options = DEFAULT_SECRET_OPTIONS.merge(options)
    secret = {}

    cipher =  OpenSSL::Cipher.new(options[:cipher])
    cipher.encrypt
    key = cipher.random_key

    cipher.encrypt
    iv = cipher.random_iv

    secret[:cipher] = options[:cipher]
    secret[:key] = Base64.encode64(key)
    secret[:iv] = Base64.encode64(iv)

    return secret
  end

  def sys_pub_key_encrypt(obj)
    return Base64.encode64(
        Rails.configuration.encryption["public_key"].public_encrypt(obj))
  end

  def sys_pri_key_decrypt(obj)
    obj = Base64.decode64(obj)
    plaintext = Rails.configuration.encryption["private_key"].private_decrypt(obj)
    return plaintext
  end

  def decipher_secret(secret)
    secret = self.sys_pri_key_decrypt(secret)
    secret = JSON.parse(secret, symbolize_names:true)
    return secret
  end

  def encrypt(plaintext, secret)
    cipher =  OpenSSL::Cipher.new(secret[:cipher])
    cipher.encrypt
    cipher.iv = Base64.decode64(secret[:iv])
    cipher.key = Base64.decode64(secret[:key])

    ciphertext = cipher.update(plaintext) + cipher.final
    ciphertext = Base64.encode64(ciphertext)
    return ciphertext
  end

  def decrypt(ciphertext, secret)
    cipher =  OpenSSL::Cipher.new(secret[:cipher])
    cipher.decrypt
    cipher.iv = Base64.decode64(secret[:iv])
    cipher.key = Base64.decode64(secret[:key])

    ciphertext = Base64.decode64(ciphertext)
    plaintext = cipher.update(ciphertext) + cipher.final
    return plaintext
  end

end