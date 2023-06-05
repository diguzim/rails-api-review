# frozen_string_literal: true

require "rails_helper"

RSpec.describe(DropsController, type: :controller) do
  describe "with an authenticated user" do
    let(:user) { create(:user) }
    let(:item) { create(:item) }
    let(:monster) { create(:monster) }

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
        drop = create(:drop, item: item, monster: monster)

        get :show, params: { id: drop.id }
        expect(response).to(be_successful)
      end
    end

    describe "POST #create" do
      context "with valid parameters" do
        it "creates a new drop" do
          expect do
            post(:create, params: { drop: { item_id: item.id, monster_id: monster.id } })
          end.to(change(Item, :count).by(1))
        end

        it "returns a successful response" do
          post(:create, params: { drop: { item_id: item.id, monster_id: monster.id } })
          expect(response).to(be_successful)
        end
      end
    end

    describe "PATCH #update" do
      context "with valid parameters" do
        let(:drop) { create(:drop, item: item, monster: monster) }
        let(:new_item) { create(:item) }
        let(:new_monster) { create(:monster) }

        it "updates the drop" do
          patch :update, params: { id: drop.id, drop: { item_id: new_item.id, monster_id: new_monster.id } }
          drop.reload

          expect(drop.item).to(eq(new_item))
          expect(drop.monster).to(eq(new_monster))
        end

        it "returns a successful response" do
          patch :update, params: { id: drop.id, drop: { item_id: new_item.id, monster_id: new_monster.id } }
          expect(response).to(be_successful)
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the drop" do
        drop = create(:drop, item: item, monster: monster)

        expect do
          delete(:destroy, params: { id: drop.id })
        end.to(change(Drop, :count).by(-1))
      end

      it "returns a successful response" do
        drop = create(:drop, item: item, monster: monster)

        delete :destroy, params: { id: drop.id }
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
