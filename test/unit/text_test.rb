require 'test_helper'

class TextTest < ActiveSupport::TestCase
  test "it removes vowels" do
    text = Text.create! text: 'hello world', alteration: 'Disemvowel'
    assert_equal 'hll wrld', text.text
  end

  test "it munges text" do
    text = Text.create! text: 'hello world', alteration: 'Munge'
    assert_not_equal 'hello world', text.text
    assert_match(/h[el]{3}o w[orl]{3}d/, text.text)
  end

  test "it ciphers like Ceaser" do
    text = Text.create! text: 'hello world', alteration: 'ROT 13'
    assert_equal 'uryyb jbeyq', text.text
  end

  test "it pukes if you pass in an invalid alteration" do
    text = Text.create! text: 'hello world', alteration: 'INVALID!'
    assert_equal 'INVALID!', text.text
  end
end
