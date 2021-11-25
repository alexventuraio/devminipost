 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/competitions", type: :request do
  
  # Competition. As you add validations to Competition, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Competition.create! valid_attributes
      get competitions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      competition = Competition.create! valid_attributes
      get competition_url(competition)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_competition_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      competition = Competition.create! valid_attributes
      get edit_competition_url(competition)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Competition" do
        expect {
          post competitions_url, params: { competition: valid_attributes }
        }.to change(Competition, :count).by(1)
      end

      it "redirects to the created competition" do
        post competitions_url, params: { competition: valid_attributes }
        expect(response).to redirect_to(competition_url(Competition.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Competition" do
        expect {
          post competitions_url, params: { competition: invalid_attributes }
        }.to change(Competition, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post competitions_url, params: { competition: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested competition" do
        competition = Competition.create! valid_attributes
        patch competition_url(competition), params: { competition: new_attributes }
        competition.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the competition" do
        competition = Competition.create! valid_attributes
        patch competition_url(competition), params: { competition: new_attributes }
        competition.reload
        expect(response).to redirect_to(competition_url(competition))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        competition = Competition.create! valid_attributes
        patch competition_url(competition), params: { competition: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested competition" do
      competition = Competition.create! valid_attributes
      expect {
        delete competition_url(competition)
      }.to change(Competition, :count).by(-1)
    end

    it "redirects to the competitions list" do
      competition = Competition.create! valid_attributes
      delete competition_url(competition)
      expect(response).to redirect_to(competitions_url)
    end
  end
end
