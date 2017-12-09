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

set :slim,
    :format => :html,
    :sort_attrs => false,
    :pretty => true,
    :shortcut => {
      "#" => {:tag => "div", :attr => "id"},
      "." => {:tag => "div", :attr => "class"},
      "&" => {:tag => "input", :attr => "type"}
    }

activate :blog do |blog|
  # ブログ機能のオプションを設定
  # blog.prefix = "blog"
  # blog.permalink = "{category}/{title}.html"
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layouts/layout"

  # blog.summary_separator = /()/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"
  # blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"
end

helpers do
  def hostUrl link
    link
  end
end

## GitHub Flavored Markdown
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true
set :markdown_engine, :redcarpet


# With alternative layout
# page '/path/to/file.html', layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy '/this-page-has-no-template.html', '/template-file.html', locals: {
#  which_fake_page: 'Rendering a fake page with a local variable' }

###
# Helpers
###

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

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

# Use “pretty” URLs (without the `.html` suffix)
activate :directory_indexes

# Append hashes to compiled assets
activate :asset_hash

Time.zone = "Tokyo"
