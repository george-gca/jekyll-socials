---
layout: base
permalink: /
---

# jekyll-socials

This is a Jekyll plugin that adds social links to your site. It fetches social information stored in a `_data/socials.yml` file in your code. Under the hood, it relies on some awesome font icons to display the social icons:

- [Academicons](https://jpswalsh.github.io/academicons/)
- [Font Awesome](https://fontawesome.com/)
- [Scholar Icons](https://github.com/louisfacun/scholar-icons)

## Installation

1. Add `gem 'jekyll-socials'` to your site's Gemfile
2. Add the following to your site's `_config.yml`:

```yml
plugins:
  - jekyll-socials
```

## Usage

To replicate the social information displayed in the bottom of this site, create the file `_data/socials.yml` with the following content:

```yml
# this file contains the social media links and usernames
# the commented lines are the default social media links supported by the plugin
# the socials will be displayed in the order they are defined here
# some lines were left uncommented so you can see an example in this site

# acm_id: # your dl.acm.org/profile/id
# blogger_url: # your blogger URL
# bluesky_url: # your bluesky URL
# dblp_url: # your DBLP profile url
# discord_id: # your discord id (18-digit unique numerical identifier)
email: you@example.com # your email address
# facebook_id: # your facebook id
# flickr_id: # your flickr id
# github_username: # your GitHub user name
# gitlab_username: # your GitLab user name
# ieee_id: # your ieeexplore.ieee.org/author/id
inspirehep_id: 1010907 # Inspire HEP author ID
# instagram_id: # your instagram id
# kaggle_id: # your kaggle id
# keybase_username: # your keybase user name
# lastfm_id: # your lastfm id
# lattes_id: # your ID on Lattes (Brazilian Lattes CV)
# leetcode_id: # your LeetCode id
# linkedin_username: # your LinkedIn user name
# mastodon_username: # your mastodon instance+username in the format instance.tld/@username
# medium_username: # your Medium username
# orcid_id: # your ORCID ID
# osf_id: # your OSF ID
# pinterest_id: # your pinterest id
# publons_id: # your ID on Publons
# quora_username: # your Quora username
# research_gate_profile: # your profile on ResearchGate
rss_icon: true # set to true to show the RSS icon
scholar_userid: qc6CJjYAAAAJ # your Google Scholar ID
# scopus_id: # your profile on Scopus
# semanticscholar_id: # your Semantic Scholar ID
# spotify_id: # your spotify id
# stackoverflow_id: # your stackoverflow id
# telegram_username: # your Telegram user name
# unsplash_id: # your unsplash id
# wechat_qr: # filename of your wechat qr-code saved as an image (e.g., wechat-qr.png if saved to assets/img/wechat-qr.png)
# whatsapp_number: # your WhatsApp number (full phone number in international format. Omit any zeroes, brackets, or dashes when adding the phone number in international format.)
# wikidata_id: # your wikidata id
# wikipedia_id: # your wikipedia id (Case sensitive)
# work_url: # work page URL
# x_username: # your X handle
# youtube_id: # your youtube channel id (youtube.com/@<youtube_id>)
# zotero_username: # your zotero username
custom_social: # can be any name here other than the ones already defined above
  logo: https://www.alberteinstein.com/wp-content/uploads/2024/03/cropped-favicon-192x192.png # can be png, svg, jpg
  title: Custom Social
  url: https://www.alberteinstein.com/
```

Next, add the following to your layout file:

{% raw %}
```html
<div class="social">
  <div class="contact-icons">{% social_links %}</div>
</div>
```
{% endraw %}

Now, let's stylize the social icons. To do this, add this to your CSS file:

```css
.social {
  text-align: center;

  .contact-icons {
    font-size: 4rem;

    a {
      img {
        width: 3.2rem;
        height: 3.2rem;
      }

      svg {
        width: 3.5rem;
        height: 4rem;
        margin-bottom: 0.5rem;

        image {
          width: 3.5rem;
          height: 3.5rem;
        }
      }

      i::before {
        color: #ddd;
        transition-property: all 0.2s ease-in-out;
      }

      &:hover {
        text-decoration: none;

        i::before {
          color: green;
        }
      }
    }
  }
}
```

Also, don't forget to add the fonts to your site. The easiest way to do this is by adding the fonts CDNs to your layout's `<head>`. Here is an example, considering these CDNs:

- [Academicons](https://www.jsdelivr.com/package/npm/academicons?tab=files&path=css)
- [Font Awesome](https://www.jsdelivr.com/package/npm/@fortawesome/fontawesome-free?tab=files&path=css)
- [Scholar Icons](https://www.jsdelivr.com/package/npm/scholar-icons?tab=files&path=css)

```html
<head>
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/academicons@1.9.2/css/academicons.min.css"
    integrity="sha256-CylD++oS3IkJmSs/j4i1w0cv2wpVQRLLQqw/m+Fvxts="
    crossorigin="anonymous">
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.7.2/css/all.min.css"
    integrity="sha256-dABdfBfUoC8vJUBOwGVdm8L9qlMWaHTIfXt+7GnZCIo="
    crossorigin="anonymous">
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/scholar-icons@1.0.3/css/scholar-icons.css"
    integrity="sha256-VY3hHVj/hNX3fYG6wtbA6TcKJQl7+FthzGSyIB64klY="
    crossorigin="anonymous">
</head>
```

<div class="social">
  <div class="contact-icons">{% social_links %}</div>
</div>
