Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8702D0606
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771967716; cv=pass; b=UQPufuPUdAIwYS9BZ8q7GmMQPfHlwxmsHECOOZ5gYR8Z8gxdClnPfwe/orKZIBMwMpU+6q0aV2Fw1slUK556XZaUoP8WlL0iVS1gljiYDF6s1o4Z4CQZ0cTi9mf6GYQS+ZsSNJJqafNh2YDJfP0XJujukGOvAeqyu5fhuNU9Q4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771967716; c=relaxed/simple;
	bh=eV1IYc9F8dk0DjERYXn1zCrf1jS4ysp8t+9Yjbb1pTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j3REuUMFxAs0428bW6km8SookDjWAkVwXxjpIdhXxmssRG9nINKnATl+bKRk561l8Ie3jip3LVl/px9tahL87a2u4velI3e0ZWy7TQcmxVep6ErD9UeZ9Ih2u4dsWv0ge+uXuNGSrVbA6xpSNyx6QRdo3ToFr8DJ3veGdoZ51I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WFas0X7F; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WFas0X7F"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-505d3baf1a7so35131cf.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 13:15:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771967714; cv=none;
        d=google.com; s=arc-20240605;
        b=i9ED0gagbZvXnd0Du1sJiDW9zKW1R0nkLoJzy6MDq63LYCcdorCrheSMOByUl6H8Q6
         27gISruTPrWVN0HouK8KOT+CIDfzccd/Zg0KtMRgPnL6EELmr1Ow8xAqmX/SK+Uf0P5O
         7d/jTS93OFmR4X438J68MqSwQQSWbJpkVTXeK6XAQ0r6hdmoknu+JdMC1R11nnEeNwi5
         1CuTXH6kLkBEui4YGijus+Ef79dC+IMENPfm0Pd4c9Qbh9vdZStpokjHKHluesBUWtYM
         6C7WgVuj+wrU5qVlM/hBci4Va+q5XiyHGc9bBROK3D/ZdtdSypVe4XbHtCjVdRIgviOs
         aZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6p/EscjPc4RwdFKAEV1F/Hcd5UZ99lvhttD+tVMi300=;
        fh=ReprmFisqYL35AD7HpfKhsS60Rz8KPuJctMzabDMvZ0=;
        b=Ts/FXf4xJEpkA/U0TuGiDmxrXpSoBXqCokjJula3Kzbo5mmwRn3uoWA4qsGojEvxHP
         6yKz4lRiQyhKi/gmmjzLXh0wcfhFTFEL0Z0XxChgzeD6QFEW+NOmM3UF9r0/BQrQWM9/
         TwvhoyoV7pTXkTJ5NbBcipoZV1T+ObfFLtVtKr74v2na0sv06Dsqj5a4cIQCrVxwPKKB
         ju6GNPnqZC3+03UVHtleucj7A8LsX5G0hZL2ADRy3zyveqgLjhQLbADmdbkK5tyrqQZm
         yUM9c3004gbqgjH28PRe8h04yCNUnrZ/QnI0BnSMfInCcfgl7RCqkOG/6Ykirf/smEab
         ntyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771967714; x=1772572514; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p/EscjPc4RwdFKAEV1F/Hcd5UZ99lvhttD+tVMi300=;
        b=WFas0X7FHMdZKQV1xbPBKqytJzJfhru87ySWeH8lGtyL8t7mO/cwolymufCVlUfU3h
         rKxsSpP7tXcYOCVTY1t5NvK2Gn7u8BuHelRNk8zQbpBw+WDhEV1zATKjdkEY51F97x6d
         OjydMXivHwyuWfzwoeKAYqeGuiJkyhNUN8/dNEm1V5BAt0fRmT2GaVQl0k17MI7/8WMP
         5xJbt7SnRIGqlk6UMUqHNQFTTHHMbceIDFIJDGOb/DjoEOplVCQc0lBBMoPDIqb4SOnE
         NEL2+2DsIlG4/+1OsLhRTIlHr0MqUdzZRDE97l/e1QQhj4qYYrg/N1T+cYsd8Kdal/yc
         3F7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771967714; x=1772572514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6p/EscjPc4RwdFKAEV1F/Hcd5UZ99lvhttD+tVMi300=;
        b=Nn8wx1kw6wd3EPjxeMcgXJBnZDM3PNr5Lr72Rt8UDbboZgDRWmuMNk94G+6CG4A/gt
         GNUf97goyTm8zOyvTXBgaoIdP7Xo++aDT0uPTnfvDIsXJAXFdwCu/JhOHT58bOONMkcD
         llKp+dROR3lMrlt3cHKUe0e+yrjz8Eeq2eqhOYYYdlp/ZHjnMmDYQ9+XCAWMZixAsy5F
         CKBGaTa2exhuv7fONQIkxCHxxRQly+6wQLMYbFtlcPHP4P4bKCvfWcsrHSOy6EcpY80P
         vA6QTDdehS3/M6PIt2u/Z5oDjYhTNgXleVIbwa6xtqWp2KpUdXRtuc6gbSrqhdUQZggb
         mIXw==
X-Forwarded-Encrypted: i=1; AJvYcCX4lPkV9UvwW3HUUEf/r9xtnNaDnCUAJ7Pf5bzxGs3URjNgAZNPytp+aANeg801pzn+GEiz+/wb14wmvK73@lists.linux.dev
X-Gm-Message-State: AOJu0YyqIvAdB//fQUMXFxjXZS8+iU8z9/pu3F3Ote7/EdClcyp73wr/
	dhammGtRCpMp6ZU+iBmfe0AeHLBWrzETu9niNrJ7xkOJrn7LkB0vXg6V9XBTO47T9wrPVMSb1Pq
	IMcUkmSBKe6ZhIx9pYLgpT2FYAQmgIqRMczLMY2d5xEDNgXizZS40F9+T6CE=
X-Gm-Gg: AZuq6aINU8DxH4Vw+5x2TvwFlCkly7ZRi6QkE84P3ahQPIU0cE8LU4q1DCOryCQZBrX
	CB4pRRMDXFvnTG1In9ZiQPrJHFfVtu/mKEyzOy9WWMPxP19MypVafy1YqO7QZgqyfE+V8XAs7rx
	1M6Mkc0fx5X3/Zg1FGAa6f5+vigeXfZGjDfJTRIi9+Fnh1aLwOH9MMLlw21TqtC6yft67nBPg+F
	E3387kcSJZWuhRSilnWrCm1L1GB/jYVbpGfPu2tqb7pnke/AY4WQ3bBOon1HfPK4ZjQG1uW/Kxq
	6BsSNuPx3r8pfhCsPjOIrE6aV9o4f4mlLay2ewta/9yJoQjs
X-Received: by 2002:ac8:7d41:0:b0:4ff:bf96:db86 with SMTP id
 d75a77b69052e-50739028793mr2962101cf.16.1771967711072; Tue, 24 Feb 2026
 13:15:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260224165250.1322946-1-surenb@google.com> <202602250250.n38q74JK-lkp@intel.com>
In-Reply-To: <202602250250.n38q74JK-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 24 Feb 2026 13:14:59 -0800
X-Gm-Features: AaiRm51WuymRTNAhPkBO-yVwq4mhRHWTiS7MnS75L9UZH8fj6ktQ_w2NQi6eNiI
Message-ID: <CAJuCfpGcA7YmxzmJuEzjJyLAQrV-uGS1LH=B1eX50MSh09z21w@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/slab: mark alloc tags empty for sheafs allocated
 with __GFP_NO_OBJ_EXT
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, vbabka@suse.cz, harry.yoo@oracle.com, 
	00107082@163.com, cl@gentwo.org, rientjes@google.com, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 10:54=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Suren,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 7dff99b354601dd01829e1511711846e04340a69]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/mm-slab-mark-alloc-tags-empty-for-sheafs-allocated-with-__GFP_NO_OBJ_EXT/2=
0260225-005422
> base:   7dff99b354601dd01829e1511711846e04340a69
> patch link:    https://lore.kernel.org/r/20260224165250.1322946-1-surenb%=
40google.com
> patch subject: [PATCH 1/1] mm/slab: mark alloc tags empty for sheafs allo=
cated with __GFP_NO_OBJ_EXT
> config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260=
225/202602250250.n38q74JK-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260225/202602250250.n38q74JK-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602250250.n38q74JK-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/slub.c:2787:3: error: call to undeclared function 'mark_objexts_emp=
ty'; ISO C99 and later do not support implicit function declarations [-Wimp=
licit-function-declaration]
>     2787 |                 mark_objexts_empty(sheaf);
>          |                 ^
>    1 error generated.

Thanks! In a hurry to post the fix I forgot to update the
mark_objexts_empty() definition for !CONFIG_MEM_ALLOC_PROFILING_DEBUG.
I'll post a fixed version shortly.

>
>
> vim +/mark_objexts_empty +2787 mm/slub.c
>
>   2783
>   2784  static void free_empty_sheaf(struct kmem_cache *s, struct slab_sh=
eaf *sheaf)
>   2785  {
>   2786          if (s->flags & SLAB_KMALLOC)
> > 2787                  mark_objexts_empty(sheaf);
>   2788
>   2789          kfree(sheaf);
>   2790
>   2791          stat(s, SHEAF_FREE);
>   2792  }
>   2793
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
