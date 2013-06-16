class DailyFoodRecordsController < ApplicationController
  # GET /daily_food_records
  # GET /daily_food_records.json
  def index
    @daily_food_records = DailyFoodRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @daily_food_records }
    end
  end

  # GET /daily_food_records/1
  # GET /daily_food_records/1.json
  def show
    @daily_food_record = DailyFoodRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @daily_food_record }
    end
  end

  # GET /daily_food_records/new
  # GET /daily_food_records/new.json
  def new
    @daily_food_record = DailyFoodRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @daily_food_record }
    end
  end

  # GET /daily_food_records/1/edit
  def edit
    @daily_food_record = DailyFoodRecord.find(params[:id])
  end

  # POST /daily_food_records
  # POST /daily_food_records.json
  def create
    @daily_food_record = DailyFoodRecord.new(params[:daily_food_record])

    respond_to do |format|
      if @daily_food_record.save
        format.html { redirect_to @daily_food_record, notice: 'Daily food record was successfully created.' }
        format.json { render json: @daily_food_record, status: :created, location: @daily_food_record }
      else
        format.html { render action: "new" }
        format.json { render json: @daily_food_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /daily_food_records/1
  # PUT /daily_food_records/1.json
  def update
    @daily_food_record = DailyFoodRecord.find(params[:id])

    respond_to do |format|
      if @daily_food_record.update_attributes(params[:daily_food_record])
        format.html { redirect_to @daily_food_record, notice: 'Daily food record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @daily_food_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_food_records/1
  # DELETE /daily_food_records/1.json
  def destroy
    @daily_food_record = DailyFoodRecord.find(params[:id])
    @daily_food_record.destroy

    respond_to do |format|
      format.html { redirect_to daily_food_records_url }
      format.json { head :no_content }
    end
  end
end
