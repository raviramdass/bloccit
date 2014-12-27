class PostPolicy < ApplicationPolicy
end

def index?
    true
end

def destroy?
  user.present? && (record.user == user || user.admin? || user.moderator?)
end  