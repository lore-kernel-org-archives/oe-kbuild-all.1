Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D0BAD35
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MBZT5XSq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699261634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yHOwZ84eosAnblomCfmiYl8BzfE9IUpG4fgAjsr09gE=;
	b=MBZT5XSq2fntlMLqVmOJ87si4T7jzOSZcE0q7AT47kuh8+DETw9Ypx4uJDc/zP9T8L6HG6
	0MGvN5dfLHhaj6dXvrF5bYf9IGoHlEOhKT+fdtzC6oJWTeCJ3byphU/APRznE+VNzMwLGQ
	1A6tW2CQ+bcVzAp12UetcGDDOgiatAk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-k2zG2olHOomPXhG_U9LJcw-1; Mon, 06 Nov 2023 04:07:13 -0500
X-MC-Unique: k2zG2olHOomPXhG_U9LJcw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-32da7983d20so2533867f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Nov 2023 01:07:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699261632; x=1699866432;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHOwZ84eosAnblomCfmiYl8BzfE9IUpG4fgAjsr09gE=;
        b=fjZ2l7ERxgLKam+cKnAwJKc+YNbfDGxNjElGlWV1Jc6LzkMD3K7AvFMGbEw9Ro/t4f
         cC8UwNmiog6JFXBVXtaqEdHpnsXmeGehHmcqu+ac5H+lhTcxVkAl0oYcN63WmF5ydeiE
         qgiQSGMqkQpcDIdkVt8nRm6PQJFCXPxlkmnZqVDwXE7M4FWJhvcylQuanW7cQls7lM/w
         4WW4Mpijpoc927+YZhStAi/4hF68N6A02RLw8XNp0Ey61sb6ZGbww+EM93rz+LGGNyuO
         cwny6DlO6fQStbZ6n3qGHMMvQs2V+LDggn0kVcBFAhy7ul8/wYinAkSUnPYNctW9sWTL
         umhw==
X-Gm-Message-State: AOJu0YxSTq1BAJR2qc76KsTSeskoWlO2P3HXOjzqjynDWiQPmY5qn/fw
	MLZynmRv/E00pRA6KJ4w/MXo6dprjUcehjrMVYuHGFpnqznc8wYOCjEJgGzS4LVcnL5uIzjHrSY
	mY7+DDVLQ0HcidHRcdUoOX0ajDQ==
X-Received: by 2002:a05:6000:400e:b0:32d:d4c5:272b with SMTP id cp14-20020a056000400e00b0032dd4c5272bmr14592373wrb.26.1699261631851;
        Mon, 06 Nov 2023 01:07:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHU3OUb0SbCyECfd1choR3h7p/iM3KmfPGzwdTLct+dYOAPlQYQ1IQyJDnSO+YS1IKlrs3B+A==
X-Received: by 2002:a05:6000:400e:b0:32d:d4c5:272b with SMTP id cp14-20020a056000400e00b0032dd4c5272bmr14592339wrb.26.1699261631427;
        Mon, 06 Nov 2023 01:07:11 -0800 (PST)
Received: from ?IPV6:2003:cb:c723:8300:17ef:a8f2:1ed1:81e6? (p200300cbc723830017efa8f21ed181e6.dip0.t-ipconnect.de. [2003:cb:c723:8300:17ef:a8f2:1ed1:81e6])
        by smtp.gmail.com with ESMTPSA id r7-20020adff107000000b0032db8f7f378sm8929587wro.71.2023.11.06.01.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 01:07:11 -0800 (PST)
Message-ID: <10b4327b-003e-42f5-83f5-ab3f94cdb5aa@redhat.com>
Date: Mon, 6 Nov 2023 10:07:10 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [davidhildenbrand:rmap_id 9/19] include/linux/build_bug.h:78:41:
 error: static assertion failed: "offsetof(struct folio, _flags_4) ==
 offsetof(struct page, flags) + 4 * sizeof(struct page)"
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202311061023.jLdPBgDV-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <202311061023.jLdPBgDV-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.11.23 04:13, kernel test robot wrote:
> tree:   https://github.com/davidhildenbrand/linux rmap_id
> head:   b13b5da47e6cc2abf6253b7e6436fdc2b363103f
> commit: 901bb76320b7528db5ded8e9d007eab34a4affb6 [9/19] mm/rmap_id: track MMs that map a partially-mappable folio using rmap IDs
> config: x86_64-randconfig-013-20231106 (https://download.01.org/0day-ci/archive/20231106/202311061023.jLdPBgDV-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061023.jLdPBgDV-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311061023.jLdPBgDV-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from include/linux/bits.h:21:0,
>                      from include/linux/bitops.h:6,
>                      from include/linux/log2.h:12,
>                      from arch/x86/include/asm/div64.h:8,
>                      from include/linux/math.h:6,
>                      from include/linux/math64.h:6,
>                      from include/linux/time.h:6,
>                      from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:11,
>                      from arch/x86/entry/vdso/vdso32/vclock_gettime.c:4:
>>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct folio, _flags_4) == offsetof(struct page, flags) + 4 * sizeof(struct page)"
>      #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                              ^
>     include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>      #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                       ^~~~~~~~~~~~~~~
>     include/linux/mm_types.h:448:2: note: in expansion of macro 'static_assert'
>       static_assert(offsetof(struct folio, fl) ==   \
>       ^~~~~~~~~~~~~
>     include/linux/mm_types.h:450:1: note: in expansion of macro 'FOLIO_MATCH'
>      FOLIO_MATCH(flags, _flags_4);
>      ^~~~~~~~~~~
>>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct folio, _head_4) == offsetof(struct page, compound_head) + 4 * sizeof(struct page)"
>      #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                              ^
>     include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>      #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                       ^~~~~~~~~~~~~~~
>     include/linux/mm_types.h:448:2: note: in expansion of macro 'static_assert'
>       static_assert(offsetof(struct folio, fl) ==   \
>       ^~~~~~~~~~~~~
>     include/linux/mm_types.h:451:1: note: in expansion of macro 'FOLIO_MATCH'
>      FOLIO_MATCH(compound_head, _head_4);
>      ^~~~~~~~~~~
> 
> 

Whoever reads this:

Just want to point out that these early builds of that branch are 
extremely helpful.

-- 
Cheers,

David / dhildenb

