CarrierWave.configure do |config|
 # config.fog_credentials = {
 #   provider:               'AWS',
 #   aws_access_key_id:      ENV['AKIAJQQELEPLOWFC5FXA'],
 #  aws_secret_access_key:  ENV['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']
 # }
 #config.fog_directory  = ENV['AWS_BUCKET']
 #config.fog_public     = true
end

# Ref:
# https://support.cloud.engineyard.com/entries/20996881-Use-CarrierWave-and-Optionally-Fog-to-Upload-and-Store-Files#update3
# http://stackoverflow.com/questions/7946819/carrierwave-and-amazon-s3