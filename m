Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB9C2EE981
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267954; cv=none; b=g1mmOUrwRY0oJkQ6fmXnvfVWKMOnlVGXZqsd2RFfmKTQi+h/zjPUBFCu5c5opZTAkBuz+1EtqOtjCbPusp4ln6ivEg+rS3fTI9PcbHn+8/R9qkFyQIdyLBl18GucQl3YYXj4874moFztXOE3OodaLVzwfhQ0i7jv9d0qpyIP/qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267954; c=relaxed/simple;
	bh=v4oN1Zbt/jqOeCuJzUI6GMQJVeCDE6fmJeTQzN10rck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=sQgY5Fy5GHmLjT2bmLYYWlkfb4CHoPyknYLY//tdrfKh6xmUm3Gmj8y1QtqZ4jvustMcItUazZKaLMyL/LRrPJD9tG0MOlgSU9OR5NlBK3mRZUvGEHdlw30ecYF9JfswNnBRCJKEHAW+VaqNLm16S5Pvxu9CIGRusecvq02MohE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Av3JyJXc; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Av3JyJXc"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4067ac8f6cdso5082946b6e.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750267951; x=1750872751; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JPaDHCf4QQfYtlFAEXP1n0ACjJsy8xyFFkSONW+4dVI=;
        b=Av3JyJXcEzLGgHLmEe5o3TPiLsK0a7T90yuBRZL4dTvm2O3mJkQh4nykDLZ0ZVQrqG
         2t+a2LcIscI0EwCN8xGNdffEyc+t7/UF2h1mrKwby/G3Wjetb/tBYndpymzrGge/N12y
         Rpwf5DHvdz789O4NiU9DIGCkk9ZksKwM+gINo+ke5GBJbxuSAoUYIs48wibW2PJdsvrF
         r6pdkMiyfWLlG5592g/u/KzGIxve3t8DIsUKS2Q0j9/Pf82cEzqcaXm92XGd9P1xCUOV
         Gqh+b39bZ6TjUwlVqxpYs3qgzsSHVhJNu9qVAPrP3Sbusq11E/TIV9mmK34TDXwEmK2q
         DTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267951; x=1750872751;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPaDHCf4QQfYtlFAEXP1n0ACjJsy8xyFFkSONW+4dVI=;
        b=hi6Be984g9/4xKqCFcC7otbP2FzFE+VwN/cYxfqqDUCImL0B03MMFNxbeSNqIJoa8t
         th6OEhRJvm76omsvCt55rRN1eBeZ/6KsMGpHU+owDscMDEDL3rWKxaLW0WoChMxJiQOZ
         Vua7/GnTnKajaLIuTJp7xoe6R++RA9NviEwZ/eInDdKib82EHkpY8MDB3wQ7y9TbUARC
         sH92R6jjzxj3VIWZhtgzdas8oOONoNGpsWiB4IoAAYVce/ir5nGGqI65rXM6N4mUioQI
         cT3mps3+imTfQn2vPjphLBmOXnn8H/C6fR6ypCb1T6rva1PMyf9lnry3bjKFMXJqd7di
         Zn3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYLh9H/JeEbzPJwu+9aZ7jn4EnYJ2ihVyiMmWrKjSHf7ilwPJSGEtyvBVbAEKZQ0/EJfNuG7M7Gi29MfNP@lists.linux.dev
X-Gm-Message-State: AOJu0YzOAK6PRyZGaRnxvVqjI22o3s7qKtt3rXkAoxpp3j3+04lduMhw
	jL6v9i19bqw6ROJxU79no/RR11rlZD3qxn6ANEvHVn3hyuMkT0vDT/vFY8Xnnn2A0qA=
X-Gm-Gg: ASbGncsV3ElnShyrhaZd9dmR9qFxyxDtQI4+G2U8I0yRVtoEIDP3P8+4lC4suQMqu6E
	JGf8zEvOUEIyKyKnglzObIjulGMzqtfoc6UxyX6mb7QkZ9A4GHPrS0uBe4zy7tJbQSCsAS45ob/
	oNiBI7prN5i+hfmOK+WoHt1T+n3R7N9ap+IzeKDQac5gv8yRh/P7ZiN5uir7ymOJ82oefmGmLvi
	pMJycNplcKOT+U3GjovlfUREODZUemCG0fAvdwoFRUec02iAlBdzzHMAPBy0TjtRFLLO+0HESjM
	WC4d3omTXBcPr2j5a7ozEbkKTr03B8aX2OVn767HjAV5sVtRf6W/fI6T9V2ucJ0wtVWe+w==
X-Google-Smtp-Source: AGHT+IEhmsXj/9aFuinmgp9fFM5zxL8AzdLs118MWezycsaLkbKoWiwnYgYHLgU6A9s7/1JQmPa7zA==
X-Received: by 2002:a05:6808:1523:b0:403:5150:c348 with SMTP id 5614622812f47-40a7c11902fmr11343414b6e.4.1750267951380;
        Wed, 18 Jun 2025 10:32:31 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a740c2484sm2410989b6e.13.2025.06.18.10.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:32:30 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:32:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, Hugh Dickins <hughd@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
	Jeremy Fitzhardinge <jeremy@goop.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU
 mode
Message-ID: <0be7d42e-5898-4b94-829b-59c661c2f07b@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Gordeev/mm-Cleanup-apply_to_pte_range-routine/20250613-013835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev%40linux.ibm.com
patch subject: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU mode
config: x86_64-randconfig-161-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132017.T1l1l6ME-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506132017.T1l1l6ME-lkp@intel.com/

smatch warnings:
mm/vmalloc.c:552 vmap_pages_pte_range() warn: inconsistent returns 'global &init_mm.page_table_lock'.

vim +552 mm/vmalloc.c

0a264884046f1ab Nicholas Piggin   2021-04-29  517  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
2ba3e6947aed9bb Joerg Roedel      2020-06-01  518  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
2ba3e6947aed9bb Joerg Roedel      2020-06-01  519  		pgtbl_mod_mask *mask)
^1da177e4c3f415 Linus Torvalds    2005-04-16  520  {
^1da177e4c3f415 Linus Torvalds    2005-04-16  521  	pte_t *pte;
^1da177e4c3f415 Linus Torvalds    2005-04-16  522  
db64fe02258f150 Nicholas Piggin   2008-10-18  523  	/*
db64fe02258f150 Nicholas Piggin   2008-10-18  524  	 * nr is a running index into the array which helps higher level
db64fe02258f150 Nicholas Piggin   2008-10-18  525  	 * callers keep track of where we're up to.
db64fe02258f150 Nicholas Piggin   2008-10-18  526  	 */
db64fe02258f150 Nicholas Piggin   2008-10-18  527  
2ba3e6947aed9bb Joerg Roedel      2020-06-01  528  	pte = pte_alloc_kernel_track(pmd, addr, mask);
^1da177e4c3f415 Linus Torvalds    2005-04-16  529  	if (!pte)
^1da177e4c3f415 Linus Torvalds    2005-04-16  530  		return -ENOMEM;
44562c71e2cfc9e Ryan Roberts      2025-04-22  531  
dac0cc793368851 Alexander Gordeev 2025-06-12  532  	spin_lock(&init_mm.page_table_lock);
44562c71e2cfc9e Ryan Roberts      2025-04-22  533  	arch_enter_lazy_mmu_mode();
44562c71e2cfc9e Ryan Roberts      2025-04-22  534  
^1da177e4c3f415 Linus Torvalds    2005-04-16  535  	do {
db64fe02258f150 Nicholas Piggin   2008-10-18  536  		struct page *page = pages[*nr];
db64fe02258f150 Nicholas Piggin   2008-10-18  537  
c33c794828f2121 Ryan Roberts      2023-06-12  538  		if (WARN_ON(!pte_none(ptep_get(pte))))
db64fe02258f150 Nicholas Piggin   2008-10-18  539  			return -EBUSY;
db64fe02258f150 Nicholas Piggin   2008-10-18  540  		if (WARN_ON(!page))
^1da177e4c3f415 Linus Torvalds    2005-04-16  541  			return -ENOMEM;
4fcdcc12915c707 Yury Norov        2022-04-28  542  		if (WARN_ON(!pfn_valid(page_to_pfn(page))))
4fcdcc12915c707 Yury Norov        2022-04-28  543  			return -EINVAL;

These error paths don't unlock &init_mm.page_table_lock?

4fcdcc12915c707 Yury Norov        2022-04-28  544  
^1da177e4c3f415 Linus Torvalds    2005-04-16  545  		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
db64fe02258f150 Nicholas Piggin   2008-10-18  546  		(*nr)++;
^1da177e4c3f415 Linus Torvalds    2005-04-16  547  	} while (pte++, addr += PAGE_SIZE, addr != end);
44562c71e2cfc9e Ryan Roberts      2025-04-22  548  
44562c71e2cfc9e Ryan Roberts      2025-04-22  549  	arch_leave_lazy_mmu_mode();
dac0cc793368851 Alexander Gordeev 2025-06-12  550  	spin_unlock(&init_mm.page_table_lock);
2ba3e6947aed9bb Joerg Roedel      2020-06-01  551  	*mask |= PGTBL_PTE_MODIFIED;
^1da177e4c3f415 Linus Torvalds    2005-04-16 @552  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  553  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

