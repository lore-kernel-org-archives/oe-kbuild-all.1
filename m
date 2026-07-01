Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E3535F16C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 14:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917648; cv=pass; b=pgXSxmi6IAo7gY/Ec3lFG/o9cV2npKqDOfqcbQKWRuoddkfaIUtbJYcZZnRCs1aTzWWhM1VHJDv+uCzwgtWaLtgLg3tkVU5b+GR2FKxUFGyYg1G32i5vSDutakKxevlxIHlsWKMMbW2sP5/PLWhs3YIMsF3BapJf0SQdZutX5Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917648; c=relaxed/simple;
	bh=RqVBOucMiQE93bJPKjZzFDSxOkJG0kixX4axNZJuOUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdvjAvEUUkPx/Bivb+DXLXp+CehA2hFUjC2gZ9kR43jBsQuUT82WSCeqTlOquOQu4lE1jrI689EAI3/BD9OfE3ZRxMV8caxK8pgibWbqQ5VFI+w4GDNfCPd7opLNmxIIxPAxqsFhwy/2Sohjf24oowMaU00jZ0fv+DHpEzF5Elk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=J2wST7v1; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="J2wST7v1"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664db84f074so822102d50.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 01 Jul 2026 07:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782917645; cv=none;
        d=google.com; s=arc-20260327;
        b=U3xa/HENyjQ27NmzCCZ/h0DbdgFXAlijozcFbxGJcbGfqkOZfYd4uTiNUEvmbXNXSq
         yxyv5qkrmoghJ7cmGChEZzMRFo30YmgTDAqvWartjzvB81vKNpUBz1n8Y+tVkLHR9z/w
         47y0Ws+U/eGvSWKmhDKyDPRnRwXUN1yJ0ZsTwKN2JmG2Se+DGG7UcIsSNsnVFXWBtT9V
         HyUkfhwoMuw2IDLxf5S8AtXhcXzAiAQ8ml77hWMc3PLsMsJJCqvqJQGHF5lJo1Rv7zPA
         aLCgPW0NxJOqhCEvDz1RjCa4DD0f22Tlr34nq8/QxsryZe4BOWasa49cSAbqA6ZpPk4e
         rYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F+1DffOn/qJQQJg4tUTvbBsXqCT8v6DtqvEjTPgSGG8=;
        fh=EuXxnJ8E9INxIBjSoM/AoX7JanJYFvtaBoXoHWi0x4w=;
        b=g7P9PsG+wZLqTOUeqvcYylCwKZBeF9eZdaQSCyYszXfdzdcrbYiwCYaaT/ONS0Pxf6
         7WIjx6qUezrVJ1i1Hl/xKRKbqTtzx3aL52Ru/pJc9aHiY3CUq8DsvHeZZuG94IdpFDHQ
         XQn8cenpKec+9aV0qV2WdNs1lgzyO4tLL9skmjNfSi9KgDT1E2d3oaGhD7vKQkgseTLm
         Bp5jm+OHukOcmbcjrBjyjnyJYKoK5yiOq3TLepGIRAvFtVLn1PEt4rQgrRW2ciFIRXUS
         CB2PUqSs9ddxHu9htYWTxTmADnDHb4qlWOoRldTJstl8H4I8x1MXn29/qdWIGOTUQRzB
         fagg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782917645; x=1783522445; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+1DffOn/qJQQJg4tUTvbBsXqCT8v6DtqvEjTPgSGG8=;
        b=J2wST7v1l18qM8mH2Fm8U7XZ7oWA6F57L6UuZwdjwdBbPnhWeAUMJu5pibybkFpNJq
         zZwt7dn9gu1Y6Q1hJ2Uh78aYiUprvWRzkLCKnxyfwSO0hR9Lgvqbc01ZFd0p3uly2EI7
         84AVkqndOuZthLG2m7snnPTV2SOdBhEN4av7P7UZ4tRVSkcnO7Qvsn07phI4oc9ogzzR
         QwrlCGAowL2k1xo8GxKCiOhSokEUQNQPKM1tnzh6CzM8oklcHzmujMRq+fqhx5EnRoVS
         P+Ux3ipECbOBufVkyKAGPtGdDqBQktcgK+bp8xeoRM1njdQQJijvlRN4XwhreDlaakTF
         mKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782917645; x=1783522445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F+1DffOn/qJQQJg4tUTvbBsXqCT8v6DtqvEjTPgSGG8=;
        b=g1ax3J8AL1mGBvND2Imh3W5H9BO+msfSLxcZm5vMWmdICcI2rdD0ifONu3pAwSZtFY
         RoHv5Ezti18wl0Edw/xy5TDObj8d8JmKDt+R36TxQWuUra+nfHrDIPzWLMQsVGYGKNCN
         so9srspMm50ZhAwgbPH/sBiobAO2fXcPcecjbB7uCSqrKMOL7Yfxvcpm22aOTuoM7Bof
         hQ2ClAmSkP1KAO9jMaHfSjbeCjbpQ6VvL6oG4GZYxUYukD8NsiuxxCrcjjZF9l2ig4ac
         o57Jfrufi1Y+8AO/hfaEGeG+p9vYidlR/3DA5dlho/pM6EVfK1qxz4HmOqBAsMErbF4B
         x9VA==
X-Gm-Message-State: AOJu0YzQjmQW5ALT7Z5vi4XC3aF1wTOTFmfIG3wGJw2/7qHypulOu3Lg
	vwWLNdPkzGC93JEONwo0kQdKj8FqrVltnobXHubk7BqyWc7jlxz3JrQ21ceW14YeCMwxW3Nh0Pb
	Q6gDjL+vHjEGHZKmWJMzNAosCfGdIP4irf59Sk5IvTQ==
X-Gm-Gg: AfdE7ckIdRrckmyR/P3qrhCXi8R5g9EvqjwaVQi+UoL+SzlDqT+YZcIkI3yiSt6ioxE
	cbWc4kHnAHs4xe3CJsSBweX4ILoF4hH9xYTIYp1EE950lL+OzqMS3iP9MQlAFKGcARNGulaTkWd
	+2VH6XQyn3hrGgwB+OIFl53sOGNyLVxRsV6yj61G0nUsamH9CSWogfEwVIqcqXCSqCf/Zbi8r+4
	S4Y4zTJ1YTwPzqluSV3OOsCMpVCIUNcEmFysquHSnBsf4sHFzizqkVenMC6CLQO1KY+Qv4z/jw=
X-Received: by 2002:a53:ac8f:0:b0:664:e429:dd22 with SMTP id
 956f58d0204a3-66521d1efc1mr1851551d50.56.1782917644676; Wed, 01 Jul 2026
 07:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607010945.6lDjBFTU-lkp@intel.com>
In-Reply-To: <202607010945.6lDjBFTU-lkp@intel.com>
From: Muchun Song <songmuchun@bytedance.com>
Date: Wed, 1 Jul 2026 22:53:28 +0800
X-Gm-Features: AVVi8Cf0CJ5E8M7_qFK2F6kC2qUGExtwdwzx7OnJal-wZJfledGXONFqKny1avk
Message-ID: <CAMZfGtUtS_dqh4wNX9sAM01VaqCUMRDTxg+NgWYsRwrjp=CBWw@mail.gmail.com>
Subject: Re: [linux-next:master 1977/2307] mm/hugetlb.c:3095:4: warning: array
 subscript -1 is below array bounds of 'struct list_head[1]'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 9:37=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   be5c93fa674f0fc3c8f359c2143abce6bbb422e6
> commit: f48ee682d55e3602fcc194cb93b8398f2546e53f [1977/2307] mm/hugetlb: =
free cross-zone bootmem gigantic pages after allocation
> config: sparc-randconfig-r131-20260701 (https://download.01.org/0day-ci/a=
rchive/20260701/202607010945.6lDjBFTU-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260701/202607010945.6lDjBFTU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607010945.6lDjBFTU-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    mm/hugetlb.c: In function 'alloc_bootmem_huge_page':
> >> mm/hugetlb.c:3095:4: warning: array subscript -1 is below array bounds=
 of 'struct list_head[1]' [-Warray-bounds]
>        list_add(&m->list, &huge_boot_pages[nid_request]);
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>

It seems like a false positive?

>
> vim +3095 mm/hugetlb.c
>
>   3060
>   3061  static bool __init alloc_bootmem_huge_page(struct hstate *h, int =
nid)
>   3062  {
>   3063          unsigned long pfn;
>   3064          unsigned int nid_request =3D nid;
>   3065          struct huge_bootmem_page *m =3D arch_alloc_bootmem_huge_p=
age(h, nid);
>   3066
>   3067          if (!m)
>   3068                  return false;
>   3069
>   3070          pfn =3D PHYS_PFN(__pa(m));
>   3071          nid =3D early_pfn_to_nid(pfn);
>   3072          /*
>   3073           * Use the beginning of the huge page to store the huge_b=
ootmem_page
>   3074           * struct (until gather_bootmem puts them into the mem_ma=
p).
>   3075           *
>   3076           * Put them into a private list first because mem_map is =
not up yet.
>   3077           */
>   3078          INIT_LIST_HEAD(&m->list);
>   3079          m->hstate =3D h;
>   3080          if (!hugetlb_early_cma(h)) {
>   3081                  m->cma =3D NULL;
>   3082                  m->flags =3D 0;
>   3083          }
>   3084
>   3085          /* CMA pages: zone-crossing is validated in hugetlb_cma_r=
eserve(). */
>   3086          if (!hugetlb_early_cma(h) &&
>   3087              pfn_range_intersects_zones(nid, pfn, pages_per_huge_p=
age(h))) {
>   3088                  /*
>   3089                   * If the allocated page is on a different node t=
han requested
>   3090                   * (e.g., on PowerPC LPARs), put it on the reques=
ted node's list,
>   3091                   * because hugetlb_free_cross_zone_pages() only f=
rees cross-zone
>   3092                   * pages belonging to the requested node.
>   3093                   */
>   3094                  if (WARN_ON_ONCE(nid_request !=3D NUMA_NO_NODE &&=
 nid !=3D nid_request))

We have a check here to make sure that nid_request cannot be -1.

> > 3095                          list_add(&m->list, &huge_boot_pages[nid_r=
equest]);
>   3096                  else
>   3097                          list_add(&m->list, &huge_boot_pages[nid])=
;
>   3098          } else {
>   3099                  list_add_tail(&m->list, &huge_boot_pages[nid]);
>   3100                  m->flags |=3D HUGE_BOOTMEM_ZONES_VALID;
>   3101                  /*
>   3102                   * Only initialize the head struct page in memmap=
_init_reserved_pages,
>   3103                   * rest of the struct pages will be initialized b=
y the HugeTLB
>   3104                   * subsystem itself.
>   3105                   * The head struct page is used to get folio info=
rmation by the HugeTLB
>   3106                   * subsystem like zone id and node id.
>   3107                   */
>   3108                  memblock_reserved_mark_noinit(__pa((void *)m + PA=
GE_SIZE),
>   3109                                  huge_page_size(h) - PAGE_SIZE);
>   3110          }
>   3111
>   3112          return true;
>   3113  }
>   3114
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
