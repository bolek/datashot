require_dependency "datashot/application_controller"
require_dependency "json_2_csv"

module Datashot
  class SnapshotsController < ApplicationController
    before_action :set_snapshot, only: [:show, :edit, :update, :destroy]

    # GET /snapshots
    def index
      @snapshots = Snapshot.all
    end

    # GET /snapshots/1
    def show
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @snapshot.result }
        format.csv { render plain: Json2Csv.convert(@snapshot.result, write_headers: true) }
      end
    end

    # GET /snapshots/new
    def new
      @snapshot = Snapshot.new
    end

    # GET /snapshots/1/edit
    def edit
    end

    # POST /snapshots
    def create
      @snapshot = Snapshot.new(snapshot_params)
      if @snapshot.save
        SnapshotJob.perform_later(@snapshot)
        redirect_to @snapshot, notice: "Snapshot was successfully created."
      else
        render :new
      end
    end

    # PATCH/PUT /snapshots/1
    def update
      if @snapshot.update(snapshot_params)
        SnapshotJob.perform_later(@snapshot)
        redirect_to @snapshot, notice: "Snapshot was successfully updated."
      else
        render :edit
      end
    end

    # DELETE /snapshots/1
    def destroy
      @snapshot.destroy
      redirect_to snapshots_url, notice: "Snapshot was successfully destroyed."
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_snapshot
        @snapshot = Snapshot.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def snapshot_params
        params.require(:snapshot).permit(:name, :query)
      end
  end
end
