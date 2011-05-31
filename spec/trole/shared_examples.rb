shared_examples_for "a Single strategy for Kris" do
  subject { kris }
    # Core API
    specify       { lambda { kris.role_field }.should raise_error } # is a class method    
    specify       { User.role_field.should == :trole }

    its(:roles)         { should be_a Troles::Operations }
    its(:role_list)     { should include(:user) }

    specify       { kris.static_roles?.should be_false }
    specify       { User.static_roles?.should be_false }
end
