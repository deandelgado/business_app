class FormPdf < Prawn::Document

  def initialize(form)
    @form = form
    super(top_margin: 25)
    image "#{Rails.root}/app/assets/images/Ex-Freight-LOGO1.jpg", :scale => 0.3,
                                                                  :position => :center
    text "Tel: 877-208-5645 Fax: 888-286-0772 AR@EXFREIGHT.COM", :align => :center,
                                                                 :font_style => :bold,
                                                                 :size => 10
    move_down 1
    text "APPLICATION FOR BUSINESS ACCOUNT", :align => :center,
                                             :font_style => :bold,
                                             :size => 14
    line_items

  end

  def line_items
    move_down 3
    table title_one, :width => 540,
                     :row_colors => ["d8e5f0"],
                     :position => :center,
                     :cell_style => {:font_style => :bold, :align => :center,
                                     :padding => [2, 0, 2, 0]}
    table block_one, :width => 540,
                     :row_colors => ["d9d9d9"],
                     :cell_style => {:padding => [1, 1, 1, 3]}
    table block_two, :width => 540,
                     :row_colors => ["d9d9d9"],
                     :cell_style => {:padding => [1, 1, 1, 3]}
    table block_three, :width => 540,
                       :row_colors => ["d9d9d9"],
                       :cell_style => {:padding => [1, 1, 1, 3]}
    table block_four, :width => 540,
                       :row_colors => ["d9d9d9"],
                       :cell_style => {:padding => [1, 1, 1, 3]}
    table block_five, :width => 540,
                       :row_colors => ["d9d9d9"],
                       :cell_style => {:padding => [1, 1, 1, 3]}
    table block_six, :width => 540,
                       :row_colors => ["d9d9d9"],
                       :cell_style => {:padding => [1, 1, 1, 3]}
    table block_seven, :width => 540,
                       :row_colors => ["d9d9d9"],
                       :cell_style => {:padding => [1, 1, 1, 3]}
  end

  def title_one
    title_one = [["BUSINESS CONTACT INFORMATION"]]
  end

  def block_one
    block_one = [["Company name: #{@form.company_name}"]]
  end

  def block_two
    line_one = [["Tel: #{@form.tel}", "Fax: #{@form.fax}", "Email: #{@form.email}"]]
  end

  def block_three
    line_one = [["Business Address: #{@form.business_address}"]]
  end

  def block_four
    line_one = [["City: #{@form.city}", "State: #{@form.state}", "Zip Code: #{@form.zip_code}"]]
  end

  def block_five
    line_one = [["D-U-N-S#: #{@form.d_u_n_s}", "Tax ID#: #{@form.tax_id}"]]
  end

  def block_six
    line_one = [["Annual Sales: #{@form.annual_sales}", "Number of Employees: #{@form.number_of_employees}", "Exfreight Sales Rep: #{@form.exfreight_sales_rep}"]]
  end

  def block_seven
    line_one = [["Type of Business:"]]
  end
end