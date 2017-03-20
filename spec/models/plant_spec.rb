require 'rails_helper'

RSpec.describe Plant, type: :model do
  it { should have_valid(:name).when('Dahlia') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:cycle).when(72) }
  it { should_not have_valid(:cycle).when(nil, '') }

end
