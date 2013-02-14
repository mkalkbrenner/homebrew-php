require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54Uuid < AbstractPhp54Extension
  init
  homepage 'http://pecl.php.net/package/uuid'
  url 'http://pecl.php.net/get/uuid-1.0.3.tgz'
  sha1 'f51820a310ade0eb7200375486bf88d721d89f17'
  head 'https://svn.php.net/repository/pecl/uuid/trunk', :using => :svn

  def patches
    # fixes build errors on OSX 10.6 and 10.7
    # https://bugs.php.net/bug.php?id=62009
    # https://bugs.php.net/bug.php?id=58311
    p = []

    if build.head?
      p << "https://raw.github.com/gist/2902360/eb354918f0afff2b4fcd7869d5a49719a2b32312/uuid-trunk.patch"
    else
      p << "https://raw.github.com/gist/2891193/c538ae506aafd1d61f166fa3c1409dca61d100c6/uuid.patch"
    end

    return p
  end

  def install
    Dir.chdir "uuid-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/uuid.so"
    write_config_file unless build.include? "without-config-file"
  end
end
