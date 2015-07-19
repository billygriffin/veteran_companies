Adminsimple.setup do |config|

  # Set the available themes
  # dark, light, and simple are available as defaults
  config.theme = :simple

  # Set the CSS overrides
  # A path to a file in your project to override styles
  config.app_css_overrides = 'admin'

  # Set the JS overrides
  # A path to a file in your project to override javascripts
  config.app_js_overrides = 'admin'

  # Specify the layout order
  # You can reorder the default, include additional layout modules or remove unused/unsupported ones.
  config.layout  = [:user_nav, :main_nav, :flash_messages, :content]

  # Parent controller
  # You can set the parent controller to something if ActionController::Base doesn't do everything you want.
  config.parent_controller = 'ActionController::Base'

  Navigasmic.setup do |c|
    c.semantic_navigation :adminsimple_main_nav do |n|
      n.item n.t('adminsimple.main_nav.dashboard'), proc{ adminsimple.root_path }, icon: 'home'
      n.item n.t('adminsimple.main_nav.companies'), proc{ admin_companies_path }, icon: 'folder', highlights_on: [{controller: 'admin/companies'}]
      # n.item n.t('adminsimple.main_nav.bases'), proc{ admin_bases_path }, icon: 'folder', highlights_on: [{controller: 'admin/bases'}]
      # n.item n.t('adminsimple.main_nav.base_locations'), proc{ admin_base_locations_path }, icon: 'folder', highlights_on: [{controller: 'admin/base_locations'}]
      # n.item n.t('adminsimple.main_nav.establishments'), proc{ admin_establishments_path }, icon: 'folder', highlights_on: [{controller: 'admin/establishments'}]
      # n.item n.t('adminsimple.main_nav.reviews'), proc{ admin_reviews_path }, icon: 'folder', highlights_on: [{controller: 'admin/reviews'}], label: proc { Review.pending.count }
      # n.item n.t('adminsimple.main_nav.photos'), proc{ admin_photos_path }, icon: 'folder', highlights_on: [{controller: 'admin/photos'}], label: proc { Photo.pending.count }
      # n.item n.t('adminsimple.main_nav.categories'), proc{ admin_categories_path }, icon: 'folder', highlights_on: [{controller: 'admin/categories'}]
      # n.item n.t('adminsimple.main_nav.regional_designations'), proc{ admin_regional_designations_path }, icon: 'folder', highlights_on: [{controller: 'admin/regional_designations'}]
      # n.item n.t('adminsimple.main_nav.posts'), proc{ admin_posts_path }, icon: 'folder', highlights_on: [{controller: 'admin/posts'}]
      # n.item n.t('adminsimple.main_nav.movies'), proc{ admin_movies_path }, icon: 'folder', highlights_on: [{controller: 'admin/movies'}]
      # n.item n.t('adminsimple.main_nav.users'), proc{ admin_users_path }, icon: 'folder', highlights_on: [{controller: 'admin/users'}]
      # n.item n.t('adminsimple.main_nav.admins'), proc{ admin_admins_path }, icon: 'folder', highlights_on: [{controller: 'admin/admins'}]
      # n.item n.t('adminsimple.main_nav.issues'), proc{ admin_issues_path }, icon: 'frown-o', highlights_on: [{controller: 'admin/issues'}], label: proc { Issue.open.count }

      # n.item n.t('adminsimple.main_nav.sidekiq'), proc{ admin_sidekiq_path }, icon: 'tasks', highlights_on: [{controller: 'admin/sidekiq'}]
      if Rails.env.development?
        n.group n.t('adminsimple.main_nav.style_guide'), icon: 'info-circle' do
          n.item n.t('adminsimple.main_nav.forms'), proc{ adminsimple.styleguide_path('forms') }, icon: 'th-list'
          n.item n.t('adminsimple.main_nav.tables'), proc{ adminsimple.styleguide_path('tables') }, icon: 'th'
          n.item n.t('adminsimple.main_nav.elements'), proc{ adminsimple.styleguide_path('elements') }, icon: 'briefcase'
          n.item n.t('adminsimple.main_nav.messages'), proc{ adminsimple.styleguide_path('messages') }, icon: 'exclamation-triangle'
          n.item n.t('adminsimple.main_nav.icons'), proc{ adminsimple.styleguide_path('icons') }, icon: 'list-ul'
        end
      end
    end

    c.semantic_navigation :adminsimple_user_nav do |n|
      n.item n.t('adminsimple.user_nav.profile'), proc{ main_app.edit_admin_registration_path }, class: 'btn', icon: 'user', link_html: { rel: 'modal' }
      n.item n.t('adminsimple.user_nav.sign_out'), proc{ main_app.destroy_admin_session_path }, class: 'btn', icon: 'reply'
    end
  end

  SimpleForm.setup do |c|
    c.boolean_style = :inline
    c.button_class = 'btn btn-primary'

    c.wrappers :bootstrap3, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|

      b.use :html5
      b.use :min_max
      b.use :maxlength
      b.use :placeholder

      b.optional :pattern
      b.optional :readonly

      b.use :label, wrap_with: { class: 'form-label' }

      b.use :label_input
      b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      b.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end

    c.wrappers :bootstrap3_horizontal, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|

      b.use :html5
      b.use :min_max
      b.use :maxlength
      b.use :placeholder

      b.optional :pattern
      b.optional :readonly

      b.use :label, wrap_with: { class: 'form-label col-lg-3 col-md-3' }
      b.wrapper :right_column, tag: :div, class: 'form-input col-lg-9 col-md-9' do |component|
        component.use :input
      end

      b.use :error, wrap_with: { tag: 'span', class: 'help-block has-error col-lg-offset-3 col-lg-9 col-md-offset-3 col-md-9' }
      b.use :hint,  wrap_with: { tag: 'span', class: 'help-block col-lg-offset-3 col-lg-9 col-md-offset-3 col-md-9' }
    end

    c.wrappers :group, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|

      b.use :html5
      b.use :min_max
      b.use :maxlength
      b.use :placeholder

      b.optional :pattern
      b.optional :readonly

      b.use :label, wrap_with: { class: 'form-label col-lg-3 col-md-3' }
      b.use :input, wrap_with: { class: 'input-group' }
      b.use :hint,  wrap_with: { tag: 'span', class: 'help-block col-lg-offset-3 col-lg-9 col-md-offset-3 col-md-9' }
      b.use :error, wrap_with: { tag: 'span', class: 'help-block has-error col-lg-offset-3 col-lg-9 col-md-offset-3 col-md-9' }
    end

    c.wrappers :checkbox_horizontal, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
      b.wrapper tag: 'div', class: 'col-lg-offset-3 col-lg-9 col-md-offset-3 col-md-9' do |ba|
        ba.use :label_input
        ba.use :error, wrap_with: { tag: 'span', class: 'help-block has-error col-lg-offset-3 col-lg-9 col-md-offset-3 col-md-9' }
      end
    end

    c.wrappers :checkbox, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
      b.wrapper tag: 'div' do |ba|
        ba.use :label_input
      end
    end

    c.default_wrapper = :bootstrap3_horizontal
  end
end
