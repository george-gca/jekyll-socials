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
      'wechat_username' => "<i class='fa-brands fa-weixin'></i>",
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
      'wechat_username' => "weixin://dl/chat?%s",
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
