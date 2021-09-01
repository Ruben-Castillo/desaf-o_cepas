class Wine < ApplicationRecord
    has_many :wine_strains
    has_many :strains, through: :wine_strains
    has_many :scores
    has_many :oenologists, through: :scores

    def addStrainPercent(strainPercents)
        strainPercents.each do |strainId,strainPercent|
            unless strainPercent.empty?
                self.wine_strains.create(strain_id: strainId, percentage: strainPercent)
            end
        end
    end

    def GetScore(oId)
        wine_score=Score.find_by(wine_id: self.id, oenologist_id:oId)
        if wine_score==nil
            "Sin Puntuación"
        else
            wine_score.score
        end
    end

    def GetStrainPercentage(strainId)
        wine_strain=WineStrain.find_by(wine_id: self.id, strain_id: strainId)
        unless wine_strain==nil
            wine_strain.percentage
        end
    end


    def updateStrainPercent(strainPercents, wineId)

        WineStrain.where(wine_id: wineId).destroy_all
       
        strainPercents.each do |strainId,strainPercent|
            unless strainPercent.empty?
                self.wine_strains.create(strain_id: strainId, percentage: strainPercent)
            end
        end
    end


    def updateScores(o_scores, wineId)
        Score.where(wine_id: wineId).destroy_all
        
        o_scores.each do |o,s|
            unless s.empty?
                self.scores.create(wine_id: wineId, oenologist_id: o, score: s)
            end
        end
    end

    def oenologistScore(o_id)
        score=Score.find_by(wine_id: self.id, oenologist_id: o_id)
        if score==nil 
            score="Sin calificación"
        end
        return score.score
    end

end