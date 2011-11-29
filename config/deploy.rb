set :application, "ovenrake.com"
set :repository,  "freedrull@freedrool.us:/opt/git/ovenrake.com.git"

#set :scm, :git
#set :deploy_to, "/var/www/freedrool.us/"
set :user, "freedrull"
set :deploy_via, :remote_cache
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "nginx"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

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

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :update do
    system("rsync -rv build/* freedrull@freedrool.us:/var/www/ovenrake.com/")
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
   #run "#{try_sudo} /etc/rc.d/nginx restart"
  end
end