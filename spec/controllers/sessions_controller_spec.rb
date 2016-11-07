require 'spec_helper'

describe SessionsController do
  describe "POST #create" do
    context "with admin access" do
      it "is admin session" do
        post :create, attributes_for(:admin)
        expect(session[:admin]).to be true
      end  
    end

    context "with valid attributes" do
      it "redirects to pages#index" do
        post :create, attributes_for(:user)
        expect(response).to redirect_to pages_path
      end
    end

    context "with invalid attributes" do
      it "redirect_to sessions#new" do
        post :create, attributes_for(:invalid_user)   # ??１．测试两个数据？　２．
        expect(response).to redirect_to new_sessions_path
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the admin session" do
      delete :destroy
      expect(session[:admin]).to be nil
    end

    it "redirects to sessions#new" do
      delete :destroy
      expect(response).to redirect_to new_sessions_path
    end
  end

end