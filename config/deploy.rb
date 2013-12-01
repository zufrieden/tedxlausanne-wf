set :application, "tedxlausanne.zufrieden.io"
set :repository,  "git@github.com:zufrieden/tedxlausanne-wf.git"
set :scm,         :git

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to,   "/home/mfh/www/tedxlausanne.zufrieden.io/"
set :user,        "mfh"
set :domain,      "antistatique"
set :use_sudo,    false

role :app, 'tedxlausanne.zufrieden.io'
role :web, 'tedxlausanne.zufrieden.io'


set :ssh_options, { :forward_agent => true }

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :myproject do

    task :vendors do
        run "curl -s http://getcomposer.org/installer | php -- --install-dir=#{release_path}"
        run "cd #{release_path} && #{release_path}/composer.phar install"
    end

    # task :move_fonts do
    #     run "cp -r #{current_path}/vendor/fortawesome/font-awesome/font #{current_path}/web/assets/font"
    # end

    # task :shared_symlinks do
    #     run "ln -s #{shared_path}/resources/config/prod.php #{current_path}/resources/config/prod.php"
    # end
end



set  :keep_releases,  3

after "deploy:update_code", "myproject:vendors"
# after "deploy:create_symlink", "myproject:move_fonts"

# Be more verbose by uncommenting the following line
# logger.level = Logger::MAX_LEVEL