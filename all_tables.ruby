rails generate model Country  name:string

rails generate model State name:string country:references

rails generate model District name:string state:references

rails generate model SubDistrict name:string district:references

rails generate model town-village  sub_district:references

