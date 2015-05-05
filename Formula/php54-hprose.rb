require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php54Hprose < AbstractPhp54Extension
  init
  homepage "http://pecl.php.net/package/hprose"
  url "http://pecl.php.net/get/hprose-1.4.2.tgz"
  sha256 "fcae60918059fc04a840eecd21e56ba0fb59ec0a02c8c0796ee047bf7938b27c"
  head "https://github.com/hprose/hprose-pecl.git"

  def install
    Dir.chdir "hprose-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/hprose.so"
    write_config_file if build.with? "config-file"
  end

  test do
    shell_output("php -m").include?("hprose")
  end
end
