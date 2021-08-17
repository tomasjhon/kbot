#require 'rspec'
require './kbot'

describe KBot do
    it "saluda por default en ingles de noche" do
        ##Arrange
        bot= KBot.new()
        ##Act
        msg = bot.saludar("DC",21)
        ##Assert
        expect(msg).to eq "Good evening DC"
    end

    it "saluda en ingles de tarde" do
        ##Arrange
        bot = KBot.new("en")
        ##Act
        msg = bot.saludar("DC",15)
        ##Assert
        expect(msg).to match /Good afternoon DC/
    end

    it "saluda en español de dia" do
        ##Arrange
        bot = KBot.new "es"
        ##Act
        msg = bot.saludar("DC",2)
        ##Assert    
        expect(msg).to match /Buen día DC/
    end    
end

describe "KBot con Before" do
    before(:example) do
        ##Arrange
        @bot= KBot.new("es")
    end
    it "saluda en español de dia" do
        ##Act
        @msg = @bot.saludar("DC",1) 
        ##Assert
        expect(@msg).to start_with("Buen día")
    end
    it "saluda en español de tarde" do
        ##Act
        @msg = @bot.saludar("DC",15)
        ##Assert
        expect(@msg).to match /Buenas tardes DC/
    end    
end
 
# puts "---Prueba con idioma Ingles---"
# ## Deberia devolver "Good morning/Good afternoon/Good evening DC"
# bot = KBot.new("en")
# puts "-#{bot.saludar("DC")}-"
# puts (bot.saludar("DC",15) == "Good afternoon DC")