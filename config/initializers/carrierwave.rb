require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
 
CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'homework-prod-bucket'
    config.fog_credentials = {
      provider: 'AWS',
      # 環境変数（この場合はrails sする前にターミナルで exportコマンドで環境変数のセットが必要）
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      # 直打ち     
      region: "ap-northeast-1",
      path_style: true
    }
  else
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'homework-dev-bucket'
    config.fog_credentials = {
      provider: 'AWS',
      # 環境変数（この場合はrails sする前にターミナルで exportコマンドで環境変数のセットが必要）
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      # 直打ち      
      region: "ap-northeast-1",
      path_style: true
    }
  end
end
 
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/