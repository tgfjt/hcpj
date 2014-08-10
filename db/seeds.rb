Request.delete_all
[
    {id: 1, request_ja: "詳細スケジュール確認", request_en: ""},
    {id: 2, request_ja: "写真のリクエスト", request_en: ""},
    {id: 3, request_ja: "自己紹介ビデオのリクエスト", request_en: ""},
    {id: 4, request_ja: "アクションビデオのリクエスト", request_en: ""},
    {id: 5, request_ja: "出演依頼", request_en: ""},
    {id: 6, request_ja: "オーディション参加依頼", request_en: ""},
    {id: 7, request_ja: "その他", request_en: ""},
].each do |request_attri|
  Request.create request_attri
end

