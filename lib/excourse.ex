defmodule Excourse do
    @api_key Application.get_env(:excourse, :api_key)
    @api_username Application.get_env(:excourse, :api_username)
    @discourse_url Application.get_env(:excourse, :discourse_url)

    ## Admin
     def get_admin() do
        url = "#{@discourse_url}/admin/dashboard.json?api_key=#{@api_key}&api_username=#{@api_username}"
        
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get(url)

        body
     end

    ## Latest

    def get_latest() do
        url = "#{@discourse_url}/latest.json?api_key=#{@api_key}&api_username=#{@api_username}"
        
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get(url)                

        body
    end

    ## Post

    def create_post(topic_id, raw) do
        url = "#{@discourse_url}/posts?api_key=#{@api_key}&api_username=#{@api_username}"

        HTTPoison.post url, {:form, [{"topic_id", topic_id}, {"raw", raw}]}                                                                                                                    
    end

    def get_post(post_id) do
        url = "#{@discourse_url}/posts/#{post_id}.json?api_key=#{@api_key}&api_username=#{@api_username}"
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get(url)                

        body 
    end

    def wikify_post(post_id) do
        url = "#{@discourse_url}/posts/#{post_id}/wiki?api_key=#{@api_key}&api_username=#{@api_username}"

        HTTPoison.put url, {:form, [{"wiki", true}]}
    end

    def edit_post(post_id, raw) do
        url = "#{@discourse_url}/posts/#{post_id}?api_key=#{@api_key}&api_username=#{@api_username}"        
        
        HTTPoison.put url, {:form, [{"post[raw]", raw}]}          
    end    

    def delete_post(post_id) do
        url = "#{@discourse_url}/posts/#{post_id}?api_key=#{@api_key}&api_username=#{@api_username}"

        HTTPoison.delete url
    end

    ## Topics

    def create_topic(title, raw, category \\ "") do
        url = "#{@discourse_url}/posts?api_key=#{@api_key}&api_username=#{@api_username}"

        HTTPoison.post url, {:form, [{"title", title}, {"raw", raw}, {"category", category}]}
    end

    def rename_topic(topic_id, title) do
        url = "#{@discourse_url}/t/#{topic_id}.json?api_key=#{@api_key}&api_username=#{@api_username}"

        HTTPoison.put url, {:form, [{"topic_id", topic_id}, {"title", title}]}
    end

    def delete_topic(topic_id) do
        url = "#{@discourse_url}/t/#{topic_id}.json?api_key=#{@api_key}&api_username=#{@api_username}"

        HTTPoison.delete url
    end

    def get_topic_posts(topic_id) do
         url = "#{@discourse_url}/t/#{topic_id}/posts.json?api_key=#{@api_key}&api_username=#{@api_username}"

         {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get(url)

         body
    end
end
