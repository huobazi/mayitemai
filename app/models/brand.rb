class Brand
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel

  validates :name, :wangwang, :banner_picture, :recommend_picture, presence: true

  field :name
  field :wangwang
  field :banner_picture
  field :recommend_picture
  field :state, type: Integer, default: 1

  index({ wangwang: 1 }, { unique: true, name: "ssn_index" })

  STATE = {
    # 正常
    normal: 1,
    # 屏蔽
    blocked: 0
  }

  # 旺旺搜索
  def self.find_by_wangwang(wangwang)
    where(wangwang: /#{wangwang}/)
  end


end
