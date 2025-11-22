class Bones < Formula
  desc "Makefile-based pipeline for generating books in multiple formats with AI assistance"
  homepage "https://github.com/tsmarsh/bones"
  url "https://github.com/tsmarsh/bones/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1c0d7ecccec209f075bdce58784bd9d2748398ecf08f87140735d4cd50b3fa7a"
  license "MIT"
  head "https://github.com/tsmarsh/bones.git", branch: "main"

  depends_on "python@3"
  depends_on "pandoc"

  # Recommended for PDF generation
  depends_on "tectonic" => :recommended

  def install
    # Install using the Makefile with Homebrew's prefix
    system "make", "install", "PREFIX=#{prefix}"

    # Install shell completions
    if File.exist?("completions/_bones")
      zsh_completion.install "completions/_bones"
    end
  end

  def caveats
    <<~EOS
      Bones has been installed!

      For PDF generation, tectonic is recommended (and installed by default).
      Alternatively, you can use system LaTeX (xelatex/lualatex).

      To get started:
        mkdir my-book && cd my-book
        bones init
        bones pdf

      For AI-assisted editing, set environment variables:
        export ANTHROPIC_API_KEY=your_key_here
        # or
        export OPENAI_API_KEY=your_key_here

      See 'bones help' for all available commands.
    EOS
  end

  test do
    # Test that bones command exists and shows help
    assert_match "Bones - Makefile-based Book Pipeline", shell_output("#{bin}/bones help")

    # Test initialization in a temporary directory
    system "#{bin}/bones", "init"
    assert_predicate testpath/"chapters", :exist?
    assert_predicate testpath/"chapters/01-chapter-one.md", :exist?

    # Test PDF build (pandoc is now a required dependency)
    system "#{bin}/bones", "pdf"
    assert_predicate testpath/"book.pdf", :exist?
  end
end
