CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAVAQTHAT4AMLVXOVI',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'osagary'
  config.cache_storage = :fog
end
