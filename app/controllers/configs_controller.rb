class ConfigsController < ApplicationController
  before_action :set_config, only: [:show, :edit, :update, :destroy]

  # GET /configs
  # GET /configs.json
  require 'open-uri'
  def index
    @configs = Config.all

$i = 1
$num = 11
@docCompany = ""
@docAdresse = ""
@docTelephone = ""
@arrtest = ""
file = File.open("#{Rails.root}/doc/test.txt", 'a+')
while $i <= $num  do
  @index = $i
  @doc = Nokogiri::HTML(open("http://www.adicq.qc.ca/pages/rep_reg.php?p="+$i.to_s+"&t=0&tri=&l=en&fic="))
  
   @adresseAdicq = @doc.css('td.mid.ga.t13.bb-gf.celltxtg').map(&:text).join(" * ")
   @phoneAdicq = @doc.css('td.mid.ga.t13.bh-gf').map(&:text).join(" * ")
   
   @companyNameAdicq = @doc.css('a.t14.bol.lien').map(&:text).join(" * ")
   #@docFinalAdresse << " * " + @adresseAdicq
   @docCompany << @companyNameAdicq
   @docAdresse << @adresseAdicq
   @docTelephone << @phoneAdicq

   @companyNameString = @companyNameAdicq.to_s
   @arrCompany = @docCompany.split(";")
   @arrtest = @arrCompany[3].to_s.split("*")
   @arrAdresse = @docAdresse.split(";")
   @arrTelephone = @docTelephone.split(";")
   @message = @arrCompany[1].to_s + "," + @arrAdresse[1].to_s + "," + @arrTelephone[1].to_s + ";\n"
   puts @message
   
   file2 = file.puts @message
    

   $i +=1
   
   @docCompany << ";"
   @docAdresse << ";"
   @docTelephone << ";"
   

end
file.close


 @doc = Nokogiri::HTML(open("https://emplois.ca.indeed.com/emplois?q=innovation&l=Laval%2C+QC&start=20"))
#@doc = Nokogiri::HTML(open("https://emplois.ca.indeed.com/Laval,-QC-Emplois-innovation"))
#@doc = Nokogiri::HTML(open("http://www.lesaffaires.com/classements/les-300/liste"))

@doc2 = @doc.xpath("//body").text
#@title = @doc.search('a').text

@indeed3 = @doc.css('span.company')
@indeed = @doc.css('span.company').text
@indeed2 = @doc.css('div.sjcl').text

#@doc2 = @doc.xpath("//text()").text

  end


  # GET /configs/1
  # GET /configs/1.json
  def show
  end

  # GET /configs/new
  def new
    @config = Config.new
  end

  # GET /configs/1/edit
  def edit
  end

  # POST /configs
  # POST /configs.json
  def create
    @config = Config.new(config_params)

    respond_to do |format|
      if @config.save
        format.html { redirect_to @config, notice: 'Configuration was successfully created.' }
        format.json { render :show, status: :created, location: @config }
      else
        format.html { render :new }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configs/1
  # PATCH/PUT /configs/1.json
  def update
    respond_to do |format|
      if @config.update(config_params)
        format.html { redirect_to @config, notice: 'Configuration was successfully updated.' }
        format.json { render :show, status: :ok, location: @config }
      else
        format.html { render :edit }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configs/1
  # DELETE /configs/1.json
  def destroy
    @config.destroy
    respond_to do |format|
      format.html { redirect_to configs_url, notice: 'Configuration was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config
      @config = Config.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_params    
      params.require(:config).permit(:conf_name, :conf_repeat_pull, :conf_repeat_push, :conf_url_pull, :conf_type_pull)
      
    end
end