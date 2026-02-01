module DocumentsHelper
  def status_badge_class(status)
    case status
    when 'draft'
      'bg-yellow-100 text-yellow-800'
    when 'reviewed'
      'bg-blue-100 text-blue-800'
    when 'finalized'
      'bg-green-100 text-green-800'
    else
      'bg-gray-100 text-gray-800'
    end
  end
end
