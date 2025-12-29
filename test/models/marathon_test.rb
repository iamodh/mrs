require "test_helper"

class MarathonTest < ActiveSupport::TestCase
  def setup
    @marathon = Marathon.new(
      name: "정상 대회",
      entry_start: 1.day.ago,
      entry_end: 1.day.from_now
    )
  end

  test "모든 필수 값이 정상이면 유효하다" do
    assert @marathon.valid?
  end


  test "접수 종료일이 시작일보다 빠르면 오류가 발생한다" do
    @marathon.entry_end = @marathon.entry_start - 1.day

    assert_not @marathon.valid?
    assert_includes @marathon.errors[:entry_end], "must be after the entry start date"
  end

  test "이름이 빈 경우 오류가 발생한다" do
    @marathon.name = ""

    assert_not @marathon.valid?
    assert_includes @marathon.errors[:name], "can't be blank"
  end

  test "이름이 30글자 이상인 경우 오류가 발생한다" do
    @marathon.name = "A" * 31

    assert_not @marathon.valid?
    assert_includes @marathon.errors[:name], "length must be 1 ~ 30"
  end

  test "접수 기간 이전에는 접수가 불가능하다" do
    @marathon.entry_start = 1.second.from_now
    assert_not @marathon.open?
  end

  test "접수 기간이 지났으면 접수가 불가능하다" do
    @marathon.entry_end = 1.second.ago
    assert_not @marathon.open?
  end

  test "접수 기간 내에는 접수가 가능하다" do
    assert @marathon.open?
  end
end
