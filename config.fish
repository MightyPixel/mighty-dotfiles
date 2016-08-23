# Path to your oh-my-fish.
set -g OMF_PATH $HOME/.local/share/omf

# Path to your oh-my-fish configuration.
set -g OMF_CONFIG $HOME/.config/omf

### Configuration required to load oh-my-fish ###
# Note: Only add configurations that are required to be set before oh-my-fish is loaded.
# For common configurations, we advise you to add them to your $OMF_CONFIG/init.fish file or
# to create a custom plugin instead.

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -g VAULT_ADDR http://127.0.0.1:8200

set -g ANDROID_SDK /usr/local/Cellar/android-sdk-r10d/r10d/
set -g ANDROID_NDK /usr/local/Cellar/android-ndk-r10d/r10d/
# set -g ANDROID_SDK /usr/local/Cellar/android-sdk/r10d/
# set -g ANDROID_NDK /usr/local/Cellar/android-ndk/r10d/

function clean-vim
  echo "Cleaning ~/.vimbackup/"
  rm -Rf ~/.vimbackup/*
  echo "Cleaning ~/.vimswap/"
  rm -Rf ~/.vimswap/*
  echo "Cleaning ~/.vimviews/"
  rm -Rf ~/.vimviews/*
  echo "Cleaning ~/.vimundo/"
  rm -Rf ~/.vimundo/*
  echo "All done!"
end
