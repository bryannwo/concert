class ReservationsController < ApplicationController

    def index
        @reservations = Reservation.all 
    end


    def show
        @reservation = Reservation.find(params[:id])
    end



    def new
        @asiento = params[:asiento]
        @numeracion = params[:numeracion]
        @localidad = params[:localidad]
        @precio = params[:precio]
        @reservation = Reservation.new
    end

    def create
    
        @reservation = Reservation.new(
            user_id: params[:reservation][:user_id],
            seat_id: params[:reservation][:seat_id],
            )
    
        @reservation.save
    end



    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy 
        redirect_to reservations_path
    end


    def update 
        @reservation = Reservation.find(params[:id])
        if @reservation.update(
            user_id: params[:reservation][:user_id],
            seat_id: params[:reservation][:seat_id],
            )
            redirect_to @reservation
        else
            render :edit
        end
    end
    
    def edit
        @reservation = Reservation.find(params[:id])
    end

end
