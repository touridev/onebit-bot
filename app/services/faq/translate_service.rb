module FaqModule
    class TranslateService
        def initialize(params)
            @sentence = params["sentence"]
        end

        def call
            return "Não foi possível realizar a tradução. Verifique a ortografia da frase!" if @sentence == nil
            
            translator = Yandex::Translator.new('trnsl.1.1.20200112T230230Z.34956b8259078003.a7ae2acf5ff567b79d26659bc65d2b72ff05acc6')
            text = translator.translate @sentence, from: 'pt', to: 'en'
            response = text
        end
    end
end