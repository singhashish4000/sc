class WelcomeController < ApplicationController
    # before_action :set_names
    
    def index
        @center = Center.all
        @countries = Country.all
        @state = State.all
        @district = District.all
        @sub_district = SubDistrict.all
        @city = TownVillage.all      
    end   


    def select
        if params[:country].blank? 
            flash.now[:danger] = 'Please enter name to search'
        else
            country_id = (params[:country])
            c = Country.find(country_id)
 
            state_name = params[:state] 
            s = State.where(name: state_name).pluck(:id) if state_name.present?       

            district_name = params[:district]
            d = District.where(name: district_name).pluck(:id) if district_name.present?

            sub_district_name = params[:sub_district]
            sd = SubDistrict.where(name: sub_district_name).pluck(:id) if sub_district_name.present?

            city_name = params[:city]
            t = SubDistrict.where(name: city_name).pluck(:id) if city_name.present?
           
            if country_id.present? && state_name.blank? && district_name.blank? && sub_district_name.blank? && city_name.blank?
                @center = Center.where(country_id: c) 
            elsif country_id.present? && state_name.present? && district_name.blank? && sub_district_name.blank? && city_name.blank?
                @center = Center.where(country_id: c,state_id: s)
            elsif country_id.present? && state_name.present? && district_name.present? && sub_district_name.blank? && city_name.blank?
                @center = Center.where(country_id: c,state_id: s,district_id: d)
            elsif country_id.present? && state_name.present? && district_name.present? && sub_district_name.present? && city_name.blank?
                @center = Center.where(country_id: c,state_id: s,district_id: d,sub_district_id: sd)
            elsif country_id.present? && state_name.present? && district_name.present? && sub_district_name.present? && city_name.present?
                @center = Center.where(country_id: c,state_id: s,district_id: d,sub_district_id: sd,town_village_id: t)                
            end
            flash.now[:danger] = 'We don\'t have center here.We are working to get here!!.Thank you.' if @center.blank?         
            flash.now[:info] = 'There are following centers in this area.' if @center.present? 
        end 
        render partial: 'welcome/middle_layer'
    end

    def search
        if params[:name].blank? 
            flash.now[:danger] = 'Please enter name to search'
        else  
           name = (params[:name])
           c_id = Country.where("name LIKE ?", "%"+name+"%").pluck(:id);
           s_id = State.where("name LIKE ?", "%"+name+"%").pluck(:id); 
           d_id = District.where("name LIKE ?", "%"+name+"%").pluck(:id);
           sd_id = SubDistrict.where("name LIKE ?", "%"+name+"%").pluck(:id);
           t_id = TownVillage.where("name LIKE ?", "%"+name+"%").pluck(:id);
           @center = Center.where("name LIKE ? OR country_id IN (?) OR state_id IN (?) OR district_id IN (?) OR sub_district_id IN (?)  OR town_village_id IN (?) ", "%"+name+"%",c_id,s_id,d_id,sd_id,t_id)
               #@c_id = Country.where("name LIKE ?", "%"+name+"%").pluck(:id).first;
                # if @c_id.blank?
                #     @s_id = State.where("name LIKE ?", "%"+name+"%").pluck(:id).first;    
                #       if @s_id.blank?

                #       else
                #         @center = Center.where("state_id = ?", @s_id)
                #       end 
                # else
                #     @center = Center.where("country_id = ?", @c_id)
                # end            
                flash.now[:danger] = 'We don\'t have center here.We are working to get here!!.Thank you.' if @center.blank?               
                flash.now[:info] = 'There are following centers in this area.' if @center.present? 
        end
            render partial: 'welcome/middle_layer'
     end  


    def set_names
        @centers = Center.all
        @centers.each do |center|
        

        end 
    end   
    
end
