$(function () {
    var template = Hogan.compile($('#hoganTemplate').text());
    $('#books').append(template.render(
        {
            books: [
                {id: 1, name: '書籍A'},
                {id: 2, name: '書籍B'},
                {id: 3, name: '書籍C'}
            ]
        }
    ));
});