## site-template

### What is it?
1. `site-template` is a template static web site, customized for my teaching needs
1. It uses [Jekyll](https://jekyllrb.com/), a customized [Minima](https://github.com/jekyll/minima) theme, and [Github Pages](https://pages.github.com/) to host the site.
1. My goals are:
    1. One click for students to get all of today's course materials (notes, slides, code, video)
    1. No scrolling: most recent material at the top.
    1. Easy for me to update the web site with daily content on the front page.
    1. Attractive styling, with syntax highlighting and family resemblance to [USF](https://www.usfca.edu)'s web pages. [Berkeley CS 61a](https://github.com/Shopify/liquid/wiki) is an inspiration I may never equal.
    1. Reusable template for other courses, or instructors, if they want.

### Work Flow
1. Fork `site-template` into a new repo in your Github Classroom Organization ("yourorg") or your individual Github account. The repo must be called `yourorg.github.io`
1. Customize the boilerplate material:
    1. Edit the Jekyll `_config.yml` file with your course name and number.
    1. Add daily posts to the `timeline/` directory so they can be templated into the default page.
    1. Add your instructors to the `instructors/` directory so they can be templated into the Getting Help page.
    1. Other Markdown or HTML files (e.g. assignment specs) can be added in other directories. If you add a file at the top level, the Minima theme puts them in the top bar. My design thought is to link to assignment specs from the timeline page (one-click for students)
    1. Optionally, edit the `.scss` files for styling preferences.
1. Optionally, review the site on your localhost (`http://127.0.0.1:4000`) by installing `ruby` and `bundler` as the Jekyll docs [describe](https://jekyllrb.com/docs/)
1. Once satisfied with your changes, `git commit` and `git push` your changes to your remote repo. The build products directory (`_site/`) is in the `.gitignore` so build products will not be pushed.
1. In a few minutes, Github Pages will notice your commits, run the Jekyll build, and publish its `_site` to `https://yourorg.github.io`.
1. Pro tip: when you get confident making changes, you can add and edit files directly on `github.com` without doing a local preview or commit/push steps.

### Lessons Learned
1. There seem to be a lot of ways to accomplish similar goals, and I'm not an expert at the Ruby ecosystem, which made Jekyll daunting.
1. Jekyll is a flexible (but not simple) tool for developing blog sites in HTML, Markdown, [Liquid](https://github.com/Shopify/liquid/wiki) templates, and SCSS. One could publish Jekyll's build products (the `_site` directory) anywhere. 
1. USF makes personal home pages available, and I considered using that.
1. I considered building a simpler site-generation tool myself, but by the time I got into it, it was apparent that I was building half of Jekyll.
1. Github pages has a [special Jekyll plug-in](https://github.com/github/pages-gem) which runs the Jekyll build process on Github's servers, and makes the results available on `https://yourorg.github.io`. I'm using that for now, accepting the following restrictions.
1. Github makes it sound like they [recommend](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll) and use Jekyll for Github Pages. However, there are [significant restrictions](https://pages.github.com/versions/) on the versions of Jekyll themes, plugins, and Jekyll itself. 
1. If I ever needed to run the latest version of Jekyll, or more plugins or themes than Github Pages supports, I would not be able to use the `github-pages` plugin. Instead, I would need to use Github Actions as described in this very helpful [tutorial](https://www.moncefbelyamani.com/making-github-pages-work-with-latest-jekyll/).
1. Some references say your repo needs to have a special branch called `gh-pages` but my experience is that Github builds and publishes changes on the `main` branch.
1. One might expect that it would be easy to switch Jekyll themes. Unfortunately it's not, because themes contain both structure and style. Maybe someday I can refactor to make it easy to switch themes.
