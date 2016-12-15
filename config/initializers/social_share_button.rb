# SocialShareButton.configure do |config|
#   config.allow_sites = %w(twitter facebook google_plus weibo qq douban google_bookmark
#                           delicious tumblr pinterest email linkedin wechat vkontakte
#                           xing reddit hacker_news)
# end

SocialShareButton.configure do |config|
  config.allow_sites = %w(email facebook twitter google_plus reddit delicious pinterest)
end