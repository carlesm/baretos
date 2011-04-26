# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_baretos_session',
  :secret      => 'adad759be6443d1037645ec93b0ce5ff00fb5f78fafa7d828fc234d33e4d4c4cb2f7bc09d41e2eff654ce97c56f6c8dafa3f8ca7ec55d9247d6c5c2f61a86b7b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
