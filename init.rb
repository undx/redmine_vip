Redmine::Plugin.register :redmine_vip do
  name 'Redmine Vip plugin'
  author 'Emmanuel GALLOIS'
  description 'Allows VIP members'
  version '0.0.1'
  url 'http://github.com/undx/redmine_vip'
  author_url 'http://emmanuel.gallois.me'
  # User view overloading
  class UserVipHookListener < Redmine::Hook::ViewListener
    render_on :view_users_form,  :partial => "users/vip"
  end
  # monkey-patch user class
  require_dependency 'project'
  require_dependency 'principal'
  require_dependency 'user'
  
  User.class_eval do
    safe_attributes :vip      
  end
  
  User::USER_FORMATS = {
    :firstname_lastname => {:string => '#{firstname} #{lastname}', :order => %w(firstname lastname id)},
    :firstname => {:string => '#{firstname}', :order => %w(firstname id)},
    :lastname_firstname => {:string => '#{lastname} #{firstname}', :order => %w(lastname firstname id)},
    :lastname_coma_firstname => {:string => '#{lastname}, #{firstname}', :order => %w(lastname firstname id)},
    :username => {:string => '#{login}', :order => %w(login id)},
    :fullname_with_username => {:string => '#{firstname} #{lastname} (#{login})', :order => %w(firstname lastname id)},
    :fullname_with_login_and_vip => {:string => '#{firstname} #{lastname} (#{login}) #{l(:vip) if (vip&&User.current.admin?)}', :order => %w(firstname lastname id)},
    }
end
