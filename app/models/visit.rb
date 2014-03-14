class Visit < ActiveRecord::Base
  belongs_to :visitable, polymorphic: true
  has_many :visit_details

  # CODE REVIEW: great method! Why is this not a test for this?
  def self.track(question, ip_address)
    visit = Visit.find_or_create_by_visitable_id_and_visitable_type(question.id, question.class.name)

    unless VisitDetail.find_by_visit_id_and_ip_address(visit.id, ip_address)

      visit.increment!(:unique_visits)
    end
    visit.increment!(:total_visits)
    visit_detail = visit.visit_details.create(ip_address: ip_address)
  end
end
