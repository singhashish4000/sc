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
            # d = District.where(state_id: s.id).pluck(:id) if s.present?
            # sd = SubDistrict.where(district_id: d.id).pluck(:id) if d.present?
            # t = TownVillage.where(sub_district_id: sd.id).pluck(:id) if sd.present?
           
            if state_name.blank? 
                @center = Center.where(country_id: c) 
            else
                @center = Center.where(country_id: c,state_id: s)
            end

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
            flash.now[:danger] = 'No center here' if @center.blank?          
        end
            render partial: 'welcome/middle_layer'
     end  


    def set_names
        @centers = Center.all
        @centers.each do |center|
        

        end 
    end   
    
end
