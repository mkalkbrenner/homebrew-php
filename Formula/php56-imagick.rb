require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Imagick < AbstractPhp56Extension
  init
  desc "Provides a wrapper to the ImageMagick library."
  homepage "https://pecl.php.net/package/imagick"
  url "https://pecl.php.net/get/imagick-3.3.0.tgz"
  sha256 "bd69ebadcedda1d87592325b893fa78a5710a0ca7307f8e18c5e593949b1db2d"
  head "https://github.com/mkoppanen/imagick.git"
  revision 2

  bottle do
    sha256 "fac9d4f4f4b2f86664b72f33dac9e33e25e3332a7512c41a3f2d1698808b9074" => :el_capitan
    sha256 "0acf2fb4aab5bd0dc80f6319ccc563d258555dd49171a746f871804bc31d27ce" => :yosemite
    sha256 "e9287d2da19ffb2744178c104dc7e598ddecca11bf614fad97744f7d32dd74d4" => :mavericks
  end

  depends_on "pkg-config" => :build
  depends_on "imagemagick"

  def install
    Dir.chdir "imagick-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--with-imagick=#{Formula["imagemagick"].opt_prefix}"
    system "make"
    prefix.install "modules/imagick.so"
    write_config_file if build.with? "config-file"
  end
end
