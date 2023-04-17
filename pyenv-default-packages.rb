class PyenvDefaultPackages < Formula
  homepage "https://github.com/btrachey/pyenv-default-packages"
  head "https://github.com/btrachey/pyenv-default-packages.git"
  url "https://github.com/btrachey/pyenv-default-packages/archive/0.0.1.tar.gz"
  sha256 "cb3f5f5e3e4fd55e0623b21db623c64b57bb7dcd896497ee982c08e43bd3f40a"

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
