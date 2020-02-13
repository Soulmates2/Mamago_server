class Dialog < ApplicationRecord
  belongs_to :user
  belongs_to :question

  enum source: {
    src_ko: 0,
    src_en: 1,
  }

  enum target: {
    tar_ko: 0,
    tar_en: 1,
  }
end
