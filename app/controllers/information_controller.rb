class InformationController < InheritedResources::Base

  private

    def information_params
      params.require(:information).permit(:info_is, :info_en)
    end
end

