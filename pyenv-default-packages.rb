class PyenvDefaultPackages < Formula
  homepage "https://github.com/jawshooah/pyenv-default-packages"
  head "https://github.com/jawshooah/pyenv-default-packages.git"
  url "https://github.com/jawshooah/pyenv-default-packages/archive/0.3.1.tar.gz"
  sha256 "815e191a6d8f52cea371c9cfb4a4d1d9277ad139d8e36f1e36d0758789d4b3d4"

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
