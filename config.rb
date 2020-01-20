# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :sprockets
activate :directory_indexes
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

sprockets.append_path File.join(root, 'node_modules')

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :font_dir, 'assets/fonts'
set :images_dir, 'assets/images'

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '404.html', :layout => false, :directory_index => false
page 'maintenance.html', :layout => false, :directory_index => false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  config[:site_name] = ""
end

configure :staging do
  config[:host] = ""
  config[:env] =  "staging"
end

configure :production do
  config[:host] = ""
  config[:env] =  "production"
  config[:google_analytics_id] = ""
  config[:facebook_pixel_id] = ""
  config[:twitter_site] = ""
end