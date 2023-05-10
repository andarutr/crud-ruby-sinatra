require "sinatra"
require "./models/biodata"

set :views, "templates"
set :public_folder, "static"

get '/' do
    @biodata = Biodata.select()

    erb :index
end

get '/create' do 
    erb :create 
end

post '/store' do 
    id = ''
    nama = params['nama']
    umur = params['umur']
    hobi = params['hobi']
    
    # Membuat objek dari kelas model
    biodata = Biodata.new(id, nama, umur, hobi)

    # Menambah data
    biodata.add()

    # Redirect ke Home
    redirect('/')
end

get '/update/:id' do
    # Mendapatkan data berdasarkan parameter id
    @biodata = Biodata.get(params[:id])

    erb :edit
end

post '/update/:id' do
    biodata = Biodata.get(params[:id])

    biodata.nama = params['nama']
    biodata.umur = params['umur']
    biodata.hobi = params['hobi']

    biodata.edit()

    redirect('/')
end

get '/delete/:id' do 
    biodata = Biodata.get(params[:id])

    biodata.delete()

    redirect('/')
end