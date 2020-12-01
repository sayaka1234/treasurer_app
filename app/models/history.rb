class History < ApplicationRecord
    has_many :questions, dependent: :destroy
  
    validates :treasurer, presence: true
    validates :payee, presence: true
    validates :title, presence: true

    enum status: {income: 0, outcome: 1}
    
    def self.search(params)
      histories = History.all
      histories = histories.where(["title LIKE ?", "%#{params[:title]}%"]) if params[:title].present?
      histories = histories.where(["payee LIKE ?", "%#{params[:payee]}%"]) if params[:payee].present?
      histories = histories.where(["treasurer LIKE ?", "%#{params[:treasurer]}%"]) if params[:treasurer].present?
      histories = histories.where(status: params[:status]) if params[:status].present?
      histories = histories.where(price: params[:price]) if params[:price].present?
      # histories = histories.where("? <= start_received_day", Time.zone.parse(params[:start_received_day] + '00:00:00')) if params[:start_received_day].present?
      # histories = histories.where("? <= finish_received_day", Time.zone.parse(params[:finish_received_day] + '23:59:59')) if params[:finish_received_day].present?
      # histories = histories.where("? <= start_return_day", Time.zone.parse(params[:start_return_day] + '00:00:00')) if params[:start_return_day].present?
      # histories = histories.where("? <= finish_return_day", Time.zone.parse(params[:finish_return_day] + '23:59:59')) if params[:finish_return_day].present?
      return histories
    end
end
