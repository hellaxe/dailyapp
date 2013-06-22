class MealsController < ApplicationController
  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.all
    @dfr = DailyFoodRecord.find(params[:daily_food_record_id])
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meals }
    end
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
    @meal = Meal.find(params[:id])
    @user = User.find(params[:user_id])
    @dfr = DailyFoodRecord.find(params[:daily_food_record_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /meals/new
  # GET /meals/new.json
  def new
    @user = User.find(params[:user_id])
    @dfr = DailyFoodRecord.find(params[:daily_food_record_id])
    @meal = @dfr.meals.build
    @meal.build_nested_attributes
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /meals/1/edit
  def edit
    @user = User.find(params[:user_id])
    @dfr = DailyFoodRecord.find(params[:daily_food_record_id])
    @meal = Meal.find(params[:id])
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = Meal.new(params[:meal])
    @user = User.find(params[:user_id])
    @dfr = DailyFoodRecord.find(params[:daily_food_record_id])
    @dfr.meals << @meal
    @meal.fill_nested_attributes(current_user.id)

    # TODO: Make fill_total before save
    respond_to do |format|
      if @meal.save
        format.html { redirect_to [@user, @dfr, @meal], notice: 'Meal was successfully created.' }
        format.json { render json: @meal, status: :created, location: @meal }
      else
        format.html { render action: "new" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meals/1
  # PUT /meals/1.json
  def update
    @meal = Meal.find(params[:id])
    @user = User.find(params[:user_id])
    @dfr = DailyFoodRecord.find(params[:daily_food_record_id])
    respond_to do |format|
      if @meal.update_attributes(params[:meal])
        format.html { redirect_to [@user, @dfr, @meal], notice: 'Meal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal = Meal.find(params[:id])
    @user = User.find(params[:user_id])
    @dfr = DailyFoodRecord.find(params[:daily_food_record_id])
    @meal.destroy

    respond_to do |format|
      format.html { redirect_to user_daily_food_record_meals_url }
      format.json { head :no_content }
    end
  end
end
