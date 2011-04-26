class Restaurant < ActiveRecord::Base
  acts_as_mappable 

  validates_presence_of :nom
  
  has_many :resenyas
  has_many :critics, :through => :resenyas
  
 
  def find_closest
    @location = MultiGeocoder.geocode(params[:location])
    if @location.success
        @restaurants= Restaurant.find(:all, 
		:origin => [@location.lat, @location.lng], 
        	:conditions => "distance < #{params[:radius]}", 						
		:order=>'distance')
    end    
  end


    def mitja_punts
          resenyas.average(:puntuacio) || BigDecimal("0.0")
      end

      def suspes?
          mitja_punts < 5
      end
end
