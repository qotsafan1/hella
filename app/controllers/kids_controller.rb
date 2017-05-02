class KidsController < InheritedResources::Base

  private

    def kid_params
      params.require(:kid).permit(:info_is, :info_en)
    end
end

