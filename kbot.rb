class KBot
        def initialize(lang="en")
                @lang            = lang
                @saludo_tarde    = {"es"=> 'Buenas tardes', "en"=> 'Good afternoon'}
                @saludo_noche    = {"es"=> 'Buenas noches', "en"=> 'Good evening'}
                @obtener_nombre  = {"es"=> 'Ingrese nombre', "en"=> 'Enter name'}        
                @saludo_temprano = {"es"=> 'Buen día', "en"=> 'Good morning'}
        end

        def setLang(lang)
                @lang = lang
        end        

        def getLang()
                @lang
        end         

        def recibirInvitado()
                "#{@obtener_nombre[@lang]}"
        end

        # 
        # Param
        #       hora: Permite determinar el saludo, evita depender de algo que no podemos controlar
        def saludar(nombre, hora = Time.now.hour)
                case hora
                        when (0..10) then
                                "#{@saludo_temprano[@lang]} #{nombre}"
                        when (11..18) then 
                                "#{@saludo_tarde[@lang]} #{nombre}"
                        when (19..23) then
                                "#{@saludo_noche[@lang]} #{nombre}"
                end

        end

end
## Ejecucion inicial
# bot = KBot.new()
# ruby kbot.rb DC
# puts bot.saludar(ARGV[0]) 

# Pruebas unitarias por mi cuenta, no es conveniente
# puts "---Prueba con idioma Default (Ingles)---"
# ## Deberia devolver "Good morning/Good afternoon/Good evening DC"
# bot = KBot.new()
# puts "-#{bot.saludar("DC")}-"
# puts (bot.saludar("DC",21) == "Good evening DC") 

# puts "---Prueba con idioma Español---"
# ## Deberia devolver "Buen día/Buenas tardes/buenas noches DC"
# bot = KBot.new "es"
# puts "-#{bot.saludar("DC")}-"
# puts (bot.saludar("DC",1) == "Buen día DC")
 
# puts "---Prueba con idioma Ingles---"
# ## Deberia devolver "Good morning/Good afternoon/Good evening DC"
# bot = KBot.new("en")
# puts "-#{bot.saludar("DC")}-"
# puts (bot.saludar("DC",15) == "Good afternoon DC")

## Para probar entrada de datos
# puts "Seleccione Lenguaje/Select Language"
# puts "1. Español"
# puts "2. Ingles"
# op = gets
# bot.setLang("es") if op.to_i == 1
# puts bot.getLang
# puts bot.recibirInvitado()
# nombre = gets
# puts bot.saludar(nombre)