require 'rails_helper'

RSpec.describe TasksController, type: :request do
  describe 'GET /tasks' do
    it 'renders the index with HTML format' do
      create(:task)
      get tasks_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('tasks_index')
    end

    it 'renders the index with Turbo Stream format' do
      create_list(:task, 3)
      get tasks_path, headers: { 'Accept' => 'text/vnd.turbo-stream.html' }

      expect(response.media_type).to eq('text/vnd.turbo-stream.html')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /tasks/new' do
    before { get new_task_path, as: :turbo_stream }
    it 'renders the new form' do
      expect(response).to have_http_status(:ok)
    end

    it 'has the Update button' do
      expect(response.body).to include('Create')
    end
  end

  describe 'POST /tasks' do
    let(:valid_params) { { task: { title: 'Test title', description: 'A valid description here' } } }
    let(:invalid_params) { { task: { title: 'a', description: 'short' } } }

    it 'creates a task with valid params' do
      expect {
        post tasks_path, params: valid_params, as: :turbo_stream
      }.to change(Task, :count).by(1)

      expect(response).to have_http_status(:ok)
    end

    it 'returns 422 with invalid params' do
      post tasks_path, params: invalid_params, as: :turbo_stream

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET /tasks/:id/edit' do
    let(:task) { create(:task) }
    before { get edit_task_path(task), as: :turbo_stream }

    it 'renders the edit form' do
      expect(response).to have_http_status(:ok)
    end

    it 'has the Update button' do
      expect(response.body).to include('Update')
    end
  end

  describe 'PATCH /tasks/:id' do
    let(:task) { create(:task) }

    it 'updates the task with valid params' do
      patch task_path(task), params: { task: { done: true } }, as: :turbo_stream

      expect(task.reload.done).to eq(true)
    end

    it 'returns 422 with invalid params' do
      patch task_path(task), params: { task: { title: 'a' } }, as: :turbo_stream

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /tasks/:id' do
    let!(:task) { create(:task) }

    it 'destroys the task' do
      expect {
        delete task_path(task)
      }.to change(Task, :count).by(-1)
    end
  end
end
