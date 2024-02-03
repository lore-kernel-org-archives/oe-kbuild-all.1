Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4EC5DF11
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 14:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706969534; cv=none; b=oijpUT6tOdhqQTucpCPzJb5VFtIgtWUeEswocvGGx/NQbq8yOLX7jFjrZ4E/YPfcakr/ran+6sSIBrWX4y2ss4qUsOW97JYWCQZlAmG6R/jiXDYz6qis+DiJxXJQCFwWY70vPboD7q49rZ2i5coScDbTAHNa0Uk2SLVA/ZERChs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706969534; c=relaxed/simple;
	bh=K6PIwbjh4qCkXg3M6RFX76XMXlLA7KONXTmXirazj7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jbrprb+mp+dRkZqENYlPdDt3EI+wpGyRCNpOiXu3mSRtk7m9htVgLrLBLDqJ067R47qH69tmd5A9MzJyL72lP33LBUWwZMbwyBQ18iNsjD24DFzNTcXIKjT0KysTL3O4rCvuNRvCZWbxlYIE/lZ8ac1bYlCFVEo/6u6ARZGMPLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY2AtRUE; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY2AtRUE"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso2935588a12.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 03 Feb 2024 06:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706969532; x=1707574332; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eEFO3XuvJC4aDvU2xQvLPxI9i4t2fxYN9VTwe5rBqvQ=;
        b=BY2AtRUERlBD4oQM1ADTa69cYXtQNiBIiaMHuMUsQ3n5z4KX9uusmJVNZvPio4ebKU
         afP+izwbYT4bkmgwm5F2oLUM5UdKKKX0Nbut1sCQOJVjLGWjRZ1uUg3Mob/XFG0yf1Mz
         StW4EqHbyFObUI0bTbYe9QirjkoalgN2k5GvY9g3YkzhpXu4AXt9Jwts+7hD+EN6LDMh
         pyADTDr1zYY1IDiBMv2mCDYSrOOHR5AHMX9XUsWmJLaHxv6E20psUBYJJPvua4SsUlJb
         pBDEWOa7XfJEvjk223Y03XShHg79x0+BSqieLDTbUV0VLuzyZyV8ab0ybgwr7px3U+pM
         hEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706969532; x=1707574332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEFO3XuvJC4aDvU2xQvLPxI9i4t2fxYN9VTwe5rBqvQ=;
        b=EeIw9jk/BXb/0MtZfVIbypQjMAoZEqdb0l2MDtvn+We4wxWYJOllt3FKr2hN0W8bfE
         Oy1/aQETjMMoEBpQnZ7LYgKbz76aFyX8HmzUywQLusBTYGNp/JI2LaIfZGnxw+N6jQQG
         WgCU/oniTInDyLVslHKQ29iJd3iwDYHDCP+1VSEhqB4+G/DuW/MNR0kLftMKtZik7ANP
         j6awjmwEi3Tsv4/q6jUIbsmF1VlmpDrGYKKCu4iEN9A7YxUVPpGf7uHQNjtYbZ/w7TVx
         HiLDodRAthUTLgDBg/r1F6j+eQrdL3lGNQP+1CPNA9BsJ+15y7uPCFqmd1flyXYv/Up5
         BWug==
X-Gm-Message-State: AOJu0Yyw+mxlPZA9YcPzLD9jqiRORwNHMwZf5YISl5Pv5am63OLwAZ3E
	XOLIb7eUk3ND5w4vojDr4gSSByHxVi+KqJ90kylhYsQVvtsLG9vl
X-Google-Smtp-Source: AGHT+IFipV2DF3+kBNA/FWTzlHT4xHjQLxGNLpjvzfmfB06xJy2CeFOqtI5wYQzZ/S0YL8HtNBRZDw==
X-Received: by 2002:a05:6a00:14d2:b0:6dd:8853:ada8 with SMTP id w18-20020a056a0014d200b006dd8853ada8mr15277877pfu.26.1706969532103;
        Sat, 03 Feb 2024 06:12:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWv/p7HZbYli1IVqDc89RuadLlRZe/Hap/YH0W280tmDns5yhzhkp18Vc+juYxB/+4eMAmegLrAqPVCFwwytof2cBdMN3qhdzRglP8GchDHlJ6yt4YVwojWz3CXiOXpdNqh5FnpDcy5oBaS30ftuELlvy5wC/IpbifGqo35LVpjMkmwyETXyu6CFh91gXfQjbDoZg==
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e13-20020a056a001a8d00b006db9604bf8csm3427693pfv.131.2024.02.03.06.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 06:12:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ffd297c3-4ac7-45e5-bf76-8f4e4e9e603c@roeck-us.net>
Date: Sat, 3 Feb 2024 06:12:09 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [groeck-staging:hwmon-next 13/34]
 drivers/hwmon/surface_fan.c:22:9: warning: no previous prototype for
 'surface_fan_hwmon_is_visible'
Content-Language: en-US
To: Ivor Wanders <ivor@iwanders.net>, lkp@intel.com
Cc: W_Armin@gmx.de, linux-hwmon@vger.kernel.org, luzmaximilian@gmail.com,
 oe-kbuild-all@lists.linux.dev
References: <202402031253.JPVKEF5X-lkp@intel.com>
 <20240203125217.4702-1-ivor@iwanders.net>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240203125217.4702-1-ivor@iwanders.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/24 04:52, Ivor Wanders wrote:
>>>> drivers/hwmon/surface_fan.c:22:9: warning: no previous prototype for 'surface_fan_hwmon_is_visible' [-Wmissing-prototypes]
>>       22 | umode_t surface_fan_hwmon_is_visible(const void *drvdata,
> 
> I tried reproducing this, but I think this issue is already fixed in the
> most recent hwmon-next?
> The function should've been marked `static`. It wasn't in the original v5
> patch, but the current commit in the tree (216d66aa89f9fc882) already marks
> the function static, resolving the issue.
> 

Yes, I already fixed this up.

Guenter


