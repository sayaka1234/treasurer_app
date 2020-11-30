class History < ApplicationRecord
    has_many :questions, dependent: :destroy
  
    validates :treasurer, presence: true
    validates :payee, presence: true
    validates :title, presence: true
    validates :description, presence: true
    enum status: {not_finish: 0, finish: 1}
    
    def self.search(params)
      histories = History
      histories = History.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
      return histories
    end
end
