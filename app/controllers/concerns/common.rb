module Common
  extend ActiveSupport::Concern
  require "date"

  included do
    # ここにcallback等
  end

  # メソッド
  def categories
    ArticleCategory.order(:id).all
  end

  def get_today()
    today = Date.today
    return today
  end

  def entry_year_to_great(entry_year)
    select_entry_year = get_select_entry_year()
    ans = '学部1回生'
    select_entry_year.each do |select|
      if select[1] == entry_year then
        ans = select[0]
        break
      end
    end
    return ans
  end

  def get_select_entry_year()
    today = Date.today
    nowyear = (today.month<=3)?(today.year-1):(today.year)
    select_entry_year = [
      ['学部1回生',nowyear],['学部2回生',nowyear-1],['学部3回生',nowyear-2],['学部4回生',nowyear-3],
      ['修士1回生',nowyear-4],['修士2回生',nowyear-5],['博士以上',nowyear-6],
    ]
    return select_entry_year
  end

  def get_select_course()
    select_course = Hash.new
    courses = Course.all
    courses.each do |course|
      select_course.store(course.name,course.course_id)
    end

    return select_course
  end

  private

  # privateメソッド

end