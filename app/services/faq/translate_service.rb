module FaqModule
    class TranslateService
        def initialize(params)
            @sentence = sentence
        end

        def call
            return "Por favor, informe a frase ou palavra a ser traduzida!" if @sentence == nil
            
            translator = Yandex::Translator.new('trnsl.1.1.20200112T230230Z.34956b8259078003.a7ae2acf5ff567b79d26659bc65d2b72ff05acc6')
            text = translator.translate @sentence, from: 'pt', to: 'en'
            response = "Frase: #{text}"
        end
    end
end