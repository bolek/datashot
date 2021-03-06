require "rails_helper"

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

module Datashot
  describe SnapshotsController, type: :controller do
    let(:snapshot) { build_stubbed(:snapshot) }

    # This should return the minimal set of attributes required to create a valid
    # Snapshot. As you add validations to Snapshot, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) { { "name" => snapshot.name, "query" => snapshot.query } }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # SnapshotsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all snapshots as @snapshots" do
        snapshot = Snapshot.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:snapshots)).to eq([snapshot])
      end
    end

    describe "GET show" do
      let(:snapshot) { build_stubbed :snapshot }

      before { allow(Snapshot).to receive(:find).with(snapshot.id.to_s).and_return(snapshot) }

      it "assigns the requested snapshot as @snapshot" do
        get :show, { id: snapshot.to_param }, valid_session
        expect(assigns(:snapshot)).to eq(snapshot)
      end

      context "when format csv" do
        context "when result as json array" do
          let(:snapshot) { build_stubbed(:snapshot, result: [{ a: 1, b: 2 }, { a: 2, b: 3 }].to_json) }

          it "returns results as csv with headers" do
            get :show, { id: snapshot.to_param, format: :csv }, valid_session
            expect(response.body).to eq("a,b\n1,2\n2,3\n")
          end
        end

        context "when result has json object" do
          let(:snapshot) { build_stubbed(:snapshot, result: { a: 1, b: 2 }.to_json) }

          it "returns results as csv with headers" do
            get :show, { id: snapshot.to_param, format: :csv }, valid_session
            expect(response.body).to eq("a,b\n1,2\n")
          end
        end
      end

      context "when format json" do
        it "returns its result as json" do
          get :show, { id: snapshot.to_param, format: :json }, valid_session
          expect(response.body).to eq(snapshot.result)
        end
      end
    end

    describe "GET new" do
      it "assigns a new snapshot as @snapshot" do
        get :new, {}, valid_session
        expect(assigns(:snapshot)).to be_a_new(Snapshot)
      end
    end

    describe "GET edit" do
      it "assigns the requested snapshot as @snapshot" do
        snapshot = Snapshot.create! valid_attributes
        get :edit, { id: snapshot.to_param }, valid_session
        expect(assigns(:snapshot)).to eq(snapshot)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Snapshot" do
          expect {
            post :create, { snapshot: valid_attributes }, valid_session
          }.to change(Snapshot, :count).by(1)
        end

        it "assigns a newly created snapshot as @snapshot" do
          post :create, { snapshot: valid_attributes }, valid_session
          expect(assigns(:snapshot)).to be_a(Snapshot)
          expect(assigns(:snapshot)).to be_persisted
        end

        it "creates a SnapshotJob" do
          allow(Snapshot).to receive(:new).and_return(snapshot)
          allow(snapshot).to receive(:save).and_return(true)
          expect(SnapshotJob).to receive(:perform_later).with(snapshot)
          post :create, { snapshot: valid_attributes }, valid_session
        end

        it "redirects to the created snapshot" do
          post :create, { snapshot: valid_attributes }, valid_session
          expect(response).to redirect_to(Snapshot.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved snapshot as @snapshot" do
          # Trigger the behavior that occurs when invalid params are submitted
          expect_any_instance_of(Snapshot).to receive(:save).and_return(false)
          post :create, { snapshot: { "name" => "invalid value" } }, valid_session
          expect(assigns(:snapshot)).to be_a_new(Snapshot)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          expect_any_instance_of(Snapshot).to receive(:save).and_return(false)
          post :create, { snapshot: { "name" => "invalid value" } }, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested snapshot" do
          snapshot = Snapshot.create! valid_attributes
          # Assuming there are no other snapshots in the database, this
          # specifies that the Snapshot created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          expect_any_instance_of(Snapshot).to receive(:update).with("name" => "MyString")
          put :update, { id: snapshot.to_param, snapshot: { "name" => "MyString" } }, valid_session
        end

        it "assigns the requested snapshot as @snapshot" do
          snapshot = Snapshot.create! valid_attributes
          put :update, { id: snapshot.to_param, snapshot: valid_attributes }, valid_session
          expect(assigns(:snapshot)).to eq(snapshot)
        end

        it "redirects to the snapshot" do
          snapshot = Snapshot.create! valid_attributes
          put :update, { id: snapshot.to_param, snapshot: valid_attributes }, valid_session
          expect(response).to redirect_to(snapshot)
        end
      end

      describe "with invalid params" do
        it "assigns the snapshot as @snapshot" do
          snapshot = Snapshot.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          expect_any_instance_of(Snapshot).to receive(:save).and_return(false)
          put :update, { id: snapshot.to_param, snapshot: { "name" => "invalid value" } }, valid_session
          expect(assigns(:snapshot)).to eq(snapshot)
        end

        it "re-renders the 'edit' template" do
          snapshot = Snapshot.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          expect_any_instance_of(Snapshot).to receive(:save).and_return(false)
          put :update, { id: snapshot.to_param, snapshot: { "name" => "invalid value" } }, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested snapshot" do
        snapshot = Snapshot.create! valid_attributes
        expect {
          delete :destroy, { id: snapshot.to_param }, valid_session
        }.to change(Snapshot, :count).by(-1)
      end

      it "redirects to the snapshots list" do
        snapshot = Snapshot.create! valid_attributes
        delete :destroy, { id: snapshot.to_param }, valid_session
        expect(response).to redirect_to(snapshots_url)
      end
    end

  end
end
