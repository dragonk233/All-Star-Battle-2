    
    --转换256进制整数
	local ids1 = {}
	local ids2 = {}
	
	function _id2(a)
		local s1 = math.floor(a/256/256/256)%256
		local s2 = math.floor(a/256/256)%256
		local s3 = math.floor(a/256)%256
		local s4 = a%256
		local r = string.char(s1, s2, s3, s4)
		ids1[a] = r
		ids2[r] = a
		return r
	end
	function _id(a)
		return ids1[a] or _id2(a)
	end

	id2string = _id
	
	function __id2(a)
		local n1 = string.byte(a, 1) or 0
		local n2 = string.byte(a, 2) or 0
		local n3 = string.byte(a, 3) or 0
		local n4 = string.byte(a, 4) or 0
		local r = n1*256*256*256+n2*256*256+n3*256+n4
		ids2[a] = r
		ids1[r] = a
		return r
	end
	function __id(a)
		return ids2[a] or __id2(a)
	end

	string2id = __id

	string.toid	= __id
    
	--分割字符串
    string.split = function(str, tos)
        local x = 1
        local strl = #str
        local tosl = #tos
        local strs = {}
        for y = 1, strl do
            if str:sub(y, y + tosl - 1) == tos then
                table.insert(strs, str:sub(x, y - 1))
                x = y + tosl
            end
        end
        if strl >= x then
            table.insert(strs, str:sub(x, strl))
        end
        return strs
    end

    --找最大值以及位置
    function math.maxn(...)
	    local ns = {...}
	    local mn, mi
	    for i, n in ipairs(ns) do
		    if not mn or n > mn then
			    mn = n
			    mi = i
		    end
	    end
	    return mn, mi
    end

    --求平均值
    function math.ave(...)
    	local ns = {...}
    	local count = #ns
    	if count == 0 then
	    	return
    	end

    	local m = 0
    	for i = 1, count do
	    	m = m + ns[i]
    	end
    	return m / count
    end

    --求出方差
    function math.dx(...)
	    local ns = {...}
	    local count = #ns
	    if count == 0 then
		    return
	    end
	    
	    local ave = math.ave(...)
	    for i = 1, count do
		    local a = ave - ns[i]
		    ns[i] = a * a
	    end

	    return ns
	    
    end