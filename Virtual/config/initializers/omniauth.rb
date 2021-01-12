#use OmniAuth::Builder do
#end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '934067443676480', 'ebc697ff5900a7dc111407aa1025c4b9'
end
