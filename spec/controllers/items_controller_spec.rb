# frozen_string_literal: true

require "rails_helper"

RSpec.describe(ItemsController, type: :controller) do
  describe "with an authenticated user" do
    let(:user) { create(:user) }

    before do
      add_authentication_header(user)
    end

    describe "GET #index" do
      it "returns a successful response" do
        get :index
        expect(response).to(be_successful)
      end
    end

    describe "GET #show" do
      it "returns a successful response" do
        item = create(:item, user: user)

        get :show, params: { id: item.id }
        expect(response).to(be_successful)
      end
    end

    describe "POST #create" do
      context "with valid parameters" do
        it "creates a new item" do
          expect do
            post(:create, params: { item: { name: "Sword" } })
          end.to(change(Item, :count).by(1))
        end

        it "returns a successful response" do
          post :create, params: { item: { name: "Sword" } }
          expect(response).to(be_successful)
        end
      end
    end

    describe "PATCH #update" do
      context "with valid parameters" do
        it "updates the item" do
          item = create(:item, user: user)

          new_name = "Shield"
          patch :update, params: { id: item.id, item: { name: new_name } }
          item.reload

          expect(item.name).to(eq(new_name))
        end

        it "returns a successful response" do
          item = create(:item, user: user)

          patch :update, params: { id: item.id, item: { name: "Shield" } }
          expect(response).to(be_successful)
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the item" do
        item = create(:item, user: user)

        expect do
          delete(:destroy, params: { id: item.id })
        end.to(change(Item, :count).by(-1))
      end

      it "returns a successful response" do
        item = create(:item, user: user)

        delete :destroy, params: { id: item.id }
        expect(response).to(be_successful)
      end
    end
  end

  describe "without an authenticated user" do
    it "returns an unauthorized response" do
      get :index
      expect(response).to(have_http_status(401))
    end
  end
end
