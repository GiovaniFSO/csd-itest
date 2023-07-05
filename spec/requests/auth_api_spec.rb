require 'rails_helper'

describe 'Auth API' do
  context 'GET /login' do
    it 'with username and password valid' do
      user_created = { auth: { 'username': 'John Doe', 'password': '456123' } }

      post api_v1_login_path, params: user_created

      expect(response).to have_http_status(200)
      expect(parsed_body['msg']).to eq('Successful login')
    end

    it 'fields blank' do
      user = { auth: { 'username': '', 'password': '' } }

      post api_v1_login_path, params: user

      expect(parsed_body['msg']).to eq('Username or Password incorrect')
    end

    it 'wrong password' do
      user = { auth: { 'username': 'John Doe', 'password': '123456' } }

      post api_v1_login_path, params: user

      expect(parsed_body['msg']).to eq('Username or Password incorrect')
    end

    it 'wrong username' do
      user = { auth: { 'username': 'Jane Doe', 'password': '456123' } }
      post api_v1_login_path, params: user

      expect(parsed_body['msg']).to eq('Username or Password incorrect')
    end
  end
end