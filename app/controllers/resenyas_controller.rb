class ResenyasController < ApplicationController

  def create
    @restaurant= Restaurant.find(params[:restaurant_id])
    @resenya = @restaurant.resenyas.build(params[:resenya])

    respond_to do |format|
      if @resenya.save
        flash[:notice] = 'Critica creada OK.'
        format.html { redirect_to @restaurant }
      else
        flash[:error] = @resenya.errors.full_messages.to_sentence
        format.html { redirect_to @restaurant }
      end
    end
  end
end

