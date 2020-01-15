# require 'rest-client'
# require 'json'

module FaqModule
    class TranslateService
        def initialize(params)
            @sentence = params["sentence"]
        end

        def call
            return "Não foi possível realizar a tradução. Verifique a ortografia da frase!" if @sentence == nil
            
            # base_url = "https://translate.yandex.net/api/v1.5/tr.json/detect
            # ? key=<trnsl.1.1.20200112T230230Z.34956b8259078003.a7ae2acf5ff567b79d26659bc65d2b72ff05acc6>
            # & text=<#{@sentence}>"
            
            
            response = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20200112T230230Z.34956b8259078003.a7ae2acf5ff567b79d26659bc65d2b72ff05acc6&text=#{@sentence}&lang=pt-en"
            request = RestClient.get response
            value = JSON.parse(request.body)["text"][0]
            return "#{value}"
        end
    end
end