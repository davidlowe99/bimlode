# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Bimlode::Application.config.secret_key_base = secure_token
# Bimlode::Application.config.secret_key_base = '8055c5e1e30503cb94c321142f35ada096a0c4c3795739cd7de197e3e3886370aa83e019b0f1f5b39175a96572e2ba3b0986509b4986af3b871b2b84aefaa70c'
