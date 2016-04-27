require File.expand_path("../../Abstract/abstract-php-phar", __FILE__)

class Phpunit < AbstractPhpPhar
  init
  desc "Programmer-oriented testing framework for PHP"
  homepage "http://phpunit.de"
  url "https://phar.phpunit.de/phpunit-5.3.2.phar"
  sha256 "3af5c42ef7aae5ff8f26ae72390b3e758ac2076feedba7fd5a4c2f1efd4f004e"

  bottle do
    cellar :any_skip_relocation
    sha256 "57758765674e54c8e26f4e9cefed0be27354c92d398b795e0bef0ff8ce0af07f" => :el_capitan
    sha256 "9edeece817c648f2e36b6380923223c9f93867aef73bc0026a25ef06c7c2ff7a" => :yosemite
    sha256 "054fcc4e88c9093b10eaafd817a96d1c618d5516f8ba5b6c4ffdf7ecf13b8e89" => :mavericks
  end

  def phar_file
    "phpunit-#{version}.phar"
  end

  test do
    shell_output("phpunit --version").include?(version)
  end
end
