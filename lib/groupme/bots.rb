module GroupMe
  module Bots

    # List the authenticated user's bots.
    #
    # @return [Array<Hashie::Mash>] Array of hashes representing bots.
    # @see http://dev.groupme.com/docs/v3#bots_index
    # @example
    #   client = GroupMe::Client.new
    #   client.bots
    def bots
      get("/bots")
    end
    alias :list_bots :bots

    # Get a single bot.
    #
    # @return [Hashie::Mash] Hash representing the bot.
    # @see http://dev.groupme.com/docs/v3#bots_show
    # @example
    #   client = GroupMe::Client.new
    #   client.bot(32)
    def bot(id)
      get("/bots/#{id}")
    end

    # Create a new bot.
    #
    # @return [Hashie::Mash] Hash representing the bot
    # @see http://dev.groupme.com/docs/v3#bots_create
    # @param name [String] Name for the new bot
    # @param group_id [String] Id of the group
    # @param options [Hash] bot information
    # @option options [String] :avatar_url URL for the bot avatar
    # @option options [String] :callback_url URL to post callbacks
    def create_bot(name, group_id, options={})
      options.merge! :name => name
      options.merge! :group_id => group_id
      data = {
        :bot => options
      }
      post('/bots', data).body.response
    end
    
    # Destroy bot.
    #
    # @return response
    # @see http://dev.groupme.com/docs/v3#bots_destroy
    # @param bot_id [String] Id of the bot
    def destroy_bot(bot_id)
      data = {
        :bot_id => bot_id
      }
      post('/bots/destroy', data)
    end

    # Post a message for a group through the bot
    #
    # @return [Hashie::Mash] Hash representing the message
    # @see http://dev.groupme.com/docs/v3#messages_create
    # @param bot_id [String, Integer] Id of the bot
    # @param text [String] Text of the message
    # @option options [String] :picture_url 
    def bot_post_message(bot_id, text, options={})
      options.merge! :bot_id => bot_id
      options.merge! :text => text
      post('/bots/post', options)
    end

  end
end