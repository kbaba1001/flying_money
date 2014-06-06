RailsAdmin.config do |config|
  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard do
      statistics false
    end
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  config.model 'Outlay' do
    edit do
      field :created_at do
        date_format do
          'short'
        end
      end
      field :amount
      field :note
      field :expense_item
      field :user
    end
  end

  config.model 'User' do
    edit do
      field :email
      field :password
      field :password_confirmation
    end
  end
end
