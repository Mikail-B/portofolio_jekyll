#!/bin/bash
set -e

echo "Installing Ruby dependencies..."
gem install bundler jekyll jekyll-feed jekyll-sitemap

echo "Running Jekyll build..."
jekyll build --strict-front-matter

echo "Build completed successfully!"
ls -la _site/
