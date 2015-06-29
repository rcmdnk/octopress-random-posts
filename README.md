# octopress-random-posts

A sidebar tool of random posts list for Octopress (Jekyll).

There are three different modes:

* Local build mode.
    * Make the list at `jekyll build`.
* Active list with HTML.
    * Fetch an entry lists from out HTML file, and shuffle the list by JavaScript.
* Active list with a inline list.
    * Embed an entry list in a page, and shuffle the list by JavaScript.

## Requirement

* [rcmdnk/jekyll-var-to-js](https://github.com/rcmdnk/jekyll-var-to-js): Not mandatory. It is needed to set a number of posts and a post list URL in **_config.yml**.

## Installation

For all modes:

* Copy **source/_includes/custom/asides/random_posts.html** to **source/_includes/custom/asides/**.
* Copy **source/_includes/post/post_list.html** to **source/_includes/post/post_list.html**.
* Copy **sass/plugins/_random-posts.scss** to **sass/plugins/**.

And for each mode:

* Local build mode.
    * Copy **plugins/random_posts.rb** to **plugins/**.
* Active list with out HTML.
    * Copy **source/javascripts/random-posts-html.js** to **source/javascripts/**.
    * Copy **source/posts_light.html** to **source/**.
* Active list with a inline list.
    * Copy **source/javascripts/random-posts.js** to **source/javascripts/**.


Then, put following lines in `<head>` in your **source/_includes/custom/head.html**:

```html
{% unless site.random_url %}
<script src="{{root_url}}/javascripts/random-posts.js" defer></script>
{% else %}
<script src="{{root_url}}/javascripts/random-posts-html.js" defer></script>
{% endunless %}
```

And set your configuration in **_config.yml**:

```yaml
# Asides
default_asides:
  - ...
  - ...
  - custom/asides/random_posts.html
  - ...
  - ...

# Random posts
random_posts: 5
random_local: false
#random_url: '/posts_light.html'

# jekyll-var
jekyll_var:
  include:
    - random_posts
    - random_local
    - random_url
```

Set **custom/asides/random_posts.html** in asides list as you like.

And set configuration variables:

* `random_posts`: A number of posts to be listed.
* `random_local`: Set if the local build mode is used or not. If false, another mode is used.
* `random_url`: If `random_url` is set and `random_local` is false, the active list with HTML is used. If `randome_url` is not set and `random_local` is false, the active list with a inline list is used.

## Pros and Cons of each mode

* Local build mode.
    * Pros:
        * No additional load (HTTP connection or JavaScript) when the page is opened.
    * Cons:
        * The list is fixed for each page until new build is sent.
* Active list with HTML.
    * Pros:
        * The list is renewed every time.
        * The smallest load at jekyll build.
    * Cons:
        * Additional http connection is required when the page is opened.
* Active list with a inline list.
    * Pros:
        * The list is renewed every time.
        * No additional http connection.
    * Cons:
        * Jekyll build takes a bit time if you have a lot of posts.

