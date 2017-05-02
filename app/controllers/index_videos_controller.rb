class IndexVideosController < InheritedResources::Base

  private

    def index_video_params
      params.require(:index_video).permit(:youtube)
    end
end

