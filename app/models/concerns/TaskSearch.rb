class TaskSearch
  attr_reader :title, :Date

  def initialize(search_query)
    @search_query = search_query
  end

  def scope
    tasks = Task.all
    if date_search?
      tasks = tasks.where('DATE(time_start) = ?', parsed_date)
    else
      tasks = tasks.where('title ILIKE ?', "%#{@search_query}%")
    end
    tasks
  end

  private

  def date_search?
    parsed_date.present?
  end

  def parsed_date
    Date.parse(@search_query) rescue nil
  end
end
