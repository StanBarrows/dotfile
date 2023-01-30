
# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# ask password beforehand
sudo -v

# Symlink the Mackup config
ln -s $HOME/.dotfiles/macos/.mackup.cfg $HOME/.mackup.cfg

echo 'Install homebrew'
echo '----------------'
echo install homebrew
sudo rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/freek/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo 'Install php'
echo '-----------'
brew tap shivammathur/php
brew install shivammathur/php/php@8.2
brew link --overwrite --force php@8.2

echo 'Install composer'
echo '----------------'
EXPECTED_COMPOSER_CHECKSUM="$(curl https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_COMPOSER_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"
if [ "$EXPECTED_COMPOSER_CHECKSUM" != "$ACTUAL_COMPOSER_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi
php composer-setup.php
rm composer-setup.php
sudo mkdir /usr/local/bin/
sudo mv composer.phar /usr/local/bin/composer

echo 'Install imagemagick'
echo '-------------------'
brew install imagemagick

echo 'Install imagick'
echo '---------------'
pecl install imagick

echo 'Install xdebug'
echo '--------------'
pecl install xdebug

echo 'Install laravel valet'
echo '---------------------'
composer global require laravel/valet
valet install

echo 'Install mackup'
echo '--------------'
brew install mackup

bash macos/set-defaults.sh

echo "Setting up your Mac"
