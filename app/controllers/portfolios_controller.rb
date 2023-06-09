class PortfoliosController < ApplicationController
    def index
        @portfolio_items = Portfolio.all
    end
    
    def show
        @portfolio_item = Portfolio.find(params[:id]) 

    end
    
    def new
        @portfolio_item = Portfolio.new
    end
    
    def edit
       @portfolio_item = Portfolio.find(params[:id]) 
    end
    
    def create
       @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
       respond_to do |format|
           if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'Portfolio has been created'} 
           else
               format.html{ render :new}
           end
       end
    end
    
    def update
        @portfolio_item = Portfolio.find(params[:id])
       respond_to do |format|
          if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body)) 
             format.html { redirect_to portfolios_path, notice: "Portfolio has been updated"}
          else
             format.html {render :new}
          end
       end
    end
    
    def destroy
        @portfolio_item = Portfolio.find(params[:id])
        
        respond_to do |format|
           if @portfolio_item.destroy
                format.html{redirect_to portfolios_path, notice: "Portfolio has been destroyed."}
           else
                format.html{redirect_to portfolio_path, alert:"Portfolio couldn't been destroyed"}
           end
        end
    end
end
