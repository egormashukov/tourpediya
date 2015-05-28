require 'rails_helper'

describe ExcursionCategory do
  it { should belong_to :excursion }
  it { should belong_to :category  }
end
