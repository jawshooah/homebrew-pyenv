class PyenvDefaultPackages < Formula
  homepage "https://github.com/jawshooah/pyenv-default-packages"
  head "https://github.com/jawshooah/pyenv-default-packages.git"
  url "https://github.com/jawshooah/pyenv-default-packages/archive/0.3.0.tar.gz"
  sha256 "88219f2dfbf6362785aab6fcbaab4aa7e37e788a6fe3ea25a6db3802dcff1ad1"

  depends_on "pyenv"
  depends_on "pyenv-virtualenv" => :recommended

  def install
    ENV["PREFIX"] = prefix
    system "./install.sh"
  end

  test do
    assert shell_output("pyenv hooks install").include? "default-packages.bash"
    if build.with? "pyenv-virtualenv"
      assert shell_output("pyenv hooks virtualenv").include? "default-packages.bash"
    end
  end
end
