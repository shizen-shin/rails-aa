ActiveAdmin.register Client do

  permit_params :client_name

  # 一覧ページ
  index do
    selectable_column
    id_column
    column "クライアント名", :client_name
    column "プロジェクト数", sortable: :client_name do |client|
      client.projects.count
    end
    column "作成日", :created_at
    column "更新日", :updated_at
    actions
  end

  # 詳細ページ
  show do |client|
    attributes_table do
      row "クライアント名" do
        client.client_name
      end
      row "作成日" do
        client.created_at
      end
      row "更新日" do
        client.updated_at
      end
    end

    panel "関連プロジェクト一覧" do
      table_for client.projects do
        column "プロジェクト名", :pj_name
        column "金額", :price
        column "受注日", :order_date
      end
    end
    active_admin_comments
  end

end