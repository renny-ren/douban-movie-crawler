require 'spec_helper'

describe ApplicantsController do
	describe 'POST #create' do

		context 'with valid attributes' do
			it 'saves the user into database' do
				expect{ post :create, user: attributes_for(:new_user) }.to change(User, :count).by(1)
			end

			it 'redirects to sessions#new' do
				post :create, user: attributes_for(:new_user)
				expect(response).to redirect_to new_sessions_path
			end
		end

		context 'with invalid attributes' do
			it 'does not save the user in the databse' do
				expect{ post :create, user: attributes_for(:invalid_user) }.to_not change(User, :count)
			end
			
			it 'redirects to applicants#new' do
				post :create, user: attributes_for(:invalid_user)
				expect(response).to redirect_to new_applicant_path
			end
		end

	end
end