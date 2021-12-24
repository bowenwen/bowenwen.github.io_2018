source "https://rubygems.org"

# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# To build the site without running server, use build and watch
#
#     bundle exec jekyll build --watch
#
# To update gems, run `bundle update`.
#
# Performing the same with docker-compose
# 
#     docker-compose build
#
# Update local Gemfile.lock with docker
# 
# - first, delete Gemfile.lock
# - then, build the image, if Gemfile.lock is missing, 
#         a new one will be generated
# - finally, copy the Gemfile.lock from image to local
#     id=$(docker create bowenwengithubio_web)
#     docker cp $id:/home/app/web/Gemfile.lock - > ./Gemfile.lock
#     docker rm -v $id
#

# option 1: for hosting on github-pages:
# gem "github-pages", group: :jekyll_plugins
# gem "jekyll-include-cache"

# option 2: for self-hosting
gem "jekyll"
gem "minimal-mistakes-jekyll"
# dependencies for theme-gem:
gem "jekyll-paginate"
gem "jekyll-sitemap"
gem "jekyll-gist"
gem "jekyll-feed"
gem "jemoji"
gem "jekyll-data"
gem "jekyll-include-cache"

# If you have any other plugins, put them here!
group :jekyll_plugins do
  # jekyll archives generate post archives: https://github.com/jekyll/jekyll-archives
  gem "jekyll-archives"
end

# Please add the following to your Gemfile to avoid polling for changes:
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
