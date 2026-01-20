# jekyll-socials

[![Gem Version](https://badge.fury.io/rb/jekyll-socials.svg)](http://badge.fury.io/rb/jekyll-socials)

A plugin to help add social media info to your site. For more information, check the [documentation](https://george-gca.github.io/jekyll-socials/).

## Supported Web Fonts

This plugin supports three web font libraries for rendering social media icons:

1. **[FontAwesome](https://fontawesome.com/)** - A comprehensive icon library with support for brands and general symbols
2. **[Academicons](https://jpswalsh.github.io/academicons/)** - Specialized icons for academic platforms and publications
3. **[Scholar Icons](https://louisfacun.github.io/scholar-icons/)** - Additional icons for technical and coding platforms

## Built-in Social Platforms

The plugin includes built-in support for 53 social media and academic platforms:

### Academic & Research Platforms

academia_edu, acm_id, arxiv_id, dblp_url, hal_id, ieee_id, inspirehep_id, lattes_id, orcid_id, osf_id, publons_id, research_gate_profile, scholar_userid, scopus_id, semanticscholar_id

### Social Media Platforms

blogger_url, bluesky_url, discord_id, facebook_id, flickr_id, instagram_id, mastodon_username, medium_username, pinterest_id, quora_username, reddit_username, spotify_id, telegram_username, tiktok_username, tumblr_username, twitch_username, x_username, youtube_id

### Professional & Networking

github_username, gitlab_username, keybase_username, kaggle_id, lastfm_id, letterboxd_id, linkedin_username, stackoverflow_id, strava_userid, unsplash_id, wikidata_id, wikipedia_id, zotero_username

### Contact & Other

cv_pdf, email, rss_icon, wechat_username, whatsapp_number, work_url

Additionally, the plugin supports **custom socials** with user-provided logos (images or icon classes) and URLs.

## Building and Releasing a New Version

To build and release a new gem version:

1. **Build the gem** - This creates a `.gem` file from the current gemspec:

   ```bash
   gem build jekyll-socials.gemspec
   ```

2. **Push to RubyGems** - This publishes the gem to [RubyGems.org](https://rubygems.org/), making it available for installation:
   ```bash
   gem push jekyll-socials-X.X.X.gem
   ```
   Replace `X.X.X` with the actual version number (e.g., `jekyll-socials-0.0.6.gem`).

The version number should be updated in [lib/jekyll-socials/version.rb](lib/jekyll-socials/version.rb) before building.
