class Secret
  def initialize
    @cipher = OpenSSL::Cipher::AES.new(128, :CBC)
    @key = ENV['KEY']
    @iv = ENV['IV']
  end

  def decrypt(data)
    @cipher.decrypt
    @cipher.key = @key
    @cipher.iv = @iv
    @cipher.update(data) + @cipher.final
  end

  def encrypt(data)
    @cipher.encrypt
    @cipher.key = @key
    @cipher.iv = @iv
    @cipher.update(data) + @cipher.final
  end
end
