Rails.application.config.middleware.use OmniAuth::Builder do
  # full_host Rails.env.production? ? 'https://domain.com' : 'http://localhost:3000'
  # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :facebook, '205074203194359', '657f1d8a8064c7310a82517a9d4509ac' #, {scope: 'email', client_options: {ssl: {ca_file:'/usr/lib/ssl/certs/ca-certificates.crt'}}}
  provider :google_oauth2, '981100342571-4v48qrasjvn0udbgnl2vvd6rfcmtlje8.apps.googleusercontent.com', 'PEmQQITbzrezrFTxvuadbqix', { scope: 'email' }
end