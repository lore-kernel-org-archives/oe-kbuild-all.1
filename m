Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9299326ACD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 16:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721666081; cv=none; b=CCFiNiDWft/oofGYHeFNnZw73Wh5Pm6iyaahp0AzMOP3oqkexwI5RVfbmcRvtnUCNvsL1Op1sNTFHlNm0aKs1k1zVaJmXDRF3BMMA7ZgJBFoz0tJPdFlIvzsv9u5fmkgfnWPcYLt7SUSZfuT8ISQ8r5H8bzdYrd7XzjjhFFKh2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721666081; c=relaxed/simple;
	bh=ORvjTZVCF9j9K2/vk8qoyPbvmvm6veJVeNPI1Fl7gRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFm2sCL3CFvPpZ6bAT0nGTcoCLbqmML/XHG+ACGJ81sutPy/QGqIqiBwyADJ9LHYVhtjxOjQy3gSLZ3wCl2uK+IoATkysxzSJ+wxX+G5V++KbIW9AQclZebygV5Z67fIlYD0dNwN82cHUWFBEmHzB/ZC3zTWzOsHujDhr91I3j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C4sQeV79; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C4sQeV79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721666078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSNEaNP8H5/eGVQlrv1O3IQGVc24IW6Ik8uTzGK8y9g=;
	b=C4sQeV79JeaBTJdoaZg/+uvuoQ+wd68XY79y/J1IX3HEr6bR31KA2KHYRQULLMSPeh5Zhg
	aEDtEVTUoVNs+QX7NKR5+qvXLrCPTioLM0c0JV3V5F1OLcWICHi9+loqs668+k06z5ngO1
	ypUpPNdUwgXw17npqSv/y77doYgn8PE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-TqwqtuapNS-g1RR-57t2Eg-1; Mon, 22 Jul 2024 12:34:34 -0400
X-MC-Unique: TqwqtuapNS-g1RR-57t2Eg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-427e9c2f82cso9092395e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 09:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721666073; x=1722270873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSNEaNP8H5/eGVQlrv1O3IQGVc24IW6Ik8uTzGK8y9g=;
        b=uiZX9sYn2xuVZBGibDNVSd+bp5OnrRpSyqnq87gRxMgctf6FfYYMMC+y1faxxDHroI
         CwuRIYSO/04RR9lDPh7AX0LW7YrPjVnPD0l8Rmye7i1yVhQjCUVUgfz9wngHympxkomr
         C1LXbfR0M+PoBSYZKM3Kbv/Txr2shCJVmiqYY6gZ7OtiuZBqk2ZMCcSqmvhcUcCzwyBI
         J1eZ9xzP0zn/FimvRdCDzhG/NtkUBzAHz6EVDJ6KN4VCVm7YLa7X9HgNlsHDn/Y/keE4
         AxQa8vTHfaDMb7Hpg/r9Uqm56KGy7KpoOOojlXfT/e4fxAqs4d4FAhvu8LTNz0/GGczj
         ZqiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkAHGtBs+1d3q6vFpfTXUn1k1xuD6qoCTv8hgGkRXw+h2f/7MTC80H+jnRkxwwMUFGjR0NNZcWBAOlWYXek/FnDBXL7Jil1fugB1BqFA==
X-Gm-Message-State: AOJu0Yxic3OBNYyb5iJ1iVUSJ0o61KdwGttk+IorDSXJsHk5oQ/Dyeee
	UTyWEqecZocfyKfF2MpoIQFiBjoV9/+Sg08DSO0rGIUOgmhLrRso7MG+qmXaAiCX3gqcpXu/Sj3
	Gx/dui19qaKDdF0enJJhwACpBEZA5rii02HN8Zc+gZGuZ2xrTf//9z6xKRWejsfM=
X-Received: by 2002:a05:600c:4f0c:b0:426:5f8f:51a4 with SMTP id 5b1f17b1804b1-427daa2815cmr43742995e9.12.1721666073744;
        Mon, 22 Jul 2024 09:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+OrtOq9aqUKQAvqLUlUdGwmwjBvw3l7GhLZRB22QgBwpQRPohFHgOIA2Kt7hUWTLziSUvXQ==
X-Received: by 2002:a05:600c:4f0c:b0:426:5f8f:51a4 with SMTP id 5b1f17b1804b1-427daa2815cmr43742815e9.12.1721666073319;
        Mon, 22 Jul 2024 09:34:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6? ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6900caasm132996285e9.11.2024.07.22.09.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 09:34:32 -0700 (PDT)
Message-ID: <db3609fb-9ebc-42b2-a080-26462a8a491f@redhat.com>
Date: Mon, 22 Jul 2024 18:34:31 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: Use oops_in_progress instead of panic_cpu
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: lkp@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
References: <202407210203.2ISiIC9m-lkp@intel.com>
 <20240722114800.174558-1-jfalempe@redhat.com>
 <Zp5pl4kcu9q6FWTP@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Zp5pl4kcu9q6FWTP@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/07/2024 16:15, Daniel Vetter wrote:
> On Mon, Jul 22, 2024 at 01:47:51PM +0200, Jocelyn Falempe wrote:
>> Panic_cpu is not exported, so it can't be used if fbcon is used as
>> a module. Use oops_in_progress in this case, but non-fatal oops won't
>> be printed.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202407210203.2ISiIC9m-lkp@intel.com/
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Yeah it's not great but gets the job done.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I pushed it to drm-misc-next.

Thanks a lot.

> 
> Cheers, Sima
> 
>> ---
>>   drivers/video/fbdev/core/fbcon.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>> index 498d9c07df80..2e093535884b 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -64,6 +64,8 @@
>>   #include <linux/console.h>
>>   #include <linux/string.h>
>>   #include <linux/kd.h>
>> +#include <linux/panic.h>
>> +#include <linux/printk.h>
>>   #include <linux/slab.h>
>>   #include <linux/fb.h>
>>   #include <linux/fbcon.h>
>> @@ -272,7 +274,14 @@ static int fbcon_get_rotate(struct fb_info *info)
>>   
>>   static bool fbcon_skip_panic(struct fb_info *info)
>>   {
>> +/* panic_cpu is not exported, and can't be used if built as module. Use
>> + * oops_in_progress instead, but non-fatal oops won't be printed.
>> + */
>> +#if defined(MODULE)
>> +	return (info->skip_panic && unlikely(oops_in_progress));
>> +#else
>>   	return (info->skip_panic && unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID));
>> +#endif
>>   }
>>   
>>   static inline int fbcon_is_inactive(struct vc_data *vc, struct fb_info *info)
>>
>> base-commit: 7e33fc2ff6754b5ff39b11297f713cd0841d9962
>> -- 
>> 2.45.2
>>
> 

