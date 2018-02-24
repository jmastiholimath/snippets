class SnippetDatatable < AjaxDatatablesRails::Base
def_delegator :@view, :link_to
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      description: {source: "Snippet.description", cond: :like, searchable: true, orderable: true },
      private: {source: "Snippet.private", cond: :like, searchable: true, orderable: true },
     
    }
  end



  def data
    records.map do |record|
      {
        description: record.private? ? link_to(record.description_short, "/snippets/#{record.id}?data=#{UrlStore.encode(record.id)}") :  link_to(record.description_short, record),
        private: record.private,
      
      }
    end
  end

  private

  def get_raw_records
    Snippet.all
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
