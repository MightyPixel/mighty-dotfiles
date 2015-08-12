# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish
set JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home/

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
# . $fish_path/oh-my-fish.fish

# setenv JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home
# set JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home/

# Aliases
alias work_on_blog="source ~/.envs/blog/bin/activate.fish;cd ~/Repositories/MightyBlog/mightyblog;python manage.py runserver & sleep 1s; open 'http://localhost:8000'"
alias work_on_checkin="source ~/.envs/checkin/bin/activate.fish;cd ~/Repositories/checkinatfmi_project/checkin-at-fmi/checkinatfmi_project/;python manage.py runserver --settings=checkinatfmi.settings.local"
alias work_on_tree="source ~/.envs/treefeed/bin/activate.fish;cd ~/Projects/TreeFeed"
alias work_on_stxy="sh ~/Applications/tc7/bin/shutdown.sh; rm -r ~/Applications/tc7/webapps/*; rm -r ~/Applications/tc7/work/*; cd ~/Repositories/Obecto/pooltalent/applications/api/; mvn clean install -DskipTests=true; cd ~/Repositories/Obecto/pooltalent/applications/server/; mvn clean package -DskipTests=true; cp ~/Repositories/Obecto/pooltalent/applications/server/target/local_pooltalentweb.war ~/Applications/tc7/webapps/; sh ~/Applications/tc7/bin/startup.sh"
