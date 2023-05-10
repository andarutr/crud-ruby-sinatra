require "mysql2"

$client = Mysql2::Client.new(
    :host => '127.0.0.1',
    :username => 'root',
    :password => '',
    :database => 'rubydb'
)

class Biodata
    def initialize(id='', nama='', umur='', hobi='')
        @id = id
        @nama = nama
        @umur = umur
        @hobi = hobi
    end

    # Setter
    def id=(id)
        @id = id
    end

    def nama=(nama)
        @nama = nama
    end

    def umur=(umur)
        @umur = umur
    end

    def hobi=(hobi)
        @hobi = hobi
    end

    # Getter
    def id()
        return @id
    end

    def nama()
        return @nama
    end

    def umur()
        return @umur
    end

    def hobi()
        return @hobi
    end

    # Metode statis
    # Select Data
    def self.select()
        sql = "SELECT * FROM biodata"
        result = $client.query(sql)
        return result
    end

    # Store Data
    def add()
        sql = "INSERT INTO biodata VALUES('','#{@nama}','#{@umur}','#{@hobi}')"
        $client.query(sql)
    end
    
    # Select by id
    def self.get(id)
        sql = "SELECT * FROM biodata WHERE id='#{id}'"
        result = $client.query(sql)

        result.each() do |row|
            id = row['id']
            nama = row['nama']
            umur = row['umur']
            hobi = row['hobi']

            return Biodata.new(id,nama,umur,hobi)
        end
    end

    # Update Data
    def edit()
        sql = "UPDATE biodata SET nama='#{@nama}', umur='#{@umur}', hobi='#{@hobi}' WHERE id='#{@id}'"
        $client.query(sql)
    end

    # Delete Data
    def delete()
        sql = "DELETE FROM biodata WHERE id = '#{@id}'"
        $client.query(sql)
    end
end