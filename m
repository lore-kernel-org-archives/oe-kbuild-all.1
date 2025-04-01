Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D26F1E5B9B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 06:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743490208; cv=none; b=AVHPhqP6PXq8Do05ihh+7Kx/pgvhg5FxNiGQyjRbds0ueKPChgeUthZXRCX5B13INZUTccQB1K/bO3i+qoG2WjE3APll4mq/Ftl+44vAHdLKsO7jgVfMeD3KNvWStNYeU2lmsJihlExoIIVTVEle0IAro2HkCTnvW0K75ZrkFcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743490208; c=relaxed/simple;
	bh=fKlV6YhlW6sDz3SPVzbpkG38Q8kOpqtw5rnF+mvK8CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDqAZ6ENBqFr0SBLPDJFJk0ycWQTk8hXnNjnSSQHX8IKQE6fmmNmT3uGkdsaEOEzUNESXez/djxEiHOHCdsRDQMtsF604EvJlQvuEDxHQTVuKt1dnBSXOJFdOOWEJhTwIMSrwYKYN5h5FpkmsY+Cn/+uR2G7iP8O3OAS1o3Jt14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAmwLO4Q; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAmwLO4Q"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22622ddcc35so23911755ad.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 23:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743490206; x=1744095006; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+MWJy9WrHwloxGsNM4C6rXst8ioxlRgZOQcQKHG1l1E=;
        b=mAmwLO4QitOLjKxskUz08Joi4o9vUlGPxcuUtCOD8ZIiA7Bq9/yVVGLdcpkNA8RV08
         afAjOYSv8AvoOehHt6wKBm0Z/ThBHbJ/KWtoYQZ7hy5D6HqWjt24JiqUxMVP8N+D6p4Y
         3o7a/soH/XsChPLcTqZULFnfe5zeNzrNsCWptUzG5aoxUOeBiu0Px+JnNXtM48LgzDTi
         2HCG6dSVF/3XCZUlrEY15nYWaK+TRXxOBXpBMREeJ7fJ5x8Y78UOE6JlTYDbngpInVse
         7Ces5v4wphH4v+QHSFbYvz1YfnzkZiuZXsn0h6CNuT+jABkJ9OI0cWhfohSOrAq+yo5t
         AHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743490206; x=1744095006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MWJy9WrHwloxGsNM4C6rXst8ioxlRgZOQcQKHG1l1E=;
        b=Lu8x4fXJuBQ4Ny/EiLpmbZ45aEPL1fHcZTlGB9X1InR1tcSynpLXOO7cACikLuOWcg
         yFW1Pw1CrHcwn03F3XRPGdArzNcq7y2Ho/Gg9ej6FleHy1/DUzJK3y+JCITaLhvRcZ3m
         oV0XzA0PiGYzRjSXwGDH2rt+dd38ZYKAoERLR/Il6KqouIptCzzMVdMegAaZLZqyYqy4
         EmKRJXL/wdW/YuKcunlT+56Mvp9MvIders/apLtL5YHVuvxltzE4k0FR/H+L5a1q2iEX
         ZQDT3/Wsc7kaRszquh3t0xow7HreMQruO6IfAzkrljSAe6QUcKUczFFki91uApGlzzbc
         8PKg==
X-Gm-Message-State: AOJu0YwHZJoVm869WFaK3pT+qtXObaecKmLnfq4vmrlHb4AWNHQS4OaP
	NkU+PLXJzEsowQCR0bpPzY89gB7SLJ28dXhwf76GQqM9G87gdhYN
X-Gm-Gg: ASbGncu8tmcoZwK044nkQgdRkFkdurR8Zr3wTyfHP7QWrvUaIpCphQBWPcrht62X65x
	z22Zxhd3g53UrgwCLaXN76wFH20Exu1D9e9OLVkYN9Avvd1eghnZMxyXMRaF5e7St23BEsGsFZI
	jQ+S2q4buETDkpv04it4/vYrxpzJ21HIHBEdSTM9D8an46J01gPHHMWjKCenN16jPuQWRa6KiXj
	o8tPLgUVQvvajytD2PiSTVwx0y4W+XnfJwHsvNENTSspR4d3TXEAc0xaxU1Fpury7s8HJ98MGzW
	FKsIeSL259OZOTlW2qoehcr37RBI63qNrJDWEv/a6H01bFK1e/pbAeSqatlVMlPINh/FutCuaYt
	7VA9IFMY=
X-Google-Smtp-Source: AGHT+IHw1uhwE8arVM/5I3CN5LvG+WYbNqAev85cnd5hx3M9Cc2yBphlVxgZ11CKva6bVTWTSekdRA==
X-Received: by 2002:a17:903:32c8:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-2292f95d206mr161362105ad.20.1743490206040;
        Mon, 31 Mar 2025 23:50:06 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c44:e4e:6e69:d5cb:5b5a:ea6? ([2401:4900:1c44:e4e:6e69:d5cb:5b5a:ea6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec71cfsm80851265ad.45.2025.03.31.23.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 23:50:05 -0700 (PDT)
Message-ID: <60edb843-fcdd-4973-ae64-9df69b2480bd@gmail.com>
Date: Tue, 1 Apr 2025 12:19:51 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 13940/14141]
 arch/openrisc/include/asm/spr.h:16:27: error: impossible constraint in 'asm'
To: Stafford Horne <shorne@gmail.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202503311807.BZaUHY5L-lkp@intel.com> <Z-qiyls8IyEjj7xT@antec>
Content-Language: en-US
From: Sahil Siddiq <icegambit91@gmail.com>
Autocrypt: addr=icegambit91@gmail.com; keydata=
 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
 rPgMe6IIvn24UuW2f6fIt0AaqOWq
In-Reply-To: <Z-qiyls8IyEjj7xT@antec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stafford,

On 3/31/25 7:42 PM, Stafford Horne wrote:
> On Mon, Mar 31, 2025 at 07:05:53PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   405e2241def89c88f008dcb899eb5b6d4be8b43c
>> commit: c5c6fd8be51207f0abd3e5a6ed4fd5220b0bdecd [13940/14141] openrisc: Introduce new utility functions to flush and invalidate caches
>> config: openrisc-randconfig-r062-20250331 (https://download.01.org/0day-ci/archive/20250331/202503311807.BZaUHY5L-lkp@intel.com/config)
>> compiler: or1k-linux-gcc (GCC) 13.3.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503311807.BZaUHY5L-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202503311807.BZaUHY5L-lkp@intel.com/
>>
>> All error/warnings (new ones prefixed by >>):
>>
>>     In file included from arch/openrisc/mm/cache.c:13:
>>     In function 'cache_loop',
>>         inlined from 'cache_loop_page' at arch/openrisc/mm/cache.c:51:2:
>>>> arch/openrisc/include/asm/spr.h:16:27: warning: 'asm' operand 0 probably does not match constraints
>>        16 | #define mtspr(_spr, _val) __asm__ __volatile__ (                \
>>           |                           ^~~~~~~
>>     arch/openrisc/mm/cache.c:38:17: note: in expansion of macro 'mtspr'
>>        38 |                 mtspr(reg, paddr);
>>           |                 ^~~~~
>>>> arch/openrisc/include/asm/spr.h:16:27: error: impossible constraint in 'asm'
>>        16 | #define mtspr(_spr, _val) __asm__ __volatile__ (                \
>>           |                           ^~~~~~~
>>     arch/openrisc/mm/cache.c:38:17: note: in expansion of macro 'mtspr'
>>        38 |                 mtspr(reg, paddr);
>>           |                 ^~~~~
> 
> Hi Suhil,
> 
> This is due to reg being defined as usigned int in the new cache functions.  It
> should used short as the SPR_* regs are limited to 16-bit addresses.
> 
> Could you fix this and resend?  I tried to recreate this with gcc 14.2.0 and
> make W=1 but didn't manage to get the same error.  So pleae check if you can
> reproduce too and fix any other warnings there may be.
> 

Thank you for the report. I'll check this out.

Thanks,
Sahil
