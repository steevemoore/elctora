

local function networkListener( event )
    if ( event.isError ) then
        print( "Network error: ", event.response )

    elseif ( event.phase == "began" ) then
        if ( event.bytesEstimated <= 0 ) then
            print( "Download starting, size unknown" )
        else
            print( "Download starting, estimated size: " .. event.bytesEstimated )
        end

    elseif ( event.phase == "progress" ) then
        if ( event.bytesEstimated <= 0 ) then
            print( "Download progress: " .. event.bytesTransferred )
        else
            print( "Download progress: " .. event.bytesTransferred .. " of estimated: " .. event.bytesEstimated )
        end
        
    elseif ( event.phase == "ended" ) then
        print( "Download complete, total bytes transferred: " .. event.bytesTransferred )
    end
end
 
local params = {}

-- Tell network.request() that we want the "began" and "progress" events:
params.progress = "download"

-- Tell network.request() that we want the output to go to a file:
params.response = {

      filename = "StudentID.txt",

    baseDirectory = system.DocumentsDirectory
}




network.request( "https://download1474.mediafire.com/j539cbvwzbpg/3vqxmyxvxh7h780/StudentID.txt", "GET", networkListener,  params )