Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228EB7081F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 18:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738348686; cv=none; b=FpzLetFL1cHUwYHr2uH/fhRoM4iOL+l23XmjNpN3TK9pDNBwhWXYJ5njIlsi1hZWstk3ENIM+Q7vMgRwuZZPwa2Ib+YJmNB+xWkMmxCGGkC0SBtVc5836l7UtR5wOq89K1SikOHxX0261Am30vrSAqs9owKoA/liJove76PUw5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738348686; c=relaxed/simple;
	bh=2IoK+3PIiA8/dw1bqcB7x5svbMkLD4C6rL9iDhunhzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQnkR7hL6sEqupO13lKgkobPiC2h+8+MjtrpWWXuveWCIoIiw1xDFqzbmVmnZrSLS+in6GPXIkTDBQNR+tiyKl6O73rYrRjfmEM4eFLuWyhkarCVaMvQasPlT0BwdMh88jS65dosASDs6v6X85KbJz0rXQyk6C7lJlcTzViTXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kU0vWjA3; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kU0vWjA3"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4678c9310afso13171cf.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 10:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738348684; x=1738953484; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaP+gwH91Q/1lKDOcaMIFE2ox2Otd3KRnpWUugUIeqo=;
        b=kU0vWjA31TaPNEExJ9mX+X22Q7lWUIrt6MoFjc8EJT3o55nwOHGLt0qKZkMd/WnXdr
         RBIeYWDadATyCcH1rm6s1N/4QTpG+1nKnfNKJgr44vBFAcAiQ/2nOsuZMSsjI3lEWdyT
         PCbu5qI17WYx7I3XDnA7j1Jmn1AI6fGbQ3WbefY+oDTcdE6ES5e5x9nuCqa7bwNP0OCC
         aZi2r3qSSeA6VKBwocDEYaOXYe9zq1ZEwwoRw6N4FEkegYWVDfDaWDubyzAuC8P0dyGg
         naGFbA/qy0l1YrqgO8di55i9jiAzcioWxNeK7pEg/kuJw8W/3yY6WFf0n7ZA2/NI2pea
         UaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738348684; x=1738953484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaP+gwH91Q/1lKDOcaMIFE2ox2Otd3KRnpWUugUIeqo=;
        b=YxWonXjC8jCRHHVR87jGkqaIwr0Te+K/93PuHDg2a3ciEVqjxOKMK0OaWYpr7vW6fg
         1REzrpUHcLjrPZrwXxVTZgnMJolvTk5UrxL4/ij8q3moH73GCCrXoVEBuwHzfTdR8OSL
         DeD2k+NMuk1vVNbyX2LThEajwS1HrIjIDoAf0JhSgScYBoO6TbaNhNiNtyrAJeSfaSJh
         zl6rp7+aWEA7hKCm/BwkrVrQ9t+R+7cDTcbB82HM1ShwHs9qlCGqh1Jd2larFE8iEVhW
         BXDwgQGlJO+Yep84ZSYHT+S749Uk0Zi57gtsEHIJzVoDHIJ1N2PtHAsiEddbqv2EtBEg
         hNiA==
X-Gm-Message-State: AOJu0YyoIxCZzaPriHFRDHRcuKDQeu+nSmWi6EliVGQR3gS2FhGsWGcX
	FLqYPQ86KpkGpvfQ/AtfoVaHtiVF32iRdiZVM/0s1Hy+98w5cpQLtQrzqSV+1L67DLa9y0Xpyfl
	jfyN3VECOMH8yNP8C18+TLuGDc+SHxarRfBt9NE+GFG0KiNng1A==
X-Gm-Gg: ASbGncvDO3we+ZZfecTHKE2bLV0inLmnau+HB6rNPPl+4s02ebCdgF6oatb9ivN+Uzq
	FhDGCamN+kRx5vO5l5rLnWW/eDFtWOJNq1sz4BpzqQdhP1KxuMga35R4q8iCBo7LzNmXxBQ==
X-Google-Smtp-Source: AGHT+IFfaSV3CSOcY2JB0IzV54oZf2MKKy9k0ECh507ihIxazJDlvUKza7HYseCU/0FJ4dopmhsO6GtaQc1CCNfapVI=
X-Received: by 2002:a05:622a:1c12:b0:467:7c30:3446 with SMTP id
 d75a77b69052e-46febf30f42mr3845151cf.25.1738348683742; Fri, 31 Jan 2025
 10:38:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501311137.rMiQNfi3-lkp@intel.com>
In-Reply-To: <202501311137.rMiQNfi3-lkp@intel.com>
From: Frank van der Linden <fvdl@google.com>
Date: Fri, 31 Jan 2025 10:37:52 -0800
X-Gm-Features: AWEUYZmCF6mTm_-9a24eBEI20BtKTs7mvKwXGfW_JcehnmBxcs5Y0h5Mx1o-V2k
Message-ID: <CAPTztWbXvdVOARP6AuAsDnfchYTUMp9aHCPNrkwY03+rQDgY-Q@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 61/88] mm/cma.c:811: warning: Function
 parameter or struct member 'gfp' not described in '__cma_alloc'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 7:23=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   495206a68b359eb6117d0860861578113bbb94e7
> commit: 77cbd63e91fa6c5f6157a30e61a380b6c47c1443 [61/88] mm, cma: support=
 multiple contiguous ranges, if requested
> config: x86_64-buildonly-randconfig-001-20250131 (https://download.01.org=
/0day-ci/archive/20250131/202501311137.rMiQNfi3-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250131/202501311137.rMiQNfi3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501311137.rMiQNfi3-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> mm/cma.c:811: warning: Function parameter or struct member 'gfp' not d=
escribed in '__cma_alloc'
> >> mm/cma.c:811: warning: expecting prototype for cma_alloc(). Prototype =
was for __cma_alloc() instead
>
>
> vim +811 mm/cma.c
>
>    798
>    799  /**
>    800   * cma_alloc() - allocate pages from contiguous area
>    801   * @cma:   Contiguous memory region for which the allocation is p=
erformed.
>    802   * @count: Requested number of pages.
>    803   * @align: Requested alignment of pages (in PAGE_SIZE order).
>    804   * @no_warn: Avoid printing message about failed allocation
>    805   *
>    806   * This function allocates part of contiguous memory on specific
>    807   * contiguous memory area.
>    808   */
>    809  static struct page *__cma_alloc(struct cma *cma, unsigned long co=
unt,
>    810                         unsigned int align, gfp_t gfp)
>  > 811  {
>    812          struct page *page =3D NULL;
>    813          int ret =3D -ENOMEM, r;
>    814          unsigned long i;
>    815          const char *name =3D cma ? cma->name : NULL;
>    816
>    817          trace_cma_alloc_start(name, count, align);
>    818
>    819          if (!cma || !cma->count)
>    820                  return page;
>    821
>    822          pr_debug("%s(cma %p, name: %s, count %lu, align %d)\n", _=
_func__,
>    823                  (void *)cma, cma->name, count, align);
>    824
>    825          if (!count)
>    826                  return page;
>    827
>    828          for (r =3D 0; r < cma->nranges; r++) {
>    829                  page =3D NULL;
>    830
>    831                  ret =3D cma_range_alloc(cma, &cma->ranges[r], cou=
nt, align,
>    832                                         &page, gfp);
>    833                  if (ret !=3D -EBUSY || page)
>    834                          break;
>    835          }
>    836
>    837          /*
>    838           * CMA can allocate multiple page blocks, which results i=
n different
>    839           * blocks being marked with different tags. Reset the tag=
s to ignore
>    840           * those page blocks.
>    841           */
>    842          if (page) {
>    843                  for (i =3D 0; i < count; i++)
>    844                          page_kasan_tag_reset(nth_page(page, i));
>    845          }
>    846
>    847          if (ret && !(gfp & __GFP_NOWARN)) {
>    848                  pr_err_ratelimited("%s: %s: alloc failed, req-siz=
e: %lu pages, ret: %d\n",
>    849                                     __func__, cma->name, count, re=
t);
>    850                  cma_debug_show_areas(cma);
>    851          }
>    852
>    853          pr_debug("%s(): returned %p\n", __func__, page);
>    854          trace_cma_alloc_finish(name, page ? page_to_pfn(page) : 0=
,
>    855                                 page, count, align, ret);
>    856          if (page) {
>    857                  count_vm_event(CMA_ALLOC_SUCCESS);
>    858                  cma_sysfs_account_success_pages(cma, count);
>    859          } else {
>    860                  count_vm_event(CMA_ALLOC_FAIL);
>    861                  cma_sysfs_account_fail_pages(cma, count);
>    862          }
>    863
>    864          return page;
>    865  }
>    866
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I see, I left the description block at the top of __cma_alloc, so now
there's two of them - but it only describes cma_alloc correctly, since
that is what it's supposed to do. Will be fixed in v3.

- Frank
