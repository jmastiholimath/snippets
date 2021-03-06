require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe SnippetsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Snippet. As you add validations to Snippet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {description: 'Anything', private: false}
  }

  let(:invalid_attributes) {
    {description:  (0...8193).map { ('a'..'z').to_a[rand(26)] }.join, private: false}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SnippetsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      snippet = Snippet.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      snippet = Snippet.create! valid_attributes
      get :show, {:id => snippet.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, {}, valid_session
      expect(response).to be_success
    end
  end


  describe "POST #create" do
    context "with valid params" do
      it "creates a new Snippet" do
        expect {
          post :create, {:snippet => valid_attributes}, valid_session
        }.to change(Snippet, :count).by(1)
      end

      it "redirects to the created snippet" do
        post :create, {:snippet => valid_attributes}, valid_session
        expect(response).to redirect_to(Snippet.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:snippet => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

end
