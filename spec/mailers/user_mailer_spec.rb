require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:my_user) { create(:user) }

  context "account and password activations" do
    describe "account_activation" do
      #let(:my_user) { create(:user) }
      #my_user[:activation_token] = User.new_token
      let(:mail) { UserMailer.account_activation(my_user) }

      it "renders the headers" do
        my_user.activate

        expect(mail.subject).to eq("Account activation")
        expect(mail.to).to eq([my_user.email])
        expect(mail.from).to eq(["noreply@example.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("Hi")
      end
    end

    describe "password_reset" do
      #let(:my_user) { create(:user) }
      #my_user[:reset_token] = User.new_token
      let(:mail) { UserMailer.password_reset(my_user) }

      it "renders the headers" do
        my_user.activate
        my_user.reset_token = User.new_token
        
        expect(mail.subject).to eq("Password reset")
        expect(mail.to).to eq([my_user.email])
        expect(mail.from).to eq(["noreply@example.com"])
        #expect(mail.body.encoded).to match(my_user.reset_token)
      end

      it "renders the body" do
        expect(mail.body.encoded).to match(user.reset_token)
      end
    end
  end

end
