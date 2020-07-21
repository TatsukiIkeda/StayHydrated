//
//  CityList.swift
//  Stay hydrated
//
//  Created by Tatsuki Ikeda on 2020/07/19.
//  Copyright © 2020 tatsuki.ikeda. All rights reserved.
//

import Foundation

class CityList {
    
    var list = [CityModel]()
    
    init() {
        list.append(CityModel(cityCode: "011000", cityName: "北海道-稚内"))//道北
        list.append(CityModel(cityCode: "012010", cityName: "旭川"))
        list.append(CityModel(cityCode: "013010", cityName: "網走"))//道東
        list.append(CityModel(cityCode: "013020", cityName: "北見"))
        list.append(CityModel(cityCode: "014030", cityName: "帯広"))
        list.append(CityModel(cityCode: "015010", cityName: "室蘭"))//道南
        list.append(CityModel(cityCode: "015020", cityName: "浦河"))
        list.append(CityModel(cityCode: "016010", cityName: "札幌"))//道央
        list.append(CityModel(cityCode: "016020", cityName: "岩見沢"))
        list.append(CityModel(cityCode: "017010", cityName: "函館"))//道南
        list.append(CityModel(cityCode: "017020", cityName: "江差"))
        list.append(CityModel(cityCode: "020010", cityName: "青森県-青森"))//青森県
        list.append(CityModel(cityCode: "020020", cityName: "むつ"))
        list.append(CityModel(cityCode: "020030", cityName: "八戸"))
        list.append(CityModel(cityCode: "030010", cityName: "岩手県-盛岡"))//岩手県
        list.append(CityModel(cityCode: "030020", cityName: "宮古"))
        list.append(CityModel(cityCode: "030030", cityName: "大船渡"))
        list.append(CityModel(cityCode: "040010", cityName: "宮城県-仙台"))//宮城県
        list.append(CityModel(cityCode: "040020", cityName: "白石"))
        list.append(CityModel(cityCode: "050010", cityName: "秋田県-秋田"))//秋田県
        list.append(CityModel(cityCode: "050020", cityName: "横手"))
        list.append(CityModel(cityCode: "060010", cityName: "山形県-山形"))//山形県
        list.append(CityModel(cityCode: "060020", cityName: "米沢"))
        list.append(CityModel(cityCode: "060040", cityName: "新庄"))
        list.append(CityModel(cityCode: "070010", cityName: "福島県-福島"))//福島県
        list.append(CityModel(cityCode: "070020", cityName: "小名浜"))
        list.append(CityModel(cityCode: "080010", cityName: "茨城県-水戸"))//茨城県
        list.append(CityModel(cityCode: "080020", cityName: "土浦"))
        list.append(CityModel(cityCode: "090010", cityName: "栃木県宇都宮"))//栃木県
        list.append(CityModel(cityCode: "090020", cityName: "大田原"))
        list.append(CityModel(cityCode: "100010", cityName: "群馬県-前橋"))//群馬県
        list.append(CityModel(cityCode: "100020", cityName: "みなかみ"))
        list.append(CityModel(cityCode: "110010", cityName: "埼玉県さいたま"))//埼玉県
        list.append(CityModel(cityCode: "110020", cityName: "熊谷"))
        list.append(CityModel(cityCode: "110030", cityName: "秩父"))
        list.append(CityModel(cityCode: "120010", cityName: "千葉県-千葉"))//千葉県
        list.append(CityModel(cityCode: "120020", cityName: "銚子"))
        list.append(CityModel(cityCode: "120030", cityName: "館山"))
        list.append(CityModel(cityCode: "130010", cityName: "東京都-東京"))//東京都
        list.append(CityModel(cityCode: "130020", cityName: "大島"))
        list.append(CityModel(cityCode: "130030", cityName: "八丈島"))
        list.append(CityModel(cityCode: "130040", cityName: "父島"))
        list.append(CityModel(cityCode: "140010", cityName: "神奈川県-横浜"))//神奈川県
        list.append(CityModel(cityCode: "140020", cityName: "小田原"))
        list.append(CityModel(cityCode: "150010", cityName: "新潟県-新潟"))//新潟県
        list.append(CityModel(cityCode: "150030", cityName: "高田"))
        list.append(CityModel(cityCode: "160010", cityName: "富山県-富山"))//富山県
        list.append(CityModel(cityCode: "160020", cityName: "伏木"))
        list.append(CityModel(cityCode: "170010", cityName: "石川県-金沢"))//石川県
        list.append(CityModel(cityCode: "170020", cityName: "輪島"))
        list.append(CityModel(cityCode: "180010", cityName: "福井県-福井"))//福井県
        list.append(CityModel(cityCode: "180020", cityName: "敦賀"))
        list.append(CityModel(cityCode: "190010", cityName: "山梨県-甲府"))//山梨県
        list.append(CityModel(cityCode: "190020", cityName: "河口湖"))
        list.append(CityModel(cityCode: "200010", cityName: "長野県-長野"))//長野県
        list.append(CityModel(cityCode: "200030", cityName: "飯田"))
        list.append(CityModel(cityCode: "210010", cityName: "岐阜県-岐阜"))//岐阜県
        list.append(CityModel(cityCode: "210020", cityName: "高山"))
        list.append(CityModel(cityCode: "220010", cityName: "静岡県-静岡"))//静岡県
        list.append(CityModel(cityCode: "220030", cityName: "三島"))
        list.append(CityModel(cityCode: "220040", cityName: "浜松"))
        list.append(CityModel(cityCode: "230010", cityName: "愛知県-名古屋"))//愛知県
        list.append(CityModel(cityCode: "230020", cityName: "豊橋"))
        list.append(CityModel(cityCode: "240010", cityName: "三重県-津"))//三重県
        list.append(CityModel(cityCode: "240020", cityName: "尾鷲"))
        list.append(CityModel(cityCode: "250010", cityName: "滋賀県-大津"))//滋賀県
        list.append(CityModel(cityCode: "250020", cityName: "彦根"))
        list.append(CityModel(cityCode: "260010", cityName: "京都府-京都"))//京都府
        list.append(CityModel(cityCode: "260020", cityName: "舞鶴"))
        list.append(CityModel(cityCode: "270000", cityName: "大阪府-大阪"))//大阪府
        list.append(CityModel(cityCode: "280010", cityName: "兵庫県-神戸"))//兵庫県
        list.append(CityModel(cityCode: "280020", cityName: "豊岡"))
        list.append(CityModel(cityCode: "290010", cityName: "奈良県-奈良"))//奈良県
        list.append(CityModel(cityCode: "290020", cityName: "風屋"))
        list.append(CityModel(cityCode: "300010", cityName: "和歌山県-和歌山"))//和歌山県
        list.append(CityModel(cityCode: "300020", cityName: "潮岬"))
        list.append(CityModel(cityCode: "310010", cityName: "鳥取県-鳥取"))//鳥取県
        list.append(CityModel(cityCode: "310020", cityName: "米子"))
        list.append(CityModel(cityCode: "320010", cityName: "島根県-松江"))//島根県
        list.append(CityModel(cityCode: "320020", cityName: "浜田"))
        list.append(CityModel(cityCode: "320030", cityName: "西郷"))
        list.append(CityModel(cityCode: "330010", cityName: "岡山県-岡山"))//岡山県
        list.append(CityModel(cityCode: "330020", cityName: "津山"))
        list.append(CityModel(cityCode: "340010", cityName: "広島県-広島"))//広島県
        list.append(CityModel(cityCode: "340020", cityName: "庄原"))
        list.append(CityModel(cityCode: "350010", cityName: "山口県-下関"))//山口県
        list.append(CityModel(cityCode: "350020", cityName: "山口"))
        list.append(CityModel(cityCode: "350030", cityName: "柳井"))
        list.append(CityModel(cityCode: "350040", cityName: "萩"))
        list.append(CityModel(cityCode: "360010", cityName: "徳島県-徳島"))//徳島県
        list.append(CityModel(cityCode: "360020", cityName: "日和佐"))
        list.append(CityModel(cityCode: "370000", cityName: "香川県-高松"))//香川県
        list.append(CityModel(cityCode: "380010", cityName: "愛媛県-松山"))//愛媛県
        list.append(CityModel(cityCode: "380020", cityName: "新居浜"))
        list.append(CityModel(cityCode: "380030", cityName: "宇和島"))
        list.append(CityModel(cityCode: "390010", cityName: "高知県-高知"))//高知県
        list.append(CityModel(cityCode: "390020", cityName: "室戸岬"))
        list.append(CityModel(cityCode: "390030", cityName: "清水"))
        list.append(CityModel(cityCode: "400010", cityName: "福岡県-福岡"))//福岡県
        list.append(CityModel(cityCode: "400020", cityName: "八幡"))
        list.append(CityModel(cityCode: "400030", cityName: "飯塚"))
        list.append(CityModel(cityCode: "400040", cityName: "久留米"))
        list.append(CityModel(cityCode: "410010", cityName: "佐賀県-佐賀"))//佐賀県
        list.append(CityModel(cityCode: "410020", cityName: "伊万里"))
        list.append(CityModel(cityCode: "420010", cityName: "長崎県-長崎"))//長崎県
        list.append(CityModel(cityCode: "420020", cityName: "佐世保"))
        list.append(CityModel(cityCode: "420030", cityName: "厳原"))
        list.append(CityModel(cityCode: "420040", cityName: "福江"))
        list.append(CityModel(cityCode: "440010", cityName: "大分県-大分"))//大分県
        list.append(CityModel(cityCode: "440020", cityName: "中津"))
        list.append(CityModel(cityCode: "440030", cityName: "日田"))
        list.append(CityModel(cityCode: "440040", cityName: "佐伯"))
        list.append(CityModel(cityCode: "430010", cityName: "熊本県-熊本"))//熊本県
        list.append(CityModel(cityCode: "430020", cityName: "阿蘇乙姫"))
        list.append(CityModel(cityCode: "430030", cityName: "牛深"))
        list.append(CityModel(cityCode: "430040", cityName: "人吉"))
        list.append(CityModel(cityCode: "450010", cityName: "宮崎県-宮崎"))//宮崎県
        list.append(CityModel(cityCode: "450020", cityName: "延岡"))
        list.append(CityModel(cityCode: "450030", cityName: "都城"))
        list.append(CityModel(cityCode: "450040", cityName: "高千穂"))
        list.append(CityModel(cityCode: "460010", cityName: "鹿児島県-鹿児島"))//鹿児島県
        list.append(CityModel(cityCode: "460020", cityName: "鹿屋"))
        list.append(CityModel(cityCode: "460030", cityName: "種子島"))
        list.append(CityModel(cityCode: "460040", cityName: "名瀬"))
        list.append(CityModel(cityCode: "471010", cityName: "沖縄県-那覇"))//沖縄県
        list.append(CityModel(cityCode: "471020", cityName: "名護"))
        list.append(CityModel(cityCode: "471030", cityName: "久米島"))
        list.append(CityModel(cityCode: "472000", cityName: "南大東"))
        list.append(CityModel(cityCode: "473000", cityName: "宮古島"))
        list.append(CityModel(cityCode: "474010", cityName: "石垣島"))
        list.append(CityModel(cityCode: "474020", cityName: "与那国島"))

        
    }
}
