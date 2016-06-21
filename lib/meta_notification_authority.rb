module MetaNotificationAuthority
  def self.included(base)
    base.before_filter :authorize
  end

  def authorize
    # byebug
    case @_action_name
    when 'index', 'show'
      # puts "R   E   A   D"
      # return if authorization success
      return if true
      # else render error
      render_error
    when 'create'
      # puts "C   R   E   A   T   E"
      # return if authorization success
      return if true
      # else render error
      render_error
    when 'update'
      # puts "U   P   D   A   T   E"
      # return if authorization success
      return if true
      # else render error
      render_error
    when 'delete'
      # puts "D   E   L   E   T   E"
      # return if authorization success
      return if true
      # else render error
      render_error
    end
  end

  def render_error
    render :json => {error: "You are not authorize."}, status: 422
  end
end
