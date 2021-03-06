// http://takemaru-hirai.github.io/japan-map/
$(function () {
    var areas = [
        { code: 1, name: '北海道地方', color: '#7f7eda', hoverColor: '#b3b2ee', prefectures: [1] },
        { code: 2, name: '東北地方', color: '#759ef4', hoverColor: '#98b9ff', prefectures: [2, 3, 4, 5, 6, 7] },
        { code: 3, name: '関東地方', color: '#7ecfea', hoverColor: '#b7e5f4', prefectures: [8, 9, 10, 11, 12, 13, 14] },
        { code: 4, name: '中部地方', color: '#7cdc92', hoverColor: '#aceebb', prefectures: [15, 16, 17, 18, 19, 20, 21, 22, 23] },
        { code: 5, name: '近畿地方', color: '#ffe966', hoverColor: '#fff19c', prefectures: [24, 25, 26, 27, 28, 29, 30] },
        { code: 6, name: '中国地方', color: '#ffcc66', hoverColor: '#ffe0a3', prefectures: [31, 32, 33, 34, 35] },
        { code: 7, name: '四国地方', color: '#fb9466', hoverColor: '#ffbb9c', prefectures: [36, 37, 38, 39] },
        { code: 8, name: '九州地方', color: '#ff9999', hoverColor: '#ffbdbd', prefectures: [40, 41, 42, 43, 44, 45, 46] },
        { code: 9, name: '沖縄地方', color: '#eb98ff', hoverColor: '#f5c9ff', prefectures: [47] },
    ];

    $('#map-container').japanMap({
        width: 1000,
        selection: 'prefecture',
        areas: areas,
        backgroundColor: '#f2fcff',
        borderLineColor: '#f2fcff',
        borderLineWidth: 1.0,
        lineColor: '#a0a0a0',
        lineWidth: 1,
        drawsBoxLine: true,
        showsPrefectureName: true,
        prefectureNameType: 'short',
        movesIslands: true,
        fontColor: '#000000',
        fontSize: 11,
        onSelect: function (data) {
            // リダイレクトをする場合は `window.location` を使う
            alert(data.name);
        }
    });
});