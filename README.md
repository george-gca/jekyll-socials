# jekyll-socials

[![Gem Version](https://badge.fury.io/rb/jekyll-socials.svg)](http://badge.fury.io/rb/jekyll-socials)

A plugin to help add social media info to your site. For more information, check the [documentation](https://george-gca.github.io/jekyll-socials/).

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
