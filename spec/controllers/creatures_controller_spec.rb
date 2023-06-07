# frozen_string_literal: true

require "rails_helper"

RSpec.describe(CreaturesController, type: :controller) do
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
        creature = create(:creature, user: user)

        get :show, params: { id: creature.id }
        expect(response).to(be_successful)
      end
    end

    describe "POST #create" do
      context "with valid parameters" do
        it "creates a new creature" do
          expect do
            post(:create, params: { creature: { name: "Troll" } })
          end.to(change(Creature, :count).by(1))
        end

        it "returns a successful response" do
          post :create, params: { creature: { name: "Troll" } }
          expect(response).to(be_successful)
        end
      end
    end

    describe "PATCH #update" do
      context "with valid parameters" do
        it "updates the creature" do
          creature = create(:creature, user: user)

          new_name = "New Name"
          patch :update, params: { id: creature.id, creature: { name: new_name } }
          creature.reload

          expect(creature.name).to(eq(new_name))
        end

        it "returns a successful response" do
          creature = create(:creature, user: user)

          patch :update, params: { id: creature.id, creature: { name: "New Name" } }
          expect(response).to(be_successful)
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the creature" do
        creature = create(:creature, user: user)

        expect do
          delete(:destroy, params: { id: creature.id })
        end.to(change(Creature, :count).by(-1))
      end

      it "returns a successful response" do
        creature = create(:creature, user: user)

        delete :destroy, params: { id: creature.id }
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
