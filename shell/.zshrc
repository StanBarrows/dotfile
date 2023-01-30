# alias
alias pint='./vendor/bin/pint'
alias wip='git pull && ./vendor/bin/pint && git add . && git commit -m "wip" && git push -u'
alias mf='php artisan migrate:fresh'
alias mfs='php artisan migrate:fresh --seed'
alias test='php artisan test'

# Import ssh keys in keychain
ssh-add -A 2>/dev/null;

# Extra paths
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH=/usr/local/bin:$PATH
