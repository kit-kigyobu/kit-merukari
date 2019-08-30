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

  #select_tagのオプション用
  def get_select_course()
    select_course = Hash.new
    courses = Course.all
    courses.each do |course|
      select_course.store(course.name,course.course_id)
    end

    return select_course
  end

  #select_tagのオプション用
  def get_select_category()
    select_category = Hash.new
    categorys = Category.all
    categorys.each do |category|
      select_category.store(category.name, category.category_id)
    end
    return select_category
  end

  #select_tagのオプション用(検索時の空白「-1」あり)
  def get_select_category_with_blank()
    select_category = Hash.new
    categorys = Category.all
    select_category.store("", -1)
    categorys.each do |category|
      select_category.store(category.name, category.category_id)
    end
    return select_category
  end

  def get_order_selection()
    select_category = Hash.new
    select_category.store("", -1)
    select_category.store("出品が新しい順","new")
    select_category.store("出品が古い順","old")
    select_category.store("値段が安い順","price_low")
    select_category.store("値段が高い順","price_high")
    select_category.store("出品者の「いいね」が多い順","love")
    return select_category
  end

  private

  # privateメソッド

end
