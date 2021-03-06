var Search = {
    timer : null,

    init : function() {
        document.querySelector('input[name=keyword]').focus();
    },

    roster : function(key) {
        var selector_clear = '#search > #roster > li.found';
        var subheader = document.querySelector('#search > #roster > li.subheader');

        document.querySelectorAll(selector_clear)
            .forEach(item => item.classList.remove('found'));

        if (key == '') return;

        var founds = document.querySelectorAll(
            '#search > #roster > li[name*="' + MovimUtils.cleanupId(key).slice(3) + '"]'
        )

        if (founds.length > 0) {
            subheader.classList.add('found');
            founds.forEach(item => item.classList.add('found'));
        } else if (subheader) {
            subheader.classList.remove('found');
        }
    },

    searchSomething : function(value) {
        clearTimeout(Search.timer);

        if (value !== '') {
            document.querySelector('#searchbar span.primary i').innerText = 'autorenew';
            document.querySelector('#searchbar span.primary').classList.add('spin');
        }

        Search.timer = setTimeout(() => {
            Search_ajaxSearch(value);
        },
        700);

        Search.roster(value);
    },

    searchClear : function() {
        document.querySelector('#searchbar span.primary i').innerText = 'search';
        document.querySelector('#searchbar span.primary').classList.remove('spin');
    }
}

document.addEventListener('keydown', function(e) {
    if (e.keyCode == 77 && e.ctrlKey) {
        e.preventDefault();
        Search_ajaxRequest();
    }
});
