<todoitem>

    <div class="view">

        <input
            class="toggle"
            type="checkbox"
            checked={ opts.todo.completed }
            onclick={ toggleTodo }>

        <label ondblclick={ editTodo }>{ opts.todo.title }</label>

        <button class="destroy" onclick={ removeTodo }></button>
    </div>

    <input
        name="todoeditbox"
        class="edit"
        type="text"
        onblur={ doneEdit }
        onkeyup={ editKeyUp }>

    <script>

        var ENTER_KEY = 13;
        var ESC_KEY = 27;

        var self = this;

        opts.todo.editing = false;

        toggleTodo() {
            opts.todo.completed = !opts.todo.completed;
            opts.parentview.saveTodos();
            return true;
        };

        editTodo() {
            opts.todo.editing = true;
            self.todoeditbox.value = opts.todo.title;
        };

        removeTodo() {
            opts.parentview.removeTodo(opts.todo);
        };

        doneEdit() {
            if (!opts.todo.editing) {
                return;
            }
            opts.todo.editing = false;
            var enteredText = self.todoeditbox.value && self.todoeditbox.value.trim();
            if (enteredText) {
                opts.todo.title = enteredText;
                opts.parentview.saveTodos();
            } else {
                self.removeTodo();
            }
        };

        editKeyUp(e) {
            if (e.which === ENTER_KEY) {
                self.doneEdit();
            } else if (e.which === ESC_KEY) {
                self.todoeditbox.value = opts.todo.title;
                self.doneEdit();
            }
        };

        self.on('update', function() {
            if (opts.todo.editing) {
                opts.parentview.update();
                self.todoeditbox.focus();
            }
        });

    </script>
</todoitem>
