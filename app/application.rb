class Application 
    @@items = [Item.new("Royal 1s", 325.75), Item.new("OVO Hoodie", 255)]

    def call(env)
        resp = Rack::Response.new 
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last 
            if item = @@items.find{|i| i.name == item_name}
                resp.write item.price 
            else 
                resp.status = 400 
                resp.write "Item not found"
            end 
        else 
            resp.status = 404
            resp.write "Route not found"
        end 
        resp.finish
    end 

end 