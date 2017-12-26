namespace :assets do
  # task :js_deps_install do
  #   sh "yarn install"
  # end
  task :precompile do
    sh "middleman build"
  end
end
Rake::Task["assets:precompile"].enhance [:js_deps_install]
