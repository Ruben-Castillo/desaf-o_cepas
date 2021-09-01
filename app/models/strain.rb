class Strain < ApplicationRecord
    has_many :wine_strains
    has_many :wines, through: :wine_strains

    def percentage(wine)
        ws=WineStrain.find_by(wine_id: wine, strain_id: self.id)
        return ws.percentage
    end
end
