#
# Acts as List is great, but the list might not always be ordered in sequel.
# Therefore will lower_item and higher_item sometimes fail even when there exists
# items before or after current item.
# 
# This little patch changes the sql on how to retrieve the lower_item and
# higher_item.
#
module ActiveRecord
        module Acts #:nodoc:
                module List
                        module InstanceMethods
                                def lower_item
                                        return nil unless in_list?
                                        acts_as_list_class.find( :first, 
                                        :conditions => "#{scope_condition} AND #{position_column} > #{(send(position_column)).to_s}",
                                        :limit => 1,
                                        :order => "position ASC"
                                        )
                                end
                                def higher_item
                                        return nil unless in_list?
                                        acts_as_list_class.find( :first, 
                                        :conditions => "#{scope_condition} AND #{position_column} < #{(send(position_column)).to_s}",
                                        :limit => 1,
                                        :order => "position DESC"
                                        )
                                end
                        end
                end
        end
end

STDERR.puts "**  Loaded acts_as_list extensions."
