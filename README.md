# Social Stack
Blazingly fast open source social links index page

* ⚡ Builds into a static html page
* 🚫 Very few dependecies for building relies heavily on core GNU/Linux utils
* ☁️  Can be built, dockerized, and deployed to github pages with CI/CD Actions,\
just fork the repo and modify the configs
* ⚙️ Easily configurable, single yaml file holds all build options

## Index
* [Configuring](configuring)
* [Building](building)
    * [GitHub Actions](github-actions)
    * [Docker](docker)
    * [Build HTML in a Linux shell](build-html-in-a-linux-shell)

## Configuring
Tweak `build-options.yml` to customize your page, this example configuration is\
available [here](https://atomicul.github.io/social-stack)

Assets must be stored in `src/assets` and they should be referenced either with\
an absolute path, i.e. `/<ASSET>`, or with a relative path, i.e. `./<ASSET>`, both\
of which refer to the file `src/assets/<ASSET>`

The `meta-description` property is the one you would set with a `<meta>` tag in\
the head section of the html document. For better context of the properties, check\
out these files: `src/*.html.template`.

You should feel free to modify the templates, but be aware that some properties\
are expected to be part of an atribute string (such as `profile-picture`), others\
are ment to be text inside of an html element (such as `owner-name`), and some\
replacements are ment to be substituted as-is (`links` is replaced that way).\
Because of this reason not all properties are sanitized the same way. For a better\
understanding of how the build system works, check out `bin/compile-html`.

## Building
### GitHub Actions
You can have GitHub build the project for you, publish docker images, and/or\
deploy the project to GitHub Pages.

Instructions below:
1. Fork the repository
2. Enable GitHub Actions
3. Enable deployment to GitHub pages from Actions (if needed)
4. Make [configuring](configuring) changes as needed
5. Push the changes to main

This will trigger the workflows in `.github/workflows` and GitHub will release\
and deploy the project for you.

### Docker
Instructions below:
1. Make [configuring](configuring) changes as needed
2. Build docker container: `docker build -t <TAG> .`
3. Run the container: `docker run -it -p '<PORT>:80' <TAG>`

### Build HTML in a Linux shell
Instructions below:
1. Make [configuring](configuring) changes as needed
2. Install JavaScript build dependencies: `yarn` (requires NodeJS and Yarn)
3. Install [yq](https://github.com/mikefarah/yq) yaml parser
4. Run the build script: `bin/compile-html`

This creates a new directory, `build`, containing the html, css and asset files.
