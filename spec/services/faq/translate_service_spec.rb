require_relative './../../spec_helper.rb'

describe FaqModule::TranslateService do
    before do
        @sentence = "Olá"
    end

    describe "#call" do
        context "Valid sentence" do
            it "Return translated sentence" do
                
                expect(response).to match("Hi")
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