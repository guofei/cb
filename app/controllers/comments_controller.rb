# -*- coding: utf-8 -*-
class CommentsController < ApplicationController
  before_filter :check_profile
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @commodity = Commodity.find(params[:commodity_id])
    id = params[:comment_replyto]
    alert = Alert.new
    alert.commodity_id = params[:commodity_id]

    @comment.commodity_id = params[:commodity_id]
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        if id != ""
          user = User.find(id)
          @comment.replyto = id
          alert.user = user
          alert.info = "#{current_user.profile.name}に返信されました"
          alert.user.havemessage = 1
          alert.user.save
          alert.save
        else
          alert.user = Commodity.find(params[:commodity_id]).user
          alert.info = "#{current_user.profile.name}に返信されました"
          alert.user.havemessage = 1
          alert.user.save
          alert.save
        end

        format.html { redirect_to @comment.commodity, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to @comment.commodity, notice: 'Comment is too short' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
