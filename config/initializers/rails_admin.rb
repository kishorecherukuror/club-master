RailsAdmin.config do |config|
  config.authorize_with :cancan
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  config.current_user_method {current_user}


  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  
  config.model ClubCoffee do
	#navigation_label "Demo Application"
	list do
		field :name
		field :image do
			thumb_method :cart
		end
		field :user
	end
	edit do
		field :name
		field :image
		field :user
		include_all_fields
    end
  end
  config.model Cigar do
	#navigation_label "Demo Application"
	list do
		field :name
		field :image do
			thumb_method :cart
		end
	end
	edit do
		field :name
		field :image
		include_all_fields
    end
  end
  config.model Wine do
	#navigation_label "Demo Application"
	list do
		field :name
		field :image do
			thumb_method :cart
		end
	end
	edit do
		field :name
		field :image
		include_all_fields
    end
  end
  config.model Flower do
	#navigation_label "Demo Application"
	list do
		field :name
		field :image do
			thumb_method :cart
		end
	end
	edit do
		field :name
		field :image
		include_all_fields
    end
  end
  config.model Wine do
	#navigation_label "Demo Application"
	list do
		field :name
		field :image do
			thumb_method :cart
		end
	end
	edit do
		field :name
		field :image
		include_all_fields
    end
  end
  config.model Game do
	#navigation_label "Demo Application"
	list do
		field :name
		field :image do
			thumb_method :cart
		end
	end
	edit do
		field :name
		field :image
		include_all_fields
    end
  end
end
