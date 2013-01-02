###
# Compass
###

# Normalize CSS
# gem install compass-normalize-plugin
require 'normalize'

# Susy grids in Compass
# First: gem install susy --pre
require 'susy'

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def social_link_to(site)
    sites = {
    "Facebook" => "http://facebook.com/domkm",
    "GitHub" => "http://github.com/domkm",
    "Google+" => "http://plus.google.com/u/0/113061429105470827929",
    "LinkedIn" => "http://linkedin.com/in/domkm",
    "Tumblr" => "http://domkm.tumblr.com",
    "Twitter" => "http://twitter.com/domkm"
  }
  link_to site, sites[site], id: site.downcase.gsub('+', 'plus'), target: "_blank"
  end
end

require 'middleman-livereload'
activate :livereload

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown, autolink: true,
               fenced_code_blocks: true,
               lax_spacing: true,
               smartypants: true,
               space_after_headers: true,
               strikethrough: true,
               superscript: true

activate :syntax
# Build-specific configuration
configure :build do


  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Minify HTML
  activate :minify_html

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"

  # Activate Favicon Maker (turns 'favicon_base.png' into multiple favicon sizes, favicon_base.png should be 114x114 pixels)
  activate :favicon_maker
end

# Middleman Deploy
# gem install middleman-deploy
require 'middleman-deploy'
activate :deploy do |deploy|
  deploy.clean = true
  deploy.method = :git
  deploy.branch = 'master'
end

