class User
  class FinderService
    class << self
      def find(params)
        params = params.with_indifferent_access.symbolize_keys
        User.where("#{params[:type]} like ?", "%#{params[:text]}%").all
      end
    end
  end
end