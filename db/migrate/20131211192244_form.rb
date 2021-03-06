class Form < ActiveRecord::Migration
  def change
    create_table :forms do |f|
      f.string :company_name
      f.string :tel
      f.string :fax
      f.string :email
      f.string :business_address
      f.string :city
      f.string :state
      f.string :zip_code
      f.string :d_u_n_s
      f.string :tax_id
      f.string :annual_sales
      f.string :number_of_employees
      f.string :exfreight_sales_rep

      t.timestamps
    end
  end
end

