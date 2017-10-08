defmodule MerkleTeaTest do
  use ExUnit.Case
  doctest MerkleTea

  @nid "nid123"

  @ncfg "some node configuration"

  @content_in_array ["other file content", "more content"]

  test "should match the given hash with more than two elements" do
    content = [@nid] ++ [@ncfg] ++ @content_in_array
    assert MerkleTea.build(content) == "A50E92614798668D8E360E52406217C12AE7495273EBE156E5F634B6B138852F"
  end

  test "should match the given hash with two elements" do
    content = [@nid] ++ [@ncfg]
    assert MerkleTea.build(content) == "DBD6267FF0904047D604BD161657EE1125C145FD1B7D4F5D1BCA4816D8A5ADB1"
  end

  test "should match the given hash with one element" do
    content = [@nid]
    assert MerkleTea.build(content) == "0CED78B4612F2AA6AF85B686C94CA4D3A65F245CFE8A602E38AA0DB8D354B09F"
  end
end
