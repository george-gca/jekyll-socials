# frozen_string_literal: true

module Jekyll
  class SocialLinksTag < Liquid::Tag
    # https://jpswalsh.github.io/academicons/
    ACADEMICONS = {
      'acm_id' => "<i class='ai ai-acm'></i>",
      'dblp_url' => "<i class='ai ai-dblp'></i>",
      'ieee_id' => "<i class='ai ai-ieee'></i>",
      'inspirehep_id' => "<i class='ai ai-inspire'></i>",
      'lattes_id' => "<i class='ai ai-lattes'></i>",
      'orcid_id' => "<i class='ai ai-orcid'></i>",
      'osf_id' => "<i class='ai ai-osf'></i>",
      'publons_id' => "<i class='ai ai-publons'></i>",
      'research_gate_profile' => "<i class='ai ai-researchgate'></i>",
      'scholar_userid' => "<i class='ai ai-google-scholar'></i>",
      'scopus_id' => "<i class='ai ai-scopus'></i>",
      'semanticscholar_id' => "<i class='ai ai-semantic-scholar'></i>",
    }.freeze

    # https://fontawesome.com/search
    FONT_AWESOME = {
      'blogger_url' => "<i class='fa-brands fa-blogger-b'></i>",
      'bluesky_url' => "<i class='fa-brands fa-bluesky'></i>",
      'discord_id' => "<i class='fa-brands fa-discord'></i>",
      'email' => "<i class='fa-solid fa-envelope'></i>",
      'facebook_id' => "<i class='fa-brands fa-facebook'></i>",
      'flickr_id' => "<i class='fa-brands fa-flickr'></i>",
      'github_username' => "<i class='fa-brands fa-github'></i>",
      'gitlab_username' => "<i class='fa-brands fa-gitlab'></i>",
      'instagram_id' => "<i class='fa-brands fa-instagram'></i>",
      'kaggle_id' => "<i class='fa-brands fa-kaggle'></i>",
      'keybase_username' => "<i class='fa-brands fa-keybase'></i>",
      'lastfm_id' => "<i class='fa-brands fa-lastfm'></i>",
      'linkedin_username' => "<i class='fa-brands fa-linkedin'></i>",
      'mastodon_username' => "<i class='fa-brands fa-mastodon'></i>",
      'medium_username' => "<i class='fa-brands fa-medium'></i>",
      'pinterest_id' => "<i class='fa-brands fa-pinterest'></i>",
      'quora_username' => "<i class='fa-brands fa-quora'></i>",
      'rss_icon' => "<i class='fa-solid fa-square-rss'></i>",
      'spotify_id' => "<i class='fa-brands fa-spotify'></i>",
      'stackoverflow_id' => "<i class='fa-brands fa-stack-overflow'></i>",
      'strava_userid' => "<i class='fa-brands fa-strava'></i>",
      'telegram_username' => "<i class='fa-brands fa-telegram'></i>",
      'unsplash_id' => "<i class='fa-brands fa-unsplash'></i>",
      'wechat_qr' => "<i class='fa-brands fa-weixin'></i>",
      'whatsapp_number' => "<i class='fa-brands fa-whatsapp'></i>",
      'wikidata_id' => "<i class='fa-solid fa-barcode'></i>",
      'wikipedia_id' => "<i class='fa-brands fa-wikipedia-w'></i>",
      'work_url' => "<i class='fa-solid fa-briefcase'></i>",
      'x_username' => "<i class='fa-brands fa-x-twitter'></i>",
      'youtube_id' => "<i class='fa-brands fa-youtube'></i>",
      'zotero_username' => "<i class='fa-brands fa-zotero'></i>"
    }.freeze

    # https://louisfacun.github.io/scholar-icons/
    SCHOLAR_ICONS = {
      'leetcode_id' => "<i class='si si-leetcode'></i>"
    }.freeze

    SOCIAL_ICONS = ACADEMICONS.merge(FONT_AWESOME).merge(SCHOLAR_ICONS)

    SOCIAL_URLS = {
      'acm_id' => "https://dl.acm.org/profile/%s/",
      'blogger_url' => "%s",
      'bluesky_url' => "%s",
      'dblp_url' => "%s",
      'discord_id' => "https://discord.com/users/%s",
      'email' => "mailto:%s",
      'facebook_id' => "https://facebook.com/%s",
      'flickr_id' => "https://www.flickr.com/%s",
      'github_username' => "https://github.com/%s",
      'gitlab_username' => "https://gitlab.com/%s",
      'ieee_id' => "https://ieeexplore.ieee.org/author/%s/",
      'inspirehep_id' => "https://inspirehep.net/authors/%s",
      'instagram_id' => "https://instagram.com/%s",
      'kaggle_id' => "https://www.kaggle.com/%s",
      'keybase_username' => "https://keybase.io/%s",
      'lastfm_id' => "https://www.last.fm/user/%s",
      'lattes_id' => "http://lattes.cnpq.br/%s",
      'leetcode_id' => "https://leetcode.com/u/%s/",
      'linkedin_username' => "https://www.linkedin.com/in/%s",
      'mastodon_username' => "https://%s",
      'medium_username' => "https://medium.com/@%s",
      'orcid_id' => "https://orcid.org/%s",
      'osf_id' => "https://osf.io/%s/",
      'pinterest_id' => "https://www.pinterest.com/%s",
      'publons_id' => "https://publons.com/a/%s/",
      'quora_username' => "https://www.quora.com/profile/%s",
      'research_gate_profile' => "https://www.researchgate.net/profile/%s/",
      'rss_icon' => "%s",
      'scholar_userid' => "https://scholar.google.com/citations?user=%s",
      'scopus_id' => "https://www.scopus.com/authid/detail.uri?authorId=%s",
      'semanticscholar_id' => "https://www.semanticscholar.org/author/%s",
      'spotify_id' => "https://open.spotify.com/user/%s",
      'stackoverflow_id' => "https://stackoverflow.com/users/%s",
      'strava_userid' => "https://www.strava.com/athletes/%s",
      'telegram_username' => "https://telegram.me/%s",
      'unsplash_id' => "https://unsplash.com/@%s",
      'wechat_qr' => "%s",
      'whatsapp_number' => "https://wa.me/%s",
      'wikidata_id' => "https://www.wikidata.org/wiki/%s",
      'wikipedia_id' => "https://wikipedia.org/wiki/User:%s",
      'work_url' => "%s",
      'x_username' => "https://twitter.com/%s",
      'youtube_id' => "https://youtube.com/@%s",
      'zotero_username' => "https://www.zotero.org/%s"
    }.freeze

    def initialize(tag_name, text, tokens)
      super
      # @text = text.strip
    end

    def render(context)
      # get socials information from _data/socials.yml
      socials = context.registers[:site].data['socials'] || []
      socials.map do |social|
        icon = SOCIAL_ICONS[social[0]]
        url_template = SOCIAL_URLS[social[0]]
        if icon && url_template
          if social[0] == 'rss_icon'
            url = url_template % context.registers[:site].baseurl + '/feed.xml'
          else
            url = url_template % social[1]
          end
          "<a href='#{url}' title='#{social[0].gsub('_', ' ').capitalize}'>#{icon}</a>"
        else
          file_ext = social[1]['logo'].split('.').last
          if file_ext == 'svg'
            if social[1]['logo'].include?('://')
              img_code = "<svg><image xlink:href='#{social[1]['logo']}' /></svg>"
            else
              img_code = "<svg><image xlink:href='#{social[1]['logo'] | relative_url}' /></svg>"
            end
          else
            if social[1]['logo'].include?('://')
              img_code = "<img src='#{social[1]['logo']}' alt='#{social[1]['title']}'>"
            else
              img_code = "<img src='#{social[1]['logo'] | relative_url}' alt='#{social[1]['title']}'>"
            end
          end
          "<a href='#{social[1]['url']}' title='#{social[1]['title']}'>#{img_code}</a>"
        end
      end.join(" ")
    end
  end
end

Liquid::Template.register_tag('social_links', Jekyll::SocialLinksTag)

# module Jekyll
#   class SocialLinksTag < Liquid::Tag

#     def initialize(tag_name, text, tokens)
#       super
#       @text = text.strip
#     end

#     def render(context)
#       # get socials information from _data/socials.yml
#       socials = context.registers[:site].data['socials'] || []
#       socials.map do |social|
#         puts "social: #{social}"
#         case social[0]
#         when 'acm_id'
#           "<a href='https://dl.acm.org/profile/#{social[1]}/' title='ACM DL'><i class='ai ai-acm'></i></a>"
#         when 'blogger_url'
#           "<a href='#{social[1]}' title='Blogger'><i class='fa-brands fa-blogger-b'></i></a>"
#         when 'bluesky_url'
#           "<a href='#{social[1]}' title='Bluesky'><i class='fa-brands fa-bluesky'></i></a>"
#         when 'dblp_url'
#           "<a href='#{social[1]}' title='DBLP'><i class='ai ai-dblp'></i></a>"
#         when 'discord_id'
#           "<a href='https://discord.com/users/#{social[1]}' title='Discord'><i class='fa-brands fa-discord'></i></a>"
#         when 'email'
#           "<a href='mailto:#{social[1]}' title='email'><i class='fa-solid fa-envelope'></i></a>"
#         when 'facebook_id'
#           "<a href='https://facebook.com/#{social[1]}' title='Facebook'><i class='fa-brands fa-facebook'></i></a>"
#         when 'flickr_id'
#           "<a href='https://www.flickr.com/#{social[1]}' title='Flickr'><i class='fa-brands fa-flickr'></i></a>"
#         when 'github_username'
#           "<a href='https://github.com/#{social[1]}' title='GitHub'><i class='fa-brands fa-github'></i></a>"
#         when 'gitlab_username'
#           "<a href='https://gitlab.com/#{social[1]}' title='GitLab'><i class='fa-brands fa-gitlab'></i></a>"
#         when 'ieee_id'
#           "<a href='https://ieeexplore.ieee.org/author/#{social[1]}/' title='IEEE Xplore'><i class='ai ai-ieee'></i></a>"
#         when 'inspirehep_id'
#           "<a href='https://inspirehep.net/authors/#{social[1]}' title='Inspire HEP'><i class='ai ai-inspire'></i></a>"
#         when 'instagram_id'
#           "<a href='https://instagram.com/#{social[1]}' title='Instagram'><i class='fa-brands fa-instagram'></i></a>"
#         when 'kaggle_id'
#           "<a href='https://www.kaggle.com/#{social[1]}' title='Kaggle'><i class='fa-brands fa-kaggle'></i></a>"
#         when 'keybase_username'
#           "<a href='https://keybase.io/#{social[1]}' title='Keybase'><i class='fa-brands fa-keybase'></i></a>"
#         when 'lastfm_id'
#           "<a href='https://www.last.fm/user/#{social[1]}' title='Last FM'><i class='fa-brands fa-lastfm'></i></a>"
#         when 'lattes_id'
#           "<a href='http://lattes.cnpq.br/#{social[1]}' target='_blank' title='Lattes'><i class='ai ai-lattes'></i></a>"
#         when 'leetcode_id'
#           "<a href='https://leetcode.com/u/#{social[1]}/' target='_blank' title='LeetCode'><i class='si si-leetcode'></i></a>"
#         when 'linkedin_username'
#           "<a href='https://www.linkedin.com/in/#{social[1]}' title='LinkedIn'><i class='fa-brands fa-linkedin'></i></a>"
#         when 'mastodon_username'
#           "<a rel='me' href='https://#{social[1]}' title='Mastodon'><i class='fa-brands fa-mastodon'></i></a>"
#         when 'medium_username'
#           "<a href='https://medium.com/@#{social[1]}' title='Medium'><i class='fa-brands fa-medium'></i></a>"
#         when 'orcid_id'
#           "<a href='https://orcid.org/#{social[1]}' title='ORCID'><i class='ai ai-orcid'></i></a>"
#         when 'osf_id'
#           "<a href='https://osf.io/#{social[1]}/' title='Open Science Framework'><i class='ai ai-osf'></i></a>"
#         when 'pinterest_id'
#           "<a href='https://www.pinterest.com/#{social[1]}' title='Pinterest'><i class='fa-brands fa-pinterest'></i></a>"
#         when 'publons_id'
#           "<a href='https://publons.com/a/#{social[1]}/' title='Publons'><i class='ai ai-publons'></i></a>"
#         when 'quora_username'
#           "<a href='https://www.quora.com/profile/#{social[1]}' title='Quora'><i class='fa-brands fa-quora'></i></a>"
#         when 'research_gate_profile'
#           "<a href='https://www.researchgate.net/profile/#{social[1]}/' title='ResearchGate'><i class='ai ai-researchgate'></i></a>"
#         when 'rss_icon'
#           "<a href='#{context.registers[:site].baseurl}/feed.xml' title='RSS Feed'><i class='fa-solid fa-square-rss'></i></a>"
#         when 'scholar_userid'
#           "<a href='https://scholar.google.com/citations?user=#{social[1]}' title='Google Scholar'><i class='ai ai-google-scholar'></i></a>"
#         when 'scopus_id'
#           "<a href='https://www.scopus.com/authid/detail.uri?authorId=#{social[1]}' title='Scopus'><i class='ai ai-scopus'></i></a>"
#         when 'semanticscholar_id'
#           "<a href='https://www.semanticscholar.org/author/#{social[1]}' title='Semantic Scholar'><i class='ai ai-semantic-scholar'></i></a>"
#         when 'spotify_id'
#           "<a href='https://open.spotify.com/user/#{social[1]}' title='Spotify'><i class='fa-brands fa-spotify'></i></a>"
#         when 'stackoverflow_id'
#           "<a href='https://stackoverflow.com/users/#{social[1]}' title='Stackoverflow'><i class='fa-brands fa-stack-overflow'></i></a>"
#         when 'strava_userid'
#           "<a href='https://www.strava.com/athletes/#{social[1]}' title='Strava'><i class='fa-brands fa-strava'></i></a>"
#         when 'telegram_username'
#           "<a href='https://telegram.me/#{social[1]}' title='telegram'><i class='fa-brands fa-telegram'></i></a>"
#         when 'unsplash_id'
#           "<a href='https://unsplash.com/@#{social[1]}' title='Unsplash'><i class='fa-brands fa-unsplash'></i></a>"
#         # when 'wechat_qr'
#         #   "<a id='WeChatBtn' title='WeChat'><i class='fa-brands fa-weixin'></i></a>
#         #    <div id='WeChatMod' class='wechat-modal'>
#         #      <img src='#{social[1]}' alt='WeChat QR' id='WeChatQR'>
#         #    </div>
#         #    <script defer src='/assets/js/wechat.js' type='text/javascript'></script>"
#         when 'whatsapp_number'
#           "<a href='https://wa.me/#{social[1]}' title='whatsapp'><i class='fa-brands fa-whatsapp'></i></a>"
#         when 'wikidata_id'
#           "<a href='https://www.wikidata.org/wiki/#{social[1]}' title='Wikidata'><i class='fa-solid fa-barcode'></i></a>"
#         when 'wikipedia_id'
#           "<a href='https://wikipedia.org/wiki/User:#{social[1]}' title='Wikipedia'><i class='fa-brands fa-wikipedia-w'></i></a>"
#         when 'work_url'
#           "<a href='#{social[1]}' title='Work'><i class='fa-solid fa-briefcase'></i></a>"
#         when 'x_username'
#           "<a href='https://twitter.com/#{social[1]}' title='X'><i class='fa-brands fa-x-twitter'></i></a>"
#         when 'youtube_id'
#           "<a href='https://youtube.com/@#{social[1]}' title='YouTube'><i class='fa-brands fa-youtube'></i></a>"
#         when 'zotero_username'
#           "<a href='https://www.zotero.org/#{social[1]}' title='Zotero'><i class='ai ai-zotero'></i></a>"
#         else
#           file_ext = social[1]['logo'].split('.').last
#           if file_ext == 'svg'
#             if social[1]['logo'].include?('://')
#               img_code = "<svg><image xlink:href='#{social[1]['logo']}' /></svg>"
#             else
#               img_code = "<svg><image xlink:href='#{social[1]['logo'] | relative_url}' /></svg>"
#             end
#           else
#             if social[1]['logo'].include?('://')
#               img_code = "<img src='#{social[1]['logo']}' alt='#{social[1]['title']}'>"
#             else
#               img_code = "<img src='#{social[1]['logo'] | relative_url}' alt='#{social[1]['title']}'>"
#             end
#           end
#           "<a href='#{social[1]['url']}' title='#{social[1]['title']}'>#{img_code}</a>"
#         end
#       end.join(" ")
#     end
#   end
# end

# Liquid::Template.register_tag('social_links', Jekyll::SocialLinksTag)
