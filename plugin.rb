# name: notebook
# version: 0.2.0

enabled_site_setting :notebook_enabled

register_asset 'stylesheets/notebook.scss'

load File.expand_path('../app/note_store.rb', __FILE__)

after_initialize do
    load File.expand_path('../app/controllers/notebook_controller.rb', __FILE__)
    load File.expand_path('../app/controllers/notes_controller.rb', __FILE__)

    Discourse::Application.routes.append do
        # Map the path `/notebook` to `NotebookController`’s `index` method
        get '/notebook' => 'notebook#index'

        get '/notes' => 'notes#index'
        put '/notes/:note_id' => 'notes#update'
        delete '/notes/:note_id' => 'notes#destroy'
    end
end