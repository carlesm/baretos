class Restaurant < ActiveRecord::Base
  validates_presence_of :nom
  
  has_many :resenyas
  has_many :critics, :through => :resenyas
  
    def mitja_punts
          resenyas.average(:puntuacio) || BigDecimal("0.0")
      end

      def suspes?
          mitja_punts < 5
      end
end
