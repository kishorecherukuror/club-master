class ChangeDataTypeForCcn < ActiveRecord::Migration
 def up
    #change_column :memberships, :ccn, :text
end
def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :memberships, :ccn, :string
end
end
