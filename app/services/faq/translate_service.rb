require 'dotenv'
Dotenv.load('keys.env')

module FaqModule
    class TranslateService
        def initialize(params)
            @sentence = params["sentence"]
        end

        def call
            return "Não foi possível realizar a tradução. Verifique a ortografia da frase!" if @sentence == nil
            
            # Pegando a chave do keys.env
            yandex_key = ENV["YANDEX_API_KEY"]
            yandex_url = ENV["YANDEX_API_URL"]

            url = "#{yandex_url}?key=#{yandex_key}&text=#{@sentence}&lang=pt-en"
            request = RestClient.get url
            value = JSON.parse(request.body)["text"][0]
            return "#{value}"
        end
    end
end