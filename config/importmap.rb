# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
pin "tui-calendar", to: "https://ga.jspm.io/npm:tui-calendar@1.15.3/dist/tui-calendar.js"
pin "tui-code-snippet", to: "https://ga.jspm.io/npm:tui-code-snippet@1.5.2/dist/tui-code-snippet.js"
pin "tui-date-picker", to: "https://ga.jspm.io/npm:tui-date-picker@4.3.3/dist/tui-date-picker.js"
pin "tui-time-picker", to: "https://ga.jspm.io/npm:tui-time-picker@2.1.6/dist/tui-time-picker.js"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.4-2/lib/assets/compiled/rails-ujs.js"
pin "slim-select", to: "https://ga.jspm.io/npm:slim-select@1.27.1/dist/slimselect.min.mjs"
