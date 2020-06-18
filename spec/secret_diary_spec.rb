require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do
  context "when locked" do
    it "refuses to be read" do
      diary = SecretDiary.new("Today...")
      expect(diary.read).to eq('Go away!')
    end

    it "refuses to be written" do
      diary = SecretDiary.new("Dear Diary,")
      expect(diary.write("Dear Diary,")).to eq ('Go away!')
    end
  end

  context "when unlocked" do
    let(:diary) {double :fake_diary, :read => 'Access granted', :write => 'Access granted'}
    it "gets read" do
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq('Access granted')
    end

    it "gets written" do
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.write("hello")).to eq('Access granted')
    end
  end
end
