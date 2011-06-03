shared_examples_for "Common Write API" do
  describe '#clear_roles!' do
    it "should clear roles" do
      expect { user.clear_roles! }.to change { user.role_value }
      user.role_list.should be_empty      
    end
  end

  it 'should invalidate the role list after roles are changed' do
    # expect roles changed event
    user.set_roles :blip # invalid role
    user.role_name.should == :user # invalid role admin

    user.set_role :editor # editor should be a valid role
    expect { user.role_list }.to change{user.instance_variable_get "@role_list"}
    user.role_name.should == :editor
  end

  describe '#set_roles' do
    it "should set set roles to :user only" do
      user.set_roles(:admin)
      user.has_role?(:admin).should be_true
      user.has_role?(:user).should be_false
    end
  end

  describe '#add_roles' do
    it "should be that after adding :admin role, he has that role" do
      expect { user.add_roles(:admin) }.to change{ user.role_value }
      user.has_role?(:admin).should be_true
    end
  end

  describe '#remove_roles' do
    it "should remove :user role" do
      expect { user.remove_roles(:user) }.to change{ user.role_value }                   
      user.has_role?(:user).should be_false
    end           
  end
end
