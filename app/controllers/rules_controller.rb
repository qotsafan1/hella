class RulesController < InheritedResources::Base

  private

    def rule_params
      params.require(:rule).permit(:rule_is, :rule_en)
    end
end

