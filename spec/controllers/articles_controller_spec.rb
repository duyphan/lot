require 'spec_helper'

describe ArticlesController do
	describe "administrator" do
		before :each do
      @user = FactoryGirl.create(:admin)
      session[:user_id] = @user.id
    end

    describe 'GET #index' do
      it "populates an array of article" do
        # user = FactoryGirl.create(:user)

        smith = FactoryGirl.create(:article, user: @user, title: 'Smith John')
        jones = FactoryGirl.create(:article, user: @user, title: 'Jones John')
        get :index
        expect(assigns(:articles)).to match_array([smith, jones])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
      it "get infomation for 1 article" do
        # user = FactoryGirl.create(:user)

        article = FactoryGirl.create(:article, user: @user)
        get :show, id: article
        expect(assigns(:article)).to eq article
      end

      it "renders the :show template" do
        # user = FactoryGirl.create(:user)

        article = FactoryGirl.create(:article, user: @user)

        get :show, id: article
        expect(response).to render_template :show 
      end
    end

    describe 'GET #new' do
      it "assigns a new article" do
        # user = FactoryGirl.create(:user)

        get :new, user_id: @user
        expect(assigns(:article)).to be_a_new(Article)
      end

      it "renders the :new template" do
        # user = FactoryGirl.create(:user)

        get :new, user_id: @user
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      it "assigns a edit article" do
        # user = FactoryGirl.create(:user)
        article = FactoryGirl.create(:article, user: @user)

        get :edit, user_id: @user, id: article
        expect(assigns(:article)).to eq article
      end

      it "renders the :new template" do
        # user = FactoryGirl.create(:user)
        article = FactoryGirl.create(:article, user: @user)

        get :edit, user_id: @user, id: article
        expect(response).to render_template :edit
      end
    end

    describe "POST #create" do
      # before :each do
      #   @user = FactoryGirl.create(:user)
      # end

      context "with valid attributes" do
        it "saves the new article in the database" do
          expect{
            post :create, article: FactoryGirl.attributes_for(:article, user: @user)
          }.to change(Article, :count).by(1)
        end

        it "redirects to article#show" do
          post :create, article: FactoryGirl.attributes_for(:article, user: @user)
          expect(response).to redirect_to article_path(assigns[:article])
        end
      end

      context "with invalid attributes" do
        it "does not save the new article in the database" do
          expect{
            post :create, article: FactoryGirl.attributes_for(:invalid_article)
          }.to_not change(Article, :count)
        end

        it "re-renders the :new template" do
          post :create, article: FactoryGirl.attributes_for(:invalid_article)
          expect(response).to render_template :new
        end
      end
    end

    describe 'PATCH #update' do
      before :each do
        # @user = FactoryGirl.create(:user)
        @article = FactoryGirl.create(:article, user: @user, title: 'Lawrence', description: 'John John John John John John')
      end

      context "valid attributes" do
        it "locates the requested @article" do
          patch :update, id: @article, article: FactoryGirl.attributes_for(:article)
          expect(assigns(:article)).to eq(@article)
        end

        it "changes @article's attributes" do
          patch :update, id: @article,
            article: FactoryGirl.attributes_for(:article, user: @user, title: 'Larry', description: 'Smithh')
          @article.reload
          expect(@article.title).to eq('Larry')
          # expect(@article.description).to text('Smithh')
        end

        it "redirects to the updated article" do
          patch :update, id: @article, article: FactoryGirl.attributes_for(:article)
          expect(response).to redirect_to @article
        end
      end
    end
	end
	describe "guest access" do
		describe 'GET #new' do
      it "requires login" do
        get :new
        expect(response).to redirect_to login_url
      end
    end

    describe 'GET #edit' do
      it "requires login" do
        article = FactoryGirl.create(:article)
        get :edit, id: article
        expect(response).to redirect_to login_url
      end
    end

    describe "POST #create" do
      it "requires login" do
        post :create, id: FactoryGirl.create(:article),
          article: FactoryGirl.attributes_for(:article)
        expect(response).to redirect_to login_url
      end
    end

    describe 'PUT #update' do
      it "requires login" do
        put :update, id: FactoryGirl.create(:article),
          article: FactoryGirl.attributes_for(:article)
        expect(response).to redirect_to login_url
      end
    end

    describe 'DELETE #destroy' do
      it "requires login" do
        delete :destroy, id: FactoryGirl.create(:article)
        expect(response).to redirect_to login_url
      end
    end
	end
end