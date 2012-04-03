# -*- coding: utf-8 -*-
class OrdersController < ApplicationController
  before_filter :check_profile
  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders.order("created_at DESC").page(params[:page]).per(15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @commodity = Commodity.find(params[:commodity_id])
    @order = Order.new(params["order"["price"]])
    @order.user = current_user
    @order.name = Time.now.to_i
    @order.price = @commodity.price

    respond_to do |format|
      if @order.save
        alert = Alert.new
        alert.commodity = @commodity
        alert.user = @commodity.user
        alert.info = "#{current_user.profile.name}が商品を買いたいです"
        alert.user.havemessage = 1
        alert.user.save
        alert.save

        @commodity.orders << @order
        @commodity.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def deal
    @order = Order.find(params[:id])

    if @order.commodity.num > 0
      @order.commodity.num -=1
      return nil if !@order.commodity.save
      if @order.update_attributes(params[:order])
        alert = Alert.new
        alert.commodity = @order.commodity
        alert.user = @order.user
        alert.info = "購入成功"
        alert.user.havemessage = 1
        alert.user.save
        alert.save

        respond_to do |format|
          format.js
        end
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      #Fix Me:must be changed at same time
      if @order.update_attributes(params[:order])
        @order.commodities.each { |commodity|
          commodity.num -= 1
          commodity.save
        }
      #   format.html { redirect_to @order, notice: 'Order was successfully updated.' }
      #   format.json { head :no_content }
      # else
      #   format.html { render action: "edit" }
      #   format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
