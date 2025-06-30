# Nix Presentation

A minimal Nix flake repository hosting a static Reveal.js slide deck via GitHub Pages.

## Features

- Declarative `flake.nix` to build and serve the presentation
- Markdown slides with `reveal-md`
- GitHub Actions for deployment to Pages

## Usage

```bash
# Clone repo
git clone https://github.com/yourname/nix-presentation.git
cd nix-presentation

# Enter Nix shell and serve locally
nix develop
reveal-md slides.md --static _site
```

## Example
```bash
$ nix flake show

$ nix build .#hello

$ nix path-info .#hello

$ nix store ls <path>
```

Check out the presentation: https://matthiasemde.github.io/nix-presentation/
