 class TopicPolicy < ApplicationPolicy
 
   def index?
     true
   end
 
   def create?
     user.present? && user.admin?
   end
 
   def update?
     create?
   end
   #Only show topics which are public. Private topics are only viewable by registered users
   def show?
     record.public? || user.present?
   end
 end