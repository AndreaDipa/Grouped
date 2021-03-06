class ConversationsController < ApplicationController
    def index
        @conversations = current_user.mailbox.conversations
        
    end
    def show
        
        @conversation = current_user.mailbox.conversations.find(params[:id])
        @conversation.mark_as_read(current_user)
    end
    def new
        @recipient = User.find(params[:user_id])
    end
    def create
        recipient = User.find(params[:user_id])
        receipt = current_user.send_message(recipient, params[:body], params[:subject])
        redirect_to conversation_path(receipt.conversation)

    end
    def destroy
        conversation = current_user.mailbox.conversations.find(params[:id])
        conversation.destroy
        redirect_to conversations_path
    end
end