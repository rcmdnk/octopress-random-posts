require 'jekyll'

module Jekyll

  class RandomPosts < Generator
    safe :true
    priority :low

    def generate(site)
      # check if random local is required or not
      if !site.config['random_local']
        return
      end
      if site.config['random_posts']
        n_posts = site.config['random_posts']
      else
        n_posts = 5
      end

      site.posts.each { |post|
        post.data.merge!("random_posts" => site.posts.shuffle[0,n_posts])
      }
      site.pages.each { |page|
        page.data.merge!("random_posts" => site.posts.shuffle[0,n_posts])
      }
    end
  end
end
