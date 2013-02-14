require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php53Memcache < AbstractPhp53Extension
  init
  homepage 'http://pecl.php.net/package/memcache'
  url 'http://pecl.php.net/get/memcache-2.2.7.tgz'
  sha1 '15235e0f85b54c429bdbf8f6b529243580e504a7'
  head 'https://svn.php.net/repository/pecl/memcache/trunk/', :using => :svn

  devel do
    url 'http://pecl.php.net/get/memcache-3.0.7.tgz'
    sha1 'bd5df709eb9c6dabdcd8886b76eca18cbfa6fa3f'
  end

  def install
    Dir.chdir "memcache-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/memcache.so"
    write_config_file unless build.include? "without-config-file"
  end
end
