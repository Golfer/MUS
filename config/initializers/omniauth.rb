Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '205074203194359', '657f1d8a8064c7310a82517a9d4509ac',
           scope: 'public_profile', display: 'page', image_size: 'square'
   #, {scope: 'email', client_options: {ssl: {ca_file:'/usr/lib/ssl/certs/ca-certificates.crt'}}}
  # provider :google_oauth2, '981100342571-4v48qrasjvn0udbgnl2vvd6rfcmtlje8.apps.googleusercontent.com', 'PEmQQITbzrezrFTxvuadbqix', { scope: 'email' }
  # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end