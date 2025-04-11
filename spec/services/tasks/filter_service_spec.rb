require 'rails_helper'

RSpec.describe Tasks::FilterService, type: :service do
  describe '#filter' do
    subject(:filter_service) { described_class.new(params) }
    let(:task1) { create(:task, title: 'Buy groceries', done: false) }
    let(:task2) { create(:task, title: 'Do laundry', done: true) }
    let(:task3) { create(:task, title: 'Buy gifts', done: false) }
    let(:task4) { create(:task, title: 'Buy tomato', done: true) }
    let(:task5) { create(:task, title: 'Write essay', done: false) }

    context 'when filtering by done status' do
      let(:params) { { done: "true" } }

      it 'returns tasks matching the status' do
        expect(filter_service.filter).to contain_exactly(task2, task4)
      end
    end

    context 'when filtering by pending status' do
      let(:params) { { done: "false" } }

      it 'returns tasks matching the status' do
        expect(filter_service.filter).to contain_exactly(task1, task3, task5)
      end
    end
  end
end
