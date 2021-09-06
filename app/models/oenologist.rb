class Oenologist < ApplicationRecord
    has_many :magazineoenologistjobtitles, dependent: :destroy
    has_many :job_titles, through: :magazineoenologistjobtitles
    has_many :magazines, through: :magazineoenologistjobtitles
    has_many :scores, dependent: :destroy
    has_many :wines, through: :scores

   def addMagazinesJobTitle(job_titles)
    self.magazineoenologistjobtitles.destroy_all

        job_titles.each do |magazine_id, job_titles_ids|
    
            magazine=Magazine.find(magazine_id)
            
            job_titles_ids.each do |jobtitle_id|
                unless jobtitle_id.empty?
                    job_title=JobTitle.find(jobtitle_id)       
                    magazineoenologistjobtitle=Magazineoenologistjobtitle.new
                        magazineoenologistjobtitle.magazine_id=magazine_id
                        magazineoenologistjobtitle.oenologist_id=self.id
                        magazineoenologistjobtitle.job_title_id=job_title.id
                    magazineoenologistjobtitle.save
                end
            end
        end
       
   end
end
