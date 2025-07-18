Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00642957C1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830236; cv=none; b=UuWKwl1685wmyVdCzqqu/gDwy65aTnBlPbF/ygTwJCjCEUkcNs3Mfdu/AInR3w6L34Rp5O5XWzPut3iIPaiaW0O477IFENNPIg2KDQeVnZR7qAhVMSWUfWjqZ859lyaft9n/Dzk2TP8V+M34yjnmROlL9mkBdd9NHm9YIBHz/EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830236; c=relaxed/simple;
	bh=Fw3ZT2waXkd52WH6dSOHrXUL1IonLYSsmY5LPvFE23I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srpsS2mSSVkSeVweHjz6NjoZfJ/z7CcivcnABEm1WNpXFCQ1wrmODm6wwAr8EHuHa7zUnLKWHmS+A8LVV0qDaEa54tJE1aZFtXeN20hSBbzFc8WvAhBpSV24nD/BeYpgG/MFQ10JUg/w9Q2OGNaH1N55cIFoh/uTlAPWzEbOW9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3yFdUwP; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3yFdUwP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so346440666b.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752830233; x=1753435033; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQt5WkoSDJsxA1BJMl3UO35qCdstjQjYzU9xXXTDo18=;
        b=A3yFdUwPdobjJq91M8/34MrZsJEJxFaEGiNNgsxqwHokmy1VzeawUL7XvrlXu584YA
         toXffasaYe10IFsXfg9ili0dZu4UEYF7F3jd2p+Z6GFLN5qURx0KITa4msoCZ7QWFl4U
         cGcCw7DGnps4w6T/vWXfgbC4TBfKhRdBDcjzQpJ1wTpxqa7d07e7hwC67VHsEEtoi6B6
         XK3DT/ac27ljNPAmmfb6o5k57kYhdR4mwGhxiX4C1kpbz3oJ8k3uus3t8N1sY1gtikeo
         /92Uh5nu93oC9npccEovpdx0LxfIlJZA+mW+EHnDkQvqA6pO5bjOqXwcHqLU9AmUATs6
         HbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752830233; x=1753435033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQt5WkoSDJsxA1BJMl3UO35qCdstjQjYzU9xXXTDo18=;
        b=agljWuj7NpQd9SEUOXKXeU36MqZHEs8Hw9FbhwSFxno9MG0w0TwYWLPYatASgWB9aa
         H2ZJEF5NWQyEUJzS7TKPZxHpHPwUyD2FdsyXPj7Fnh0xV9pPGwPjzHyo1qOAA9rYEaW2
         Qj1QeJ51x/5zF+XYza7cPB17GvBbplDVwgq+Lnb3ZkrInRtIg9VZHYUVSc3+dnK+4mF2
         rqPQRApW8NQ+4Ua0/o+Z9EYAtWg/7JzHUxqte7XqbvS+r1+wzchaSTlmfeerxzdakI4j
         Zs6+QIbLNzMNKD7a3Sv0SDsYLf66lqN3sco4nZ0Oh/f6k35nmtN6gwzW/Js4/Bog7pq7
         tGvA==
X-Forwarded-Encrypted: i=1; AJvYcCV+tRIvnu0IUSs4eMqumtg4fxEC4aoA5OyfB0EjTOzb3ERVrbbNyhcwL4TU8SyBDwunRow4eG7nnykZ6z/o@lists.linux.dev
X-Gm-Message-State: AOJu0YxUG1UryWRYxPbZbOLyHU0cTQN9bw8l8ByGZc2K9slx/dVIOuj+
	w9tYV8I7IGLFnS4VGZZmcWYoBHRGTjEGh5fRxcLaKN6f/9XkVVd9dgot
X-Gm-Gg: ASbGncsoLAxadxAS++FbMkulijYCCOZfJdblgYqh19b06Gcar54e1g9EDxqbuC4zHOu
	k5L5S2njGW2hdmgfONYYBqjjx4+RWju76IT49iISnsRTiq5rWdDYBL4GNBbgU33tibWn9uMUFHc
	Q0rNeQcq6eeEsNIKneFAsSEhhGTfyW6PkHf23H8G0p+DKzznEBHkyZGkh9zGnhruxH+FSQyUs5a
	BbMtJpEcAvz7gI7GRVRzgq06a37wPKRewqTQhFPaJyXZpQqLJCSFQJjZOhypejbiwCAByZOoTGV
	THmRxBtGp0WBP8FPzMc1c+XK2p7w79Nzo4OCBg1z6CHFapcKOhu81MSlCR5ub4NBe1fZHB3wuXt
	tFw0hPvrG0T9QCICHuitwFXI/t/GJw/AF99o=
X-Google-Smtp-Source: AGHT+IHJ6Qkjj0/27EzE9VVfOI7xbm7fY60xnb0OKnLRmHC6l4c5UZ1MzUN+MM+C38ZmrD/ZAYQsDw==
X-Received: by 2002:a17:907:7f24:b0:adb:229f:6b71 with SMTP id a640c23a62f3a-ae9cddb1d86mr1032671266b.5.1752830232698;
        Fri, 18 Jul 2025 02:17:12 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::1ac? ([2620:10d:c092:600::1:6915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6cadd8c7sm84561966b.155.2025.07.18.02.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 02:17:11 -0700 (PDT)
Message-ID: <35592824-6749-4fa4-89d9-2de9caccc695@gmail.com>
Date: Fri, 18 Jul 2025 10:18:41 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH net-next v11 12/12] libeth: xdp: access
 ->pp through netmem_desc instead of page
To: Byungchul Park <byungchul@sk.com>, kernel test robot <lkp@intel.com>
Cc: willy@infradead.org, netdev@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kernel_team@skhynix.com, almasrymina@google.com,
 ilias.apalodimas@linaro.org, harry.yoo@oracle.com,
 akpm@linux-foundation.org, andrew+netdev@lunn.ch, toke@redhat.com,
 david@redhat.com, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-rdma@vger.kernel.org,
 bpf@vger.kernel.org, vishal.moola@gmail.com, hannes@cmpxchg.org,
 ziy@nvidia.com, jackmanb@google.com, wei.fang@nxp.com, shenwei.wang@nxp.com,
 xiaoning.wang@nxp.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org
References: <20250717070052.6358-13-byungchul@sk.com>
 <202507180111.jygqJHzk-lkp@intel.com>
 <20250718004346.GA38833@system.software.com>
 <20250718011407.GB38833@system.software.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20250718011407.GB38833@system.software.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/25 02:14, Byungchul Park wrote:
...>>>
>>>     In file included from include/linux/container_of.h:5,
>>>                      from include/linux/list.h:5,
>>>                      from include/linux/timer.h:5,
>>>                      from include/linux/netdevice.h:24,
>>>                      from include/trace/events/xdp.h:8,
>>>                      from include/linux/bpf_trace.h:5,
>>>                      from include/net/libeth/xdp.h:7,
>>>                      from drivers/net/ethernet/intel/libeth/tx.c:6:
>>>     include/net/libeth/xdp.h: In function 'libeth_xdp_prepare_buff':
>>>>> include/net/libeth/xdp.h:1295:23: warning: passing argument 1 of 'page_pool_page_is_pp' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>>>          pp_page_to_nmdesc(page)->pp->p.offset, len, true);
>>>                            ^~~~
>>>     include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
>>>      #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
>>>                                                                    ^
>>>     include/net/netmem.h:301:2: note: in expansion of macro 'DEBUG_NET_WARN_ON_ONCE'
>>>       DEBUG_NET_WARN_ON_ONCE(!page_pool_page_is_pp(p));  \
>>>       ^~~~~~~~~~~~~~~~~~~~~~
>>>     include/net/libeth/xdp.h:1295:5: note: in expansion of macro 'pp_page_to_nmdesc'
>>>          pp_page_to_nmdesc(page)->pp->p.offset, len, true);
>>>          ^~~~~~~~~~~~~~~~~
>>>     In file included from arch/arm/include/asm/cacheflush.h:10,
>>>                      from include/linux/cacheflush.h:5,
>>>                      from include/linux/highmem.h:8,
>>>                      from include/linux/bvec.h:10,
>>>                      from include/linux/skbuff.h:17,
>>>                      from include/net/net_namespace.h:43,
>>>                      from include/linux/netdevice.h:38,
>>>                      from include/trace/events/xdp.h:8,
>>>                      from include/linux/bpf_trace.h:5,
>>>                      from include/net/libeth/xdp.h:7,
>>>                      from drivers/net/ethernet/intel/libeth/tx.c:6:
>>>     include/linux/mm.h:4176:54: note: expected 'struct page *' but argument is of type 'const struct page *'
>>>      static inline bool page_pool_page_is_pp(struct page *page)
>>>                                              ~~~~~~~~~~~~~^~~~
>>
>> Oh.  page_pool_page_is_pp() in the mainline code already has this issue
>> that the helper cannot take const struct page * as argument.

Probably not, and probably for wrong reasons. netmem_ref is define
as an integer, compilers cast away such const unlike const pointers.

>> How should we resolve the issue?  Changing page_pool_page_is_pp() to
>> macro and using _Generic again looks too much.  Or should we?  Any idea?

page_pool_page_is_pp() doesn't change the page, just make the
argument const.

bool page_pool_page_is_pp(const struct page *page)

-- 
Pavel Begunkov

