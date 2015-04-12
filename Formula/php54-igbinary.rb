require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php54Igbinary < AbstractPhp54Extension
  init
  homepage "http://pecl.php.net/package/igbinary"
  url "http://pecl.php.net/get/igbinary-1.2.1.tgz"
  sha256 "168e51d41a417bbbfe6da0e3cb9b71ef93594f4034f489a951f3b874d03dfdb8"
  head "https://github.com/igbinary/igbinary.git"

  bottle do
    root_url "https://homebrew.bintray.com/bottles-php"
    sha256 "1383b771ceef84811289ed1b63888653521fcda285bd172142dae1871564dbbe" => :yosemite
    sha256 "790c8e18aef6d52a85ee85af6dd084ea156baf297f365907c2f7a34227ddf409" => :mavericks
    sha256 "b232a688d58d6c4d06d3a2ccf99272126c61ab4a512c0493a5df1ebca58d7721" => :mountain_lion
  end

  def install
    Dir.chdir "igbinary-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    include.install %w[apc_serializer.h hash.h igbinary.h php_igbinary.h]
    prefix.install "modules/igbinary.so"
    write_config_file if build.with? "config-file"
  end

  def config_file
    super + <<-EOS.undent
      ; Enable or disable compacting of duplicate strings
      ; The default is On.
      ;igbinary.compact_strings=On

      ; Use igbinary as session serializer
      ;session.serialize_handler=igbinary

      ; Use igbinary as APC serializer
      ;apc.serializer=igbinary
    EOS
  end

  test do
    shell_output("php -m").include?("igbinary")
  end
end
