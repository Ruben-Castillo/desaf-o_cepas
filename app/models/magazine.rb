class Magazine < ApplicationRecord
    has_many :magazineoenologistjobtitles
    has_many :job_titles, through: :magazineoenologistjobtitles
    has_many :oenologists, through: :magazineoenologistjobtitles

    def isOenologistThisJobTitle?(o_id,job_id)
        magazineoenologistjobtitles = Magazineoenologistjobtitle.where(magazine_id: self.id, oenologist_id: o_id, job_title_id:job_id)
        magazineoenologistjobtitles.count>0
    end

    def addOenologistsJobTitle(job_titles)
        
        self.magazineoenologistjobtitles.destroy_all

        job_titles.each do |oenologist_id, job_titles_ids|
    
            oenologist=Oenologist.find(oenologist_id)
            
            job_titles_ids.each do |jobtitle_id|
                unless jobtitle_id.empty?
                    job_title=JobTitle.find(jobtitle_id)       
                    magazineoenologistjobtitle=Magazineoenologistjobtitle.new
                        magazineoenologistjobtitle.magazine_id=self.id
                        magazineoenologistjobtitle.oenologist_id=oenologist.id
                        magazineoenologistjobtitle.job_title_id=job_title.id
                    magazineoenologistjobtitle.save
                end
            end
        end
    end
end