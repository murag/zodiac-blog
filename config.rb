require 'slim'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy '/this-page-has-no-template.html', '/template-file.html', locals: {
#  which_fake_page: 'Rendering a fake page with a local variable' }

###
# Helpers
###
# config.action_controller.asset_host = "http://assets.example.com/"

set :time_zone, 'Tokyo'

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"
  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"
  # blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

helpers do
  def hostUrl link
    link
  end
end

## GitHub Flavored Markdown
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true
set :markdown_engine, :redcarpet

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     'Helping'
#   end
# end

set :css_dir,      'source/stylesheets'
set :js_dir,       'source/javascripts'

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :asset_hash
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  ignore /stylesheets\/.*\.scss/
  ignore /javascripts\/.*\.js/
end

activate :relative_assets

activate :external_pipeline, {
    name: :parcel,
    command: build? ? "parcel build source/javascripts/all.js --out-dir build/assets/" : "parcel watch source/javascripts/all.js --out-dir build/assets/",
    source: "./build",
    latency: 1
}
