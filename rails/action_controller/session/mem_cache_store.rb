#
# Facebook uses characters in session_id that initially is disabled by
# default rails. This will allow more characters in the session_id key.
#
class Session
        class MemCacheStore
                def check_id(id) #:nodoc:#
                        /[^0-9a-zA-Z-\._]+/ =~ id.to_s ? false : true
                end
        end
end

STDERR.puts "**  Loaded ActionController::Session::MemCacheStore extensions."
