class Wine < ApplicationRecord
    has_many :wine_strains
    has_many :strains, through: :wine_strains




    def addStrainPercent(strainPercents)
        strainPercents.each do |strainId,strainPercent|
            unless strainPercent.empty?
                self.wine_strains.create(strain_id: strainId, percentage: strainPercent)
            end
        end
    end

    def updateStrainPercent(strainPercents, wineId)

        @wineStrains=WineStrain.where(wine_id: wineId).destroy_all
       
        strainPercents.each do |strainId,strainPercent|
            unless strainPercent.empty?
                self.wine_strains.create(strain_id: strainId, percentage: strainPercent)
            end
        end
    end

end