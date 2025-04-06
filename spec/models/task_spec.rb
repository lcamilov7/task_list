# typed: false
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_length_of(:title).is_at_least(3).is_at_most(25) }
  it { should validate_length_of(:description).is_at_least(10).is_at_most(200) }
  it { expect(Task.statuses).to eq({ 'pending' => 'pending', 'done' => 'done' }) }
end
