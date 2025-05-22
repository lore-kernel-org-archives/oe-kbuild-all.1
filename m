Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A824149C6F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 09:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747906617; cv=none; b=l4/LoeW1JQGTcfI0OptML6BAwbysdkABWoGsmAxVNNLt8NTdLrdf9tCO0gjKeMKXtxf3fy/4unQhK1glp5XBY6dss2aTro0MsKDmK4Te0D3//rH+WuAHP5qSFIsWgG0lYsWiQZms+vP+QgOh9lIzzbmGC/X4ssu+XTd6OBoR0ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747906617; c=relaxed/simple;
	bh=jby8RYHrYFnGjogk4ajcjl7VAWfMLIUjNIcmyK3dq2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKfxOC2pbXduIPBAb5GRGqrOqDI9ht6XLaz8e+RzSA4I45L2PWRbXZWW+NCrPqvui5SUe4KMBBdNfdjpnYCWCqS234+brn7gy0Ji658+L4g7JiJgAyx6ILe5eZEv+P+DKqyMPchxOr741JYlyfSrO8AcWvxfXPr/+Fx1ghbHuBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T7eb4vZc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T7eb4vZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747906614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDHCSn2rrDn0eR68mmoruWEApHPw0SjaUXgvWHvFihE=;
	b=T7eb4vZcLV3dwd67hUszTi/MveE/mU4wRS2pRfwul1OXKqex+i4dsYeWNKNxBCifFG8Ij5
	OYI1930fS+bOo7hizAuTPCTXp1Ewhd0SPGCToHY/98IbzLRrq16/AG/JLpiK+RSaxw9RUs
	gQzwI1QYrs6/nAvi+5dpvKVhmXS+VFM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-vkLzSSUdN16N1r5no6_Nuw-1; Thu, 22 May 2025 05:36:50 -0400
X-MC-Unique: vkLzSSUdN16N1r5no6_Nuw-1
X-Mimecast-MFC-AGG-ID: vkLzSSUdN16N1r5no6_Nuw_1747906610
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad5271a051eso673406066b.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 02:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747906609; x=1748511409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDHCSn2rrDn0eR68mmoruWEApHPw0SjaUXgvWHvFihE=;
        b=woSxX+Ld63aIw/C4v01DoitqakXC0SkFTYWaqXnHQ2g+eAzxUocIKSanEHsb0wKW8Y
         qvshD/OiS7GivQd7qkZFICaYx/7Odsq8uo60smB4AWCkT8Yvn++8C8Lk+2x2ym5YeQTV
         Mvo+BVrIfZtPI4aXQvD1/KYUI+nRJfuLQ23acdYTer+QZvq53lsVO/Dy/noLHIvn+7bO
         GU8TnL9lv5RjoKmI4nETrER4HlyVHeecoO9MGCRFXzIDvE8SAFpN4lqyZz/X2qe046f9
         F6x40x1/KNxNZVymgipFc+e7E0icg/KFC737gt6TNPp26ccvHxKNgU08ilwhHJep80LP
         iO8g==
X-Forwarded-Encrypted: i=1; AJvYcCXYYVExI6b8TS/Yc5oPEh4agFaXyMdtCk1ARblXEZ+88crsNLfO9Zbi/mJ1T6EbdNkZZtm1l+GTm7Bb+TPq@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4DAf05tQ4zzaT++VEcXqS7n0P5S1FueZ1xflUQIsi9eXjfyYH
	HVTY3msDdra4RFXevcDr2iVdu6aeRz+71Raq8jlxf2+FS+7Yn78uAKJmBxM9wWu5oaRj6yCCG+f
	TVssPLN75pSYu4B22nfolrnWrnKDqIT7XqqocNfChMm4qZZk2sifwV+fb8DqMadmB4Uc=
X-Gm-Gg: ASbGnctA89RZElUnmaqhN4ZplqRP5ifMcbaq6NelJJAREyeRVrziLguLoAkNsd3XcFI
	4BD6I+cl+NzFHw5qxo/aD1NsJt6MBHKIl8wwKBlG8T15MqiwBZ6eWwjYpXDiUUG9TMyI5TlFrzy
	9qCxTyNY+qS0mDH2T5u+/5s31YQ/kzaaY3n9/y07cS4/9fiTDTbb6VTZupnndhiDpqovt17ZsHL
	9vz6D41TTSAtw869SojZ8aNcYKNXzJoIF+RgxlCcR4cjK4GcWrVCARKTmd7SoQr+0/7mmTSM83Q
	ilWyfB03MHfKPvc+qzvcN54k4jeOGqVXhV/DTUi0U1WvEEhq+gCq5CWlwaw6s3fdcZ/WbwHl9bF
	3DAGq7LEa6Wu8Ld8/dgGFhUmccMZKlq3GaNp+xG9AOG0tWKaV/Xts2hYxotaVGw==
X-Received: by 2002:a17:907:968f:b0:ad2:53fc:a884 with SMTP id a640c23a62f3a-ad52d549101mr2313488866b.29.1747906609564;
        Thu, 22 May 2025 02:36:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkt+cRiEtLvTfug96SnfCVbtLrVD/Hds5wFUbM5/CTbcUBhCNKQ2UGNlRxw27MHgFkES/aOw==
X-Received: by 2002:a17:907:968f:b0:ad2:53fc:a884 with SMTP id a640c23a62f3a-ad52d549101mr2313484666b.29.1747906609060;
        Thu, 22 May 2025 02:36:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ca731sm1034015566b.166.2025.05.22.02.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:36:48 -0700 (PDT)
Message-ID: <f981b9ac-41cc-489a-9f37-c9e87e748c99@redhat.com>
Date: Thu, 22 May 2025 11:36:47 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 109/109]
 drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator
 'charge_types' does not refer to any field in type 'const struct
 power_supply_ext'
To: kernel test robot <lkp@intel.com>,
 Jelle van der Waa <jvanderwaa@redhat.com>, Sebastian Reichel <sre@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>
References: <202505221051.khDhUKJ0-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202505221051.khDhUKJ0-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5tX4Xpx6hwB53EgK0MPavmNNjrfGHP0QkvZ1ebW7BwE_1747906610
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22-May-25 4:39 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
> head:   b2012b38080e2f92d43eca59e8249c174a27527c
> commit: b2012b38080e2f92d43eca59e8249c174a27527c [109/109] platform/x86: ideapad: Expose charge_types
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250522/202505221051.khDhUKJ0-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221051.khDhUKJ0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505221051.khDhUKJ0-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator 'charge_types' does not refer to any field in type 'const struct power_supply_ext'
>     2044 |         .charge_types           = (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>          |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     2045 |                                    BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
>          |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.
> 
> 
> vim +2044 drivers/platform/x86/ideapad-laptop.c

Hmm, this patch depends on:

https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git/commit/?h=for-next&id=c1f7375a246e5f810191a6c3031d2fa2b80e9f5e

I guess that that patch is not in review-ilpo-next,
maybe Sebastian can take this patch instead of taking
it through pdx86-next ?  Or it can be merged after
6.16-rc1 ?

Regards,

Hans






> 
>   2039	
>   2040	static const struct power_supply_ext ideapad_battery_ext = {
>   2041		.name			= "ideapad_laptop",
>   2042		.properties		= ideapad_power_supply_props,
>   2043		.num_properties		= ARRAY_SIZE(ideapad_power_supply_props),
>> 2044		.charge_types		= (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>   2045					   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
>   2046		.get_property		= ideapad_psy_ext_get_prop,
>   2047		.set_property		= ideapad_psy_ext_set_prop,
>   2048		.property_is_writeable	= ideapad_psy_prop_is_writeable,
>   2049	};
>   2050	
> 

