ActiveAdmin.register Client do

  permit_params :pj_name, :client_name, :status, :order_date, :price, :memo

end