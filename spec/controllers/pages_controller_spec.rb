require 'spec_helper'

describe PagesController do
	describe "GET #index" do
		# it "is order by date" do
		# 	get :index, id: @order
		# 	expect(current_path).to match(/order_by=date/)
		# end
	end

	describe "DELETE #destroy" do
		before do
			@film = create(:film)
		end

		it "deletes the film " do
			expect{
				delete :destroy, id: @film
			}.to change(Film, :count).by (-1)
		end

		it "redirects to pages#index" do
			delete :destroy, id: @film
      expect(response).to redirect_to pages_path
		end
	end
end
