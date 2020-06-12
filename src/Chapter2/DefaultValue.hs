module Chapter2.DefaultValue where 

--Url to connect to
--Connection type: TCP or UDP
--Connection speed
--Whether to use a proxy 
--Whether to use caching
--Whether to use keep-alive
--Time-out lapse

data ConnType = TCP | UDP
data UseProxy = NoProxy | Proxy String 
data TimeOut = NoTimeOut | TimeOutInteger

-- data Connection = ... --Definition omitted

-- -- connect :: String
--         -> ConnType
--         -> Integer 
--         -> UseProxy 
--         -> Bool 
--         -> Bool 
--         -> TimeOut
--         -> Connection