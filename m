Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC4B1F0E26
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Jun 2025 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954085; cv=none; b=TGYHuf7+JohmtRok/EPobqI09sHaEiN1JTaEyoSmNFaWb4huKmDfJux9EPSfTCnJNh4SQpYawkJ5zIoZf8lIzOwnEQnuLJadlgwqAVrz84AK4g8czHJhrR6qZl88ehkF8u1tivnstZ9kBlGOmGHm8ztIzAmND7LlAze6KqY7ON4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954085; c=relaxed/simple;
	bh=DL1+7UVbskqPFhRV6b0q2N497hB08uiGR/oEXMO/TPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDvI1oXt08SSNj/wqjullYm96qdnWAHHkwuPMffwgebsJH2SeaVPOgowDXo/CGZ4tstNRz2AXbboq6ts6FfqzMO+i3FcIGSdcIW7kFN4VvVOM+beUxpVXZ9E0T8FZaGUUKZ5gPzvqPPZmJ/qhOq0E6B8LKS2pwWxM3U31TEnWeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GSit/sVs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GSit/sVs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750954082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YSTlLrRvzvAOIWUxrO2JXP3DUL1U9Mqsfv2lboVwIGc=;
	b=GSit/sVs5ZScD30stAq7o6TfokMoBcNApjWkrwzODeMY+fC+oisRz9yomHWeaEjmdAqzmY
	Lrzezynv6kwyjod2tgGjH7dMjyK6BKEdE8HWHlgMOk13RZnUurzZ9Se0AfWDY5SzIXgatN
	JN4tzvlJ+cvBpYorwAg9Prpr2kouQnw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-Bb9AKzJKN7etj7mU8EoyIQ-1; Thu, 26 Jun 2025 12:08:00 -0400
X-MC-Unique: Bb9AKzJKN7etj7mU8EoyIQ-1
X-Mimecast-MFC-AGG-ID: Bb9AKzJKN7etj7mU8EoyIQ_1750954080
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450df53d461so9103265e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Jun 2025 09:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750954079; x=1751558879;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSTlLrRvzvAOIWUxrO2JXP3DUL1U9Mqsfv2lboVwIGc=;
        b=q9nUHvkzrnZhKeSUIqCnfeQHRD6nSDJIk9IF9ZtZ6BHEwrTiBobYgFyL/85ca1mh7l
         3PAMr+g1IoMOwE9aGaP8ZWH53a/ECHGI8+Wafx3cols2dqzMbm2gIlZjUo+vfJAE49YS
         hB0kqb6s3j3SvSf/1gzOsjs1nMqzxZVWOYwY3fYyXo4zaLhYkO9D4aw71e7E880DBH7L
         GTyseCXtsuS9zDKmImewpNJ8ZoFFazVul1rSAoQh9DQsZ0mu97+ZPRou9nXIlZOtsAuH
         VrxCuT3s7Sh1+VS8AtjDRSM5mHPBYnmLRKvCSg21fNgr+aa1G+57T3UXfZ8yDddw5f2A
         AFVg==
X-Gm-Message-State: AOJu0Yyf+jA0jJeXL7cGGVrIlLStC4IJYH0+uHN+RLmyGW50j/ezNoYs
	fB85zx3HB9jgRM0KkSxPyDSUShgM+Ftn4B1sV+wMcJ2PYGrRqu+DTd9WAfZyf5U9PqQyubf7hfV
	RJCfceKNkRUfGnFKNh3hTQEQ6hBwBmmCp06FN1pOgraLwyuKhWZ8JYhzJtonCu2YWmKo=
X-Gm-Gg: ASbGncv+Y7/XbpT4xUwE9Bx/+PN+Q3D7Yz+lbVRnzITGhEH/G5yXUmpKGsTyvet5GcW
	T+5XRnEzsaTBF8HYuQZecLqAdMmVwq5GRjfKzjNpAZguGBq0nQZ3jXCWn3uI1FOH3v7+NEic1dG
	AFBKusp8XMcvhSQ0KEqOq408vYIE2FNaf7wAn6O4syYpbXGH0YEFkZn49zHbjS0QGQgkX4bv3r+
	Ps2Qz+C0833ShAYza3DznSsw5Ih5E8DZgzaAPqUGZKI9VSq6GPUTfLnku+NlgVNKGbnc/2eJL0U
	xRfmegsVcJpWi0bV3ly7WdmMjC/WnXD8gPL6yGDF5qONEha40SspqY/IyNr6MgXyTy05jORYQKP
	3lQDLvlnjbjd1djvG4ykYHTQdb+7/IZtqFGuX/LpepfLHHPKf5A==
X-Received: by 2002:a05:600c:1c25:b0:442:f8e7:25ef with SMTP id 5b1f17b1804b1-45383371376mr65946775e9.11.1750954079459;
        Thu, 26 Jun 2025 09:07:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxor3ZyuP2Fyxk2enFkk+sN5zEU6hflkXZjWJ9tq2NutyFdhtVPnXF8ko3iRw2XjNY9vmlUw==
X-Received: by 2002:a05:600c:1c25:b0:442:f8e7:25ef with SMTP id 5b1f17b1804b1-45383371376mr65946085e9.11.1750954078852;
        Thu, 26 Jun 2025 09:07:58 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:2f00:8afc:23fe:3813:776c? (p200300d82f3c2f008afc23fe3813776c.dip0.t-ipconnect.de. [2003:d8:2f3c:2f00:8afc:23fe:3813:776c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e595d1sm262161f8f.71.2025.06.26.09.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 09:07:58 -0700 (PDT)
Message-ID: <7a3e8d56-72fc-4ca1-905b-a7d54cea1132@redhat.com>
Date: Thu, 26 Jun 2025 18:07:57 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [davidhildenbrand:migration 19/29] mm/migrate.c:74: undefined
 reference to `zsmalloc_mops'
To: Zi Yan <ziy@nvidia.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202506262314.sLjaWWCY-lkp@intel.com>
 <6B5E3CA4-CC1B-4F96-8A45-0695D7477914@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6B5E3CA4-CC1B-4F96-8A45-0695D7477914@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XPWIkjTe0v2zRQrawQZM0c9CBRiw9K_dcqttb3Z6jKk_1750954080
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.06.25 17:50, Zi Yan wrote:
> On 26 Jun 2025, at 11:39, kernel test robot wrote:
> 
>> tree:   https://github.com/davidhildenbrand/linux migration
>> head:   2119af6765ea1ce921ab4e6dba8ee4e651e42a59
>> commit: d9cf33cabf3b3027973522362e9198273c7abffd [19/29] mm: stop storing migration_ops in page->mapping
>> config: i386-randconfig-141-20250508 (https://download.01.org/0day-ci/archive/20250626/202506262314.sLjaWWCY-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506262314.sLjaWWCY-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202506262314.sLjaWWCY-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     ld: mm/migrate.o: in function `page_movable_ops':
>>>> mm/migrate.c:74: undefined reference to `zsmalloc_mops'
>>
>>
>> vim +74 mm/migrate.c
>>
>>      55	
>>      56	static const struct movable_operations *page_movable_ops(struct page *page)
>>      57	{
>>      58		VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
>>      59	
>>      60		/*
>>      61		 * If we enable page migration for a page of a certain type by marking
>>      62		 * it as movable, the page type must be sticky until the page gets freed
>>      63		 * back to the buddy.
>>      64		 */
>>      65	#ifdef CONFIG_BALLOON_COMPACTION
>>      66		if (PageOffline(page))
>>      67			/* Only balloon compaction sets PageOffline pages movable. */
>>      68			return &balloon_mops;
>>      69	#endif /* CONFIG_BALLOON_COMPACTION */
>>      70	#ifdef CONFIG_ZSMALLOC
>>      71		if (PageZsmalloc(page))
>>      72			return &zsmalloc_mops;
>>      73	#endif /* CONFIG_ZSMALLOC */
>>    > 74		return NULL;
>>      75	}
>>      76	
> 
> Apparently, CONFIG_ZSMALLOC does not depend on CONFIG_COMPACTION.
> 
> This should fix it:
> 
>  From 6eeb27030931cf8dc24dac2d7d16f57853a162d6 Mon Sep 17 00:00:00 2001
> From: Zi Yan <ziy@nvidia.com>
> Date: Thu, 26 Jun 2025 11:48:39 -0400
> Subject: [PATCH] zsmalloc_mops is only available with CONFIG_ZSMALLOC &&
>   CONFIG_COMPACTION
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>   mm/migrate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index f87a998b696e..f7366bfaeb32 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -67,10 +67,10 @@ static const struct movable_operations *page_movable_ops(struct page *page)
>   		/* Only balloon compaction sets PageOffline pages movable. */
>   		return &balloon_mops;
>   #endif /* CONFIG_BALLOON_COMPACTION */
> -#ifdef CONFIG_ZSMALLOC
> +#if defined(CONFIG_ZSMALLOC) && defined(CONFIG_COMPACTION)
>   	if (PageZsmalloc(page))
>   		return &zsmalloc_mops;
> -#endif /* CONFIG_ZSMALLOC */
> +#endif /* CONFIG_ZSMALLOC && CONFIG_COMPACTION */
>   	return NULL;

Ah yes, makes sense. Thanks!

-- 
Cheers,

David / dhildenb

