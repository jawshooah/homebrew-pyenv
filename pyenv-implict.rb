class PyenvImplict < Formula
  homepage "https://github.com/concordusapps/pyenv-implict"
  head "https://github.com/concordusapps/pyenv-implict.git"

  depends_on "pyenv"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert shell_output("pyenv hooks which").include?("whence.bash")
  end
end
