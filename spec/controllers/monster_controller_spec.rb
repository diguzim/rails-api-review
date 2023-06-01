# frozen_string_literal: true

require "rails_helper"

RSpec.describe(MonstersController, type: :controller) do
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
        monster = create(:monster, user: user)

        get :show, params: { id: monster.id }
        expect(response).to(be_successful)
      end
    end

    describe "POST #create" do
      context "with valid parameters" do
        it "creates a new monster" do
          expect do
            post(:create, params: { monster: { name: "Troll" } })
          end.to(change(Monster, :count).by(1))
        end

        it "returns a successful response" do
          post :create, params: { monster: { name: "Troll" } }
          expect(response).to(be_successful)
        end
      end
    end

    describe "PATCH #update" do
      context "with valid parameters" do
        it "updates the monster" do
          monster = create(:monster, user: user)

          new_name = "New Name"
          patch :update, params: { id: monster.id, monster: { name: new_name } }
          monster.reload

          expect(monster.name).to(eq(new_name))
        end

        it "returns a successful response" do
          monster = create(:monster, user: user)

          patch :update, params: { id: monster.id, monster: { name: "New Name" } }
          expect(response).to(be_successful)
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the monster" do
        monster = create(:monster, user: user)

        expect do
          delete(:destroy, params: { id: monster.id })
        end.to(change(Monster, :count).by(-1))
      end

      it "returns a successful response" do
        monster = create(:monster, user: user)

        delete :destroy, params: { id: monster.id }
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
