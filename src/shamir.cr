require "openssl/cipher"
require "./utils.cr"

module AES
  # Encrypts `in_file` using AES-256 and outputs to `out_file`
  # Returns the password used to encrypt the file
  def self.encrypt(in_file, out_file)
    cipher = OpenSSL::Cipher.new("aes-256-cbc")
    cipher.encrypt
    password = cipher.random_key

    File.open(out_file, mode="w") do |out_file|
      File.open(in_file) do |in_file|
          BytesIterator.new(in_file).each() do |chunk|
              out_file.write(cipher.update(chunk))
          end
      end
      out_file.write(cipher.final)
    end

    password
  end

  # Dencrypts `in_file` using `password` and outputs to `out_file`
  def self.decrypt(in_file, out_file, password)
    cipher = OpenSSL::Cipher.new("aes-256-cbc")
    cipher.decrypt
    cipher.key = password

    File.open(out_file, mode="w") do |out_file|
        File.open(in_file) do |in_file|
            BytesIterator.new(in_file).each() do |chunk|
                out_file.write(cipher.update(chunk))
            end
        end
        out_file.write(cipher.final)
    end
  end
end
