module FaqModule
    class TranslateService
        def initialize(params)
            @sentence = sentence
        end

        def call
            return "Por favor, informe a frase ou palavra a ser traduzida!" if @sentence == nil
            
        end
    end
end