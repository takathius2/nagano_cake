class Address < ApplicationRecord
    belongs_to :customer
    belongs_to :order
    
    def address_display
        '〒' + postalcode + '' + address + '' + name
    end
    
end
