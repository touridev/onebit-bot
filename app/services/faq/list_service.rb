module FaqModule
    class ListService
      def initialize(params, action)
        @action = action
        @query = params["query"]
      end
   
   
      def call
        if @action == "search"
          faqs = Faq.search(@query)
        elsif @action == "search_by_hashtag"
          faqs = []
          Faq.all.each do |faq|
            faq.hashtags.each do |hashtag|
              faqs << faq if hashtag.name == @query
            end
          end
        else
          faqs = Faq.all
        end
   
        response = "<h5>Perguntas e Respostas</h5> \n\n"
        faqs.each do |f|
          response += "#{f.id} - "
          response += "<b>#{f.question}</b>\n"
          response += "<b>#{f.answer}</b> \n"
          f.hashtags.each do |h|
            response += "<i>##{h.name}</i> "
          end
          response += "\n\n"
        end
        (faqs.count > 0)? response : "Nada encontrado"
      end
    end
  end