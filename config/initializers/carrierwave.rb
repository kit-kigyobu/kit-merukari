
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['ap-northeast-1'],
      :aws_access_key_id     => ENV['AKIAVAQTHAT4AMLVXOVI'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['osagary']
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end

  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end
