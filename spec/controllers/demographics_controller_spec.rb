require 'spec_helper'

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

describe DemographicsController do
  render_views
  
  # This should return the minimal set of attributes required to create a valid
  # Demographic. As you add validations to Demographic, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { 
      :gender => 0,
      :age => 12,
      :major => "CS",
      :year_university => "2012",
      :gpa => 3.2,
      :country_of_residence => "usa",
      :country_of_birth => "usa",
      :country_of_schooling => "usa",
      :native_english => "english"
    }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DemographicsController. Be sure to keep this updated too.
  def valid_session
    { :session_id => "woot" }
  end
  
  before(:each) do
    @participant = FactoryGirl.create(:participant, :session_id => "woot")
  end

  describe "GET index" do
    before(:each) do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV["ADMIN_USER"]}:#{ENV["ADMIN_PASS"]}")
    end
    it "assigns all demographics as @demographics" do
      demographic = FactoryGirl.create(:demographic)
      get :index, {}, valid_session
      assigns(:demographics).should eq([demographic])
    end
  end

  describe "GET show" do
    before(:each) do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV["ADMIN_USER"]}:#{ENV["ADMIN_PASS"]}")
    end
    it "assigns the requested demographic as @demographic" do
      demographic = FactoryGirl.create(:demographic)
      get :show, {:id => demographic.to_param}, valid_session
      assigns(:demographic).should eq(demographic)
    end
  end

  describe "GET new" do
    it "assigns a new demographic as @demographic" do
      get :new, {}, valid_session
      assigns(:demographic).should be_a_new(Demographic)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Demographic" do
        expect {
          post :create, {:demographic => valid_attributes}, valid_session
        }.to change(Demographic, :count).by(1)
      end

      it "assigns a newly created demographic as @demographic" do
        post :create, {:demographic => valid_attributes}, valid_session
        assigns(:demographic).should be_a(Demographic)
        assigns(:demographic).should be_persisted
      end

      it "redirects to the created demographic" do
        post :create, {:demographic => valid_attributes}, valid_session
        response.should redirect_to(new_graphic_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved demographic as @demographic" do
        # Trigger the behavior that occurs when invalid params are submitted
        Demographic.any_instance.stub(:save).and_return(false)
        post :create, {:demographic => {}}, valid_session
        assigns(:demographic).should be_a_new(Demographic)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Demographic.any_instance.stub(:save).and_return(false)
        post :create, {:demographic => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV["ADMIN_USER"]}:#{ENV["ADMIN_PASS"]}")
    end
    it "destroys the requested demographic" do
      demographic = FactoryGirl.create(:demographic)
      expect {
        delete :destroy, {:id => demographic.to_param}, valid_session
      }.to change(Demographic, :count).by(-1)
    end

    it "redirects to the demographics list" do
      demographic = FactoryGirl.create(:demographic)
      delete :destroy, {:id => demographic.to_param}, valid_session
      response.should redirect_to(demographics_url)
    end
  end

end
