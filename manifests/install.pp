# == Class: puppet-openresty::install

class puppet-openresty::install inherits puppet-openresty {
    
    $depndencies = [ 'libreadline-dev', 'libncurses5-dev', 'libpcre3-dev', 'libssl-dev', 'perl', 'make', 'build-essential' ]
    package { $depndencies: ensure => present }
 
    exec { "getsource":
            command => "/usr/bin/wget https://openresty.org/download/openresty-1.11.2.2.tar.gz",
            cwd => "/home/foodie"
        }

    exec { "untarsource":
            command => "/bin/tar -xvzf openresty-1.11.2.2.tar.gz",
            cwd => "/home/foodie",
            require => Exec["getsource"]
        }

    exec { "configure":
	    command => "/home/foodie/openresty-1.11.2.2/configure  --with-http_ssl_module --with-luajit  --with-pcre --with-pcre-jit ",
	    cwd => "/home/foodie/openresty-1.11.2.2/",
	    require => Exec["untarsource"]
        }
    
    exec { "make":
	    command => "/usr/bin/make",
	    cwd => "/home/foodie/openresty-1.11.2.2/",
	    require => Exec["configure"]
        }
     
    exec { "makeinstall":
	    command => "/usr/bin/make install",
	    cwd => "/home/foodie/openresty-1.11.2.2/",
            require => Exec["make"]	   
	}

}
