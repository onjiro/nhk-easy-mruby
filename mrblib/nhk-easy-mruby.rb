module NHK
  module Easy
    BASE_URI = "http://www3.nhk.or.jp/news/easy/"
    BASE_MOVIE_URI = "rtmp://flv.nhk.or.jp/ondemand/flv/news/&movie="

    class Client
      def news_list
        #http = SimpleHttp.new(BASE_URI.scheme, BASE_URI.host)
        http = SimpleHttp.new("http", "www3.nhk.or.jp")
        data = http
          .get("/news/easy/news-list.json")
          .body.gsub("\xEF\xBB\xBF", '')

        json = JSON.parse(data)
        news_list = NewsList.new
        json.map do |list|
          list.keys.each do |date|
            list[date].each do |item|
              news_list.entries << News.new(date: date, item: item)
            end
          end
        end

        return news_list
      end
    end

    class NewsList
      attr_accessor :entries

      def initialize
        @entries = []
      end
    end

    class News
      attr_reader :date
      attr_accessor :news_id, :title, :news_publication_time,
        :has_news_web_image, :has_news_web_movie, :has_news_easy_image,
        :has_news_easy_movie, :has_news_easy_voice, :news_web_image_uri,
        :news_web_movie_uri, :news_easy_image_uri, :news_easy_movie_uri,
        :news_easy_voice_uri, :news_web_url

      def initialize(date, item={})
        @date = date
        parse_item(item)
      end

      def news_web_image_url
        NHK::Easy::BASE_URI+"#{news_id}/#{news_web_image_uri}"
      end

      def news_web_movie_url
        NHK::Easy::BASE_MOVIE_URI+news_web_movie_uri
      end

      def news_easy_image_url
        NHK::Easy::BASE_URI+"#{news_id}/#{news_easy_image_uri}"
      end

      def news_easy_movie_url
        NHK::Easy::BASE_MOVIE_URI+news_easy_movie_uri
      end

      def news_easy_voice_url
        NHK::Easy::BASE_URI+"#{news_id}/#{news_easy_voice_uri}"
      end

      def has_news_web_image?; !!has_news_web_image; end
      def has_news_web_movie?; !!has_news_web_movie; end
      def has_news_easy_image?; !!has_news_easy_image; end
      def has_news_easy_movie?; !!has_news_easy_movie; end
      def has_news_easy_voice?; !!has_news_easy_voice; end

      private
      def parse_item(item)
        item.each do |key, value|
          self.send("#{key}=", value) rescue next
        end
      end
    end
  end
end
