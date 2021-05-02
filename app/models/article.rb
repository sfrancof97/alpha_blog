class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum: 6, maximum:100} #esto es para validar que en el titulo si exista un valor por medio del presence : true
    validates :description, presence: true, length: {minimum: 10, maximum:300}
end