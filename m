Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054962C694
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718119522; cv=none; b=IagW5TWwQpOC3ruom4LA0zOT6ALpowQXtNo03SCnKEpeNfcC8mULQwNSyZ2gyn59L0cJIvygtqF2r2SRtjaDPvCziibprlC9TR4aDyiJ/NnGTbaMgR9uofXynPhJSunfwk8P0jQm/6jXY9Yn7PAQvOfxTHFCZXenkStLwE+tB0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718119522; c=relaxed/simple;
	bh=7TfreBTzC5bqGdXuyP4CIrsydk8pq5uV0HQ1XxyL8WQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hX30MFph/J67DwIcYkICB4nuC+JD6vjOGzUaFckrU5MLnPaciC5xf24UVo6AKdg6dRqIdZ4OZPGuw9c0ldY+vlv2Z9sf2vNdMGBxgJMzQmFtrGZGPPB2BSYFVKUDF0HQHWjCN5nwd6+jcrArFj5kIKIic3qAEKc95akJ+Cvvqbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HOnZD4lX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HOnZD4lX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718119519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KuXzjdMACZidUksxCzHUxolEfx9AX7VxeCDWwF60ptU=;
	b=HOnZD4lXGctA70fxoubtEaZuz0mlFtl5zSNwHr1xzU3Eex2v0jrXaRmRtavJVHnjyR/x5z
	c6D2H7m+qYlDoe1RUrtV644wg4CPIrVucy+gAw70/b6wE00RaTND+A+GA5rqqCfas29GIF
	VslBt3LiYj0c+Nxk8hErLt0ppPyJ9VM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-m6sy5d7GOuSA4tbeaGsscw-1; Tue, 11 Jun 2024 11:25:18 -0400
X-MC-Unique: m6sy5d7GOuSA4tbeaGsscw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6f1db7e425so78947466b.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 08:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718119517; x=1718724317;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuXzjdMACZidUksxCzHUxolEfx9AX7VxeCDWwF60ptU=;
        b=IMwpLqJkKu8xbF/eyHgUmvAnGf5pNQ3ehubgStGNYyhQbrPh0VroQiZmqE4UFg1ldH
         KrM85R3ZjOY2l8Jm5XMd1JACxNu6ZpD93LpzCFXvYrLuAuhm4uPcIPWq3DBIKwO8zM7I
         o/h6QLuVWRGT3telNumNT1MjoLY4V/wKkFrXr28TUQSXALVKd7mu8OId+FgCDqEmIcnb
         ZAxhXz8a0gPIdqRpu0aq6MdOqYNv93c9qpJCDjrKOc/D+jjXYfj4NE5o73InDuEPJ1E1
         86G8Nq5+KAhS52SGQ8wS4MRICTldob0hOSZ0tTzxmq9sEOO12l+o+mn9zsBb90Z/u47c
         s7rw==
X-Gm-Message-State: AOJu0YwYGGMuRtC19QmbQf6qn7CiHqX6v0k+bJHj9vAYZ4frQnC+UZ9Z
	e0lzASeKZiTGh72q6gPfrPmtSRUBvwrvzMomxAmdD+fdRWOx2lW105w4hLIoEcc76FDk3Vw96fx
	G1FJnUfC2PffuDFcLjVZY5IclBgC7l6ZZMd8rQ2QSpFvIsThyu29wAHDrDuxOmkg=
X-Received: by 2002:a17:906:29cf:b0:a6f:e15:8163 with SMTP id a640c23a62f3a-a6f0e1581camr618789666b.7.1718119516900;
        Tue, 11 Jun 2024 08:25:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnRnENnTbaA/SaHRzXcgdICQ3LMnrfZmZXlu2M75uAdi8Z3xFSNXB6TSPlERhUym55gQPzHw==
X-Received: by 2002:a17:906:29cf:b0:a6f:e15:8163 with SMTP id a640c23a62f3a-a6f0e1581camr618787566b.7.1718119516400;
        Tue, 11 Jun 2024 08:25:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c748:ba00:1c00:48ea:7b5a:c12b? (p200300cbc748ba001c0048ea7b5ac12b.dip0.t-ipconnect.de. [2003:cb:c748:ba00:1c00:48ea:7b5a:c12b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f16c8ded8sm9181092f8f.31.2024.06.11.08.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 08:25:16 -0700 (PDT)
Message-ID: <2df66490-b34a-4662-afc7-5f6ffb12e1b1@redhat.com>
Date: Tue, 11 Jun 2024 17:25:15 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 175/198] {standard input}:63: Error: symbol
 `__export_symbol___totalhigh_pages' is already defined
To: kernel test robot <lkp@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202406112233.GT7V4e9f-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <202406112233.GT7V4e9f-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.06.24 16:55, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   2e3df1a7bef9c2814b80049345f2a53706f82001
> commit: dae48e2d159fa9b7d6956b72cf3ebff6cd5e0de4 [175/198] mm-highmem-reimplement-totalhigh_pages-by-walking-zones-fix
> config: csky-defconfig (https://download.01.org/0day-ci/archive/20240611/202406112233.GT7V4e9f-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406112233.GT7V4e9f-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406112233.GT7V4e9f-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     {standard input}: Assembler messages:
>>> {standard input}:63: Error: symbol `__export_symbol___totalhigh_pages' is already defined
> 


   AR      drivers/media/platform/nxp/built-in.a
   AR      drivers/media/usb/siano/built-in.a
{standard input}: Assembler messages:
{standard input}:63: Error: symbol `__export_symbol___totalhigh_pages' is already defined
   CC      net/ipv4/tcp_rate.o
   CC      drivers/input/touchscreen.o
   AR      drivers/media/pci/mantis/built-in.a
   CC      kernel/sched/core.o


The placement of EXPORT_SYMBOL(__totalhigh_pages); is clearly wrong.

Seems like Andrew inserted it at a different place than planned [1]


 From 7d3c3e8efd1ccf9ba4a8fb8571bfdeb21fc5ee86 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Tue, 11 Jun 2024 17:24:19 +0200
Subject: [PATCH] fixup:
  mm-highmem-reimplement-totalhigh_pages-by-walking-zones-fi

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  mm/highmem.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/highmem.c b/mm/highmem.c
index 3e89639cec1a4..ef3189b36cadb 100644
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -133,10 +133,10 @@ unsigned long __totalhigh_pages(void)
  		if (is_highmem(zone))
  			pages += zone_managed_pages(zone);
  	}
-EXPORT_SYMBOL(__totalhigh_pages);
  
  	return pages;
  }
+EXPORT_SYMBOL(__totalhigh_pages);
  
  static int pkmap_count[LAST_PKMAP];
  static  __cacheline_aligned_in_smp DEFINE_SPINLOCK(kmap_lock);
-- 
2.45.2



[1] https://lkml.kernel.org/r/b57e5bc4-eb72-40e3-add4-57dfa6e03df6@redhat.com

-- 
Cheers,

David / dhildenb

