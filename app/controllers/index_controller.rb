class IndexController < ApplicationController
  def index
    @indexVideos = IndexVideo.all
  end

  def news
    @articles = Article.order('articles.updated_at DESC').all
  end

  def results
    @groups = Group.all
    @competitors = Competitor.where(year: 2016).order('laps DESC', :total_time)
  end

  def info
    @info = Information.first
    @groups = Group.where(hide: false).order(:priority)
    @rules = Rule.all
  end

  def children
    @info = Kid.first
  end
end
