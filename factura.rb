#puts "hola"
class Estados
    def initialize(estado)
        #puts "Estado Seleccionado: #{estado}"
        if estado == ""
            puts "Ingrese un Valor de Estado"
        else 
            @estado=estado
        end
    end

    def obtenerValores()
        #puts "---> #{@estado}"
        val ={"UT"=> [6.85,1000.00,3.00] , 
            "NV"=>[8.00,5000.00,5.00] ,
            "AL"=>[4.00,10000.00,10.00] ,
            "CA"=>[8.25,50000.00,15.00] ,
            }[@estado]
    end

end

class Facturacion
    def initialize(cantidad, precio, estado)
       @estado=estado
       if cantidad=="" || precio==""
            puts "Ingrese los datos correctos.."
       else
            @cantidad=cantidad
            @precio=precio
       end
    end
    
    def calcular()
        puts "Iniciando ... Estado : #{@estado}"
        est= Estados.new(@estado)
        val= est.obtenerValores()
        precioT = @cantidad.to_f*@precio.to_f

        puts "# #{@cantidad} * $#{@precio} = $#{precioT}"

        tasa = (val[0]/100)*precioT

        puts "#{@estado}(%#{val[0]}) = $#{tasa}"

        # calculando descuento
        desc = 0.00
        if precioT > val[1]
            desc = val[2]
        end

        descT= desc* (precioT+tasa)
        puts "DTO(%#{desc}) = $#{descT}"

        totalPrecio = precioT + tasa - descT

        puts "Total = $#{totalPrecio}"

    end
end
cantidad= ARGV[0]
precioU= ARGV[1]
estado= ARGV[2]

fact= Facturacion.new(cantidad,precioU, estado)
fact.calcular()