'use strict';

var STORAGE_KEY = 'todos-riotjs';

window.todoStorage = {

    fetch: function () {

        return JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]');
    },

    save: function (todos) {

        localStorage.setItem(STORAGE_KEY, JSON.stringify(todos));
    }
};

riot.mount('todo', { data: todoStorage.fetch() });
