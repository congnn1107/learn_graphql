class Post < ApplicationRecord
  include AASM
  enum status: {
    draft: 0,
    publish_requested: 1,
    publish_rejected: 2,
    published: 3,
    removed: 4
  }
  aasm column: :status, enum: true do
    state :draft, initial: true
    state :publish_requested , :publish_rejected, :published, :removed

    event :request, after_commit: :requested_notify do
      transitions from: :draft, to: :publish_requested 
    end
    event :reject do
      transitions from: :publish_requested, to: :publish_rejected
    end
    event :publish do
      transitions from: :publish_requested, to: :published
    end
    event :remove, guard: :any_guard do
      transitions from: :published, to: :removed
    end
    event :draft, after: :drafted_notify do
      transitions from: [:publish_requested, :publish_rejected, :published, :removed], to: :draft
    end
  end

  def requested_notify
    puts "Post publishing requested!"
  end

  def drafted_notify
    puts "Post status is back to drafted!"
  end

  def any_guard
    false
  end
end
