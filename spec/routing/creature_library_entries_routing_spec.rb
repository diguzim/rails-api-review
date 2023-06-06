require "rails_helper"

RSpec.describe CreatureLibraryEntriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/creature_library_entries").to route_to("creature_library_entries#index")
    end

    it "routes to #show" do
      expect(get: "/creature_library_entries/1").to route_to("creature_library_entries#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/creature_library_entries").to route_to("creature_library_entries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/creature_library_entries/1").to route_to("creature_library_entries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/creature_library_entries/1").to route_to("creature_library_entries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/creature_library_entries/1").to route_to("creature_library_entries#destroy", id: "1")
    end
  end
end
