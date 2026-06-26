#!/bin/bash
set -e

export GEM_HOME="${GEM_HOME:-$(ruby -e 'print Gem.user_dir')}"
export PATH="$GEM_HOME/bin:$PATH"

if ! command -v bundle >/dev/null 2>&1; then
  echo "Installing Bundler..."
  gem install bundler --no-document
fi

echo "Installing dependencies from Gemfile..."
bundle config set path 'vendor/bundle'
bundle install

echo "Running Jekyll build..."
bundle exec jekyll build --strict-front-matter

echo "Build completed successfully!"
ls -la _site/
