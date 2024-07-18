Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4B919E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 02:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721268728; cv=none; b=hQqIyVlffKHhMmKjK+wNqJDgg6S0gNS08DtnaOaxqhu8oPRbw04/3zH3xxrr1bRDQLCl0ttIyFNPr8U1OF8Th3bA01VzcXrXk2tv627Hjse8/zop53m+nyRfU+vOfhLtYVHq891N892vGImE4PgkDbzAn1L2dH2q+y8xzDTVeD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721268728; c=relaxed/simple;
	bh=pVTt6Uj6YUaBhtdyRZ5oXRpSvkrt9EHzPanCcAxElN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnGnpUpjRuw8X24EmH3oP+0tf+m9jjCDzHgiDCyIy1B5A16bKiAWFsllb0G/G127xNyMxN6GjhIvqdGcf33h8KuV1fTMBJnkGmAaz0vQCQO7DZlsfTiotwjnmoNDS8RBGwj50sfr3/phbmq7gj+bS9AWL7vmG0zrVm2mCj8SMyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKxizm+g; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKxizm+g"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70af8062039so223526b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 19:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721268726; x=1721873526; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AjohUa7Omlwx3Iond163W4s0nR41SlXlQpG/5AzIxI=;
        b=eKxizm+g45FZhqYHSg5AdmfowK2tMnPP87rDSuN+CMwRo159fcCYqJmJFUmUv8BOiZ
         +bcvBPRuQFpi/HhvJMecm4KfvrYrSue0UrIty4gOcNQOnnAGQ5pph/GvEvQCxxSOflD7
         bJ5cWGNjIVFxv7Opsd4zUirprDI7iZvmbpR33Xt2qOqsHdzmKnpadJWlXYmIc1R1uJ01
         7LbQO7fac3iq4Vje3dmHC1sYjKSTMc10saPStXFQwMCqS6aOW8/EACBVuYSsle5zNSyK
         mAYFR4TXcavrTCGcNUv7OEDwypQKX8M3I2kBON6m/a7msXDKSZHvRmnGDDg1E4yAH4cz
         EU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721268726; x=1721873526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0AjohUa7Omlwx3Iond163W4s0nR41SlXlQpG/5AzIxI=;
        b=DsGijTnqoNWWyJnFG65xrx8Z2sTmZsO7fbfhlU+tdyZaoczz/hb3b9MrqVtYwlnidm
         ZD0arQbw9uLt19axEIJyKYp5t80gvrA8suaYRLqvaAbL+iglReIGKj2rcKcXqVHjv32+
         12h4ai65YKF4mjSYGH4kWWYaqC6b+MkbT1Tbsd1qQdUt+HX0991GkvaXTBhqCH0fn32n
         0ZNkaWfcmNApCmSBzDvaaTDqVpD4hxJsXFbZ7/afpabNwiEQBPH0Sib4ifuRRPrzzFoN
         57ySSGxSlj8HhRvJ9URJo6PFdU0quu9qNfoovjlNvFhfg9ZyM9eR6mSLVvMr2lmwpcDe
         yThA==
X-Gm-Message-State: AOJu0YxzNb2/xRhPgPIaobzItZYn8XOr5gkIp4d9qYlcfoC9N6jWeHUA
	XK/LWihjE6ruhi0Db5q1SU2vb3t0TsXPT6P/Ljda9HaqitvSsUhd
X-Google-Smtp-Source: AGHT+IHU4HNsJzybz80wIPAFCOu8gCQSiE9PjdyfoKQK0QTqbnMtMhVY3Ll/wuyoyZG/5K5D9sOa7w==
X-Received: by 2002:a05:6a00:3c94:b0:706:705f:313a with SMTP id d2e1a72fcca58-70ce4f9e29fmr4286273b3a.12.1721268726342;
        Wed, 17 Jul 2024 19:12:06 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecc946dsm8832611b3a.192.2024.07.17.19.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 19:12:05 -0700 (PDT)
Message-ID: <cfe6f875-67c4-4b37-b54f-609f820f582d@gmail.com>
Date: Thu, 18 Jul 2024 10:12:03 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [alexshi:mmunstable 24/24] arch/s390/mm/pgtable.c:589:17: error:
 assignment to 'pgtable_t' {aka 'pte_t *'} from incompatible pointer type
 'struct ptdesc *'
To: kernel test robot <lkp@intel.com>, "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
References: <202407172139.U12LktqS-lkp@intel.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <202407172139.U12LktqS-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks a lot for the report! It's a great job!

but when I try to reproduce the problem according instructions from
https://download.01.org/0day-ci/archive/20240717/202407172118.aEQxv67s-lkp@intel.com/reproduce
I hit the 0day path issue:
$ COMPILER=clang-19 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=s390 allmodconfig
Please set COMPILER_INSTALL_PATH to specify compiler install path
E.g. COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-17 make.cross ARCH=x86_64

where I could get or set 0day dir?

Thanks
Alex

On 7/17/24 9:18 PM, kernel test robot wrote:
> tree:   https://github.com/alexshi/linux.git mmunstable
> head:   a158e7e787b56bc7f1b4bb582a0e8ec65cacec4b
> commit: a158e7e787b56bc7f1b4bb582a0e8ec65cacec4b [24/24] mm/pgtable: convert ptdesc.pmd_huge_pte to ptdesc
> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240717/202407172139.U12LktqS-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407172139.U12LktqS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407172139.U12LktqS-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/s390/mm/pgtable.c: In function 'pgtable_trans_huge_deposit':
>>> arch/s390/mm/pgtable.c:577:32: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Wincompatible-pointer-types]
>      577 |         pmd_huge_pte(mm, pmdp) = pgtable;
>          |                                ^
>    arch/s390/mm/pgtable.c: In function 'pgtable_trans_huge_withdraw':
>>> arch/s390/mm/pgtable.c:589:17: error: assignment to 'pgtable_t' {aka 'pte_t *'} from incompatible pointer type 'struct ptdesc *' [-Wincompatible-pointer-types]
>      589 |         pgtable = pmd_huge_pte(mm, pmdp);
>          |                 ^
>>> arch/s390/mm/pgtable.c:594:40: error: assignment to 'struct ptdesc *' from incompatible pointer type 'pte_t *' [-Wincompatible-pointer-types]
>      594 |                 pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
>          |                                        ^
> 
> 
> vim +589 arch/s390/mm/pgtable.c
> 
> d08de8e2d86744 Gerald Schaefer    2016-07-04  563  
> 75077afbec1ac8 Gerald Schaefer    2012-10-08  564  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> 6b0b50b0617fad Aneesh Kumar K.V   2013-06-05  565  void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
> 6b0b50b0617fad Aneesh Kumar K.V   2013-06-05  566  				pgtable_t pgtable)
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  567  {
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  568  	struct list_head *lh = (struct list_head *) pgtable;
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  569  
> ec66ad66a0de87 Martin Schwidefsky 2014-02-12  570  	assert_spin_locked(pmd_lockptr(mm, pmdp));
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  571  
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  572  	/* FIFO */
> c389a250ab4cfa Kirill A. Shutemov 2013-11-14  573  	if (!pmd_huge_pte(mm, pmdp))
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  574  		INIT_LIST_HEAD(lh);
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  575  	else
> c389a250ab4cfa Kirill A. Shutemov 2013-11-14  576  		list_add(lh, (struct list_head *) pmd_huge_pte(mm, pmdp));
> c389a250ab4cfa Kirill A. Shutemov 2013-11-14 @577  	pmd_huge_pte(mm, pmdp) = pgtable;
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  578  }
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  579  
> 6b0b50b0617fad Aneesh Kumar K.V   2013-06-05  580  pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  581  {
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  582  	struct list_head *lh;
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  583  	pgtable_t pgtable;
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  584  	pte_t *ptep;
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  585  
> ec66ad66a0de87 Martin Schwidefsky 2014-02-12  586  	assert_spin_locked(pmd_lockptr(mm, pmdp));
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  587  
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  588  	/* FIFO */
> c389a250ab4cfa Kirill A. Shutemov 2013-11-14 @589  	pgtable = pmd_huge_pte(mm, pmdp);
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  590  	lh = (struct list_head *) pgtable;
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  591  	if (list_empty(lh))
> c389a250ab4cfa Kirill A. Shutemov 2013-11-14  592  		pmd_huge_pte(mm, pmdp) = NULL;
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  593  	else {
> c389a250ab4cfa Kirill A. Shutemov 2013-11-14 @594  		pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  595  		list_del(lh);
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  596  	}
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  597  	ptep = (pte_t *) pgtable;
> b8e3b37900a57f Heiko Carstens     2022-02-21  598  	set_pte(ptep, __pte(_PAGE_INVALID));
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  599  	ptep++;
> b8e3b37900a57f Heiko Carstens     2022-02-21  600  	set_pte(ptep, __pte(_PAGE_INVALID));
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  601  	return pgtable;
> 9501d09fa3c4ca Gerald Schaefer    2012-10-08  602  }
> 75077afbec1ac8 Gerald Schaefer    2012-10-08  603  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> 1e133ab296f3ff Martin Schwidefsky 2016-03-08  604  
> 
> :::::: The code at line 589 was first introduced by commit
> :::::: c389a250ab4cfa4a3775d9f2c45271618af6d5b2 mm, thp: do not access mm->pmd_huge_pte directly
> 
> :::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
> 
