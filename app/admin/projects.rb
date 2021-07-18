ActiveAdmin.register Project do

  permit_params :client_id, :pj_name, :price, :order_date

  form do |f|
    f.inputs do
      f.input :client, label: "クライアント名"
      f.input :pj_name, label: "プロジェクト名"
      f.input :price, label:"金額"
      f.input :order_date, label:"受注日",  as: :datepicker,
                datepicker_options: {min_date: "2021-4-1", max_date: "+3M"}
    end
    f.actions

    panel '注意点' do
      "受注日は3ヶ月以内で選択してください。"
    end
  end

end
