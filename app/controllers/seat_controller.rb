class SeatController < ApplicationController
    
    def index
        @seats = Seat.all 
    end
   
   
    def show
        @seat = Seat.find(params[:id])
    end

    
    
    def new
    @seat = Seat.new
    end


    def create
        @seat = Seat.new(
            numeracion: params[:seat][:numeracion], 
            localidad:  params[:seat][:localidad],
            precio:  params[:seat][:precio]
            )

        @seat.save
        redirect_to @seat 
    end


    def destroy
        @seat = Seat.find(params[:id])
        @seat.destroy 
        redirect_to seats_path	
    end


    def update 
        if @seat.update(
            numeracion: params[:seat][:numeracion], 
            localidad:  params[:seat][:localidad],
            precio:  params[:seat][:precio]
            )
            redirect_to @seat
        else
            render :edit
        end
    end


    def edit
        @seat = Seat.find(params[:id])
    end


    def seat_params
        params.require(:room).permit(:numeracion, :localidad, :precio)
    end


    def buscardisponibles

        @localidad ="'"+ params[:localidad]+"'"
          
        puts @user
        @busqueda = Seat.joins(
            'LEFT OUTER JOIN reservations ON reservations.seat_id = seats.id 
            where seats.localidad = '+@localidad+'  and reservations.seat_id IS NULL'
        )
    end

      


end
