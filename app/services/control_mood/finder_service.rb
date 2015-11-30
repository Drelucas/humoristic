class ControlMood
  class FinderService
    class << self
      def find(params)
        params = params.with_indifferent_access.symbolize_keys
        ControlMood.where("#{params[:type]} like ?", "%#{params[:text]}%").all
      end
    end
  end
end