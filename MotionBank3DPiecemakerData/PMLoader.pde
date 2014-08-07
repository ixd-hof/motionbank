
class PieceMakerLoader {
    
    private String data_path = "";
    private JSONArray videos, data_events, scene_events;
    private JSONObject video, data_event;
    private java.util.Date video_time, data_event_time;
    private String[] data;
    private float fps = 50;
    private String[] scene_names;
    
    PieceMakerLoader ( String datpth ) 
    {
        data_path = datpth;
    }
    
    void load ( String recording )
    {
        videos = loadJSONArray( data_path + File.separator + "piecemaker-json" + File.separator + recording + "-videos.json" );
        for ( int i = 0, k = videos.size(); i < k; i++ ) {
            video = videos.getJSONObject(i);
            if ( video.getJSONObject("fields").getString("title").endsWith("_Center_Small") ) break;
        }
        video_time = stringToDate( video.getString("utc_timestamp") );
        data_events = loadJSONArray( data_path + File.separator + "piecemaker-json" + File.separator + recording + "-data.json" );
        data_event = data_events.getJSONObject(0);
        data_event_time = stringToDate( data_event.getString("utc_timestamp") );
        scene_events = loadJSONArray( data_path + File.separator + "piecemaker-json" + File.separator + recording + "-scenes.json" );
        data = loadData();
    }
    
    private String[] loadData()
    {
        String data_file = data_event.getJSONObject("fields").getString("data_file");
        data_file = data_file.replace(".txt","_com.txt");
        String[] data = loadStrings( data_path + File.separator + "data" + File.separator + data_file );
        return data;
    }
    
    String[] getData()
    {
        return data;
    }
    
    String[] getData ( String scene )
    {
        JSONObject from = null, to = null;
        for ( int i = 0, k = scene_events.size(); i < k; i++ )
        {
            JSONObject o = scene_events.getJSONObject(i);
            if ( o.getJSONObject("fields").getString("title").equals( scene ) ) 
            {
                from = o;
                to = scene_events.getJSONObject(i+1); // save?
                break;
            }
        }
        if ( from != null && to != null )
        {
            java.util.Date from_time = stringToDate( from.getString("utc_timestamp") );
            java.util.Date to_time   = stringToDate( to.getString("utc_timestamp") );
            int msec_duration = (int)(to_time.getTime() - from_time.getTime());
            int msec_from = (int)(from_time.getTime() - data_event_time.getTime());
            int frame_from = (int)((msec_from / 1000.0) * fps);
            int frame_to = (int)(((msec_from+msec_duration) / 1000.0) * fps);
            int frame_len = frame_to-frame_from;
            String[] tmp = new String[frame_len];
            System.arraycopy(data,frame_from,tmp,0,frame_len);
            return tmp;
        } else {
            System.err.println("scene not found: " + scene);
        }
        return data;
    }
    
    String[] getSceneNames ()
    {
        if ( scene_names == null )
        {
            String[] tmp = new String[scene_events.size()];
            for ( int i = 0, k = tmp.length; i < k; i++ )
            {
                tmp[i] = scene_events.getJSONObject(i).getJSONObject("fields").getString("title");
            }
            scene_names = tmp;
        }
        return scene_names;
    }
    
    java.util.Date stringToDate ( String date_str )
    {
        try {
            // http://docs.oracle.com/javase/7/docs/api/java/text/SimpleDateFormat.html
            return new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSX").parse(date_str);
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return null;
    }
}
