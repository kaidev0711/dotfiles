export def cat [file: string] = {
    bat -p --paging=never ($file | path expand)
}

export def dir [path?: string] {
    if ($path == null) {
        ls -a
    } else {
        ls -a $path
    } | sort-by -i type name | grid -c
}

export def brupr [] {
    brew update
    brew upgrade 
    brew upgrade --cask
    brew cleanup
    brew doctor
}

export def --env mkcd [dirname: path] {
    mkdir $dirname
    cd $dirname
}

export def dmy [] { (date now | format date %d-%m-%Y) }
export def ymd [] { (date now | format date %Y-%m-%d) }

export def asff [] {
    aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (nu-open $tmp)
	# let cwd = (open $tmp)
  # let cwd = (cat $tmp | str trim)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}


export def --env brd [] {
  let dir = ^broot --only-folders --conf ~/.config/broot/selectdir.toml
  cd $dir
}

export alias d = brd

export def bro [] { ^broot --conf ~/.config/broot/select.toml }

export def brat [] { bat ( ^broot --conf ~/.config/broot/select.toml) }

export def tree [path: path = .] { ^broot -c :pt $path }

export def notes [] {
  cd ~/Notes
  br .
}
