# typed: false
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_length_of(:title).is_at_least(3).is_at_most(25) }
  it { should validate_length_of(:description).is_at_least(10).is_at_most(600) }

  context 'when title is too long' do
    let(:title) { 'a' * 26 }
    let(:task) { build(:task, title:, description: 'This is a valid description here') }

    it 'invalidates the task' do
      expect(task).not_to be_valid
    end
  end

  context 'when description is too long' do
    let(:description) { 'a' * 601 }
    let(:task) { build(:task, title: 'A valid title', description:) }

    it 'invalidates the task' do
      expect(task).not_to be_valid
    end
  end
end
