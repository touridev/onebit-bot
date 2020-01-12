require_relative './../../spec_helper.rb'

describe FaqModule::TranslateService do
    describe "#call" do
        context "Valid sentence" do
            before do
                @sentence = FFaker::Lorem.sentence
            end

            it "Return translated sentence" do
                response = @translateService.call({"sentence" => @sentence})
                expect(response).to match("Texto traduzido com sucesso!")
            end
        end

        context "Invalid sentence" do
            it "Return error message" do
                @translateService = FaqModule::TranslateService.new({})
                response = @translateService.call()

                expect(response).to match("Não foi possível realizar a tradução. Verifique a ortografia da frase!")
            end
        end
    end
end