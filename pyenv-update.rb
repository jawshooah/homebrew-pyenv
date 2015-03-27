class PyenvUpdate < Formula
  homepage "https://github.com/yyuu/pyenv-update"
  head "https://github.com/yyuu/pyenv-update.git"

  depends_on "pyenv"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert shell_output("eval \"$(pyenv init -)\" && pyenv commands").include?("update")
  end
end
