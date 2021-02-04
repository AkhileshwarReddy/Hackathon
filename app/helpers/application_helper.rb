module ApplicationHelper
  def page_entries_info(collection, options = {})
    entry_name = options[:entry_name] || (if collection.empty?
                                            'item'
                                          else
                                            collection.first.class.name.split('::').last.titleize
                                          end)
    if collection.total_pages < 2
      case collection.size
      when 0
        "No #{entry_name.pluralize} found"
      else
        "Displaying all #{entry_name.pluralize}"
      end
    else
      format(%(Displaying %d - %d of %d #{entry_name.pluralize.capitalize}), collection.offset + 1,
             collection.offset + collection.length, collection.total_entries)
    end
  end
end
