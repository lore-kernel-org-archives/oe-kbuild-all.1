Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56335E571
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 03:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738293791; cv=none; b=fdvuczG3HdztLDcfcQoESO+JkBwDA1pWfGzv7WMFsEc1tV7JXFHU7iDDYRfSa2Z3U6ktwimaUcyG4VEWCgTXO+CjHjrT1Gstmpk6YzrJ5G0EVwh75zjL4Gu0T4JRSupNCLOfQBKKmHV84qc66F6xAnszzUDGuTNyBiid70Y6bDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738293791; c=relaxed/simple;
	bh=5VozoLr8tQW3am7yxHe1qli+c6RGvZGqPIhVvMrmPxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2Yr21Igfoq0dhgqWXtNzEkfD0MX1VOX/Yuc9He7sfj0uKvPRMaqk6Xi2P9fJp9paK27uZrVk3370NgOUCT0u9gh2Ul47Zq4/4iCxBvnSEUfB4CrG1mHrHSO/Ubzu83UwJjOGyliry2KqWSU590iBS8INn4iVZBl52sZ/oNJTpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3R0CN8o; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3R0CN8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738293789; x=1769829789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5VozoLr8tQW3am7yxHe1qli+c6RGvZGqPIhVvMrmPxA=;
  b=S3R0CN8oQ3USexAhggSuqsLXQ//PevO0NeTuZdERAD3wS7sSDCRBC5o7
   TMHXuC4PTbI/5kdM7UdoDU/zsUNmbGCGXtVzN0jB1CkSYAqHni0iyD0rv
   LPE8u+OgK1GdBbm3eewbIsNf1ap/PXFfpi1vm78OlMHEZ7JOmfowPNQze
   70LyM0Pqhib6JCSTUQp+Dgpp3FNA8qSi1vct4NitBCFBdMgdhftaLtYKU
   jd4iN4TukfvJi23LD7DEufUKbcB0jHGGBDBTX4qmKe/GaInhMbaYTpCLK
   JBbwqQjQ1KR0BO0V3zO+STaBiya3tstVMEwEuTqSfikCD3cQhvWKYnCxH
   w==;
X-CSE-ConnectionGUID: X55k0eHjQnakatqOON+/AQ==
X-CSE-MsgGUID: Z+fIV9k2R9eCawbXV1e7gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38891321"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="38891321"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 19:23:08 -0800
X-CSE-ConnectionGUID: OOcWRf14RsuM2DlMknQG4Q==
X-CSE-MsgGUID: PrwJDTp9RDq9gEWz0jA8/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="114520898"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Jan 2025 19:23:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdhcR-000lpn-0X;
	Fri, 31 Jan 2025 03:22:59 +0000
Date: Fri, 31 Jan 2025 11:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: Frank van der Linden <fvdl@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 61/88] mm/cma.c:811: warning: Function
 parameter or struct member 'gfp' not described in '__cma_alloc'
Message-ID: <202501311137.rMiQNfi3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   495206a68b359eb6117d0860861578113bbb94e7
commit: 77cbd63e91fa6c5f6157a30e61a380b6c47c1443 [61/88] mm, cma: support multiple contiguous ranges, if requested
config: x86_64-buildonly-randconfig-001-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311137.rMiQNfi3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311137.rMiQNfi3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311137.rMiQNfi3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/cma.c:811: warning: Function parameter or struct member 'gfp' not described in '__cma_alloc'
>> mm/cma.c:811: warning: expecting prototype for cma_alloc(). Prototype was for __cma_alloc() instead


vim +811 mm/cma.c

   798	
   799	/**
   800	 * cma_alloc() - allocate pages from contiguous area
   801	 * @cma:   Contiguous memory region for which the allocation is performed.
   802	 * @count: Requested number of pages.
   803	 * @align: Requested alignment of pages (in PAGE_SIZE order).
   804	 * @no_warn: Avoid printing message about failed allocation
   805	 *
   806	 * This function allocates part of contiguous memory on specific
   807	 * contiguous memory area.
   808	 */
   809	static struct page *__cma_alloc(struct cma *cma, unsigned long count,
   810			       unsigned int align, gfp_t gfp)
 > 811	{
   812		struct page *page = NULL;
   813		int ret = -ENOMEM, r;
   814		unsigned long i;
   815		const char *name = cma ? cma->name : NULL;
   816	
   817		trace_cma_alloc_start(name, count, align);
   818	
   819		if (!cma || !cma->count)
   820			return page;
   821	
   822		pr_debug("%s(cma %p, name: %s, count %lu, align %d)\n", __func__,
   823			(void *)cma, cma->name, count, align);
   824	
   825		if (!count)
   826			return page;
   827	
   828		for (r = 0; r < cma->nranges; r++) {
   829			page = NULL;
   830	
   831			ret = cma_range_alloc(cma, &cma->ranges[r], count, align,
   832					       &page, gfp);
   833			if (ret != -EBUSY || page)
   834				break;
   835		}
   836	
   837		/*
   838		 * CMA can allocate multiple page blocks, which results in different
   839		 * blocks being marked with different tags. Reset the tags to ignore
   840		 * those page blocks.
   841		 */
   842		if (page) {
   843			for (i = 0; i < count; i++)
   844				page_kasan_tag_reset(nth_page(page, i));
   845		}
   846	
   847		if (ret && !(gfp & __GFP_NOWARN)) {
   848			pr_err_ratelimited("%s: %s: alloc failed, req-size: %lu pages, ret: %d\n",
   849					   __func__, cma->name, count, ret);
   850			cma_debug_show_areas(cma);
   851		}
   852	
   853		pr_debug("%s(): returned %p\n", __func__, page);
   854		trace_cma_alloc_finish(name, page ? page_to_pfn(page) : 0,
   855				       page, count, align, ret);
   856		if (page) {
   857			count_vm_event(CMA_ALLOC_SUCCESS);
   858			cma_sysfs_account_success_pages(cma, count);
   859		} else {
   860			count_vm_event(CMA_ALLOC_FAIL);
   861			cma_sysfs_account_fail_pages(cma, count);
   862		}
   863	
   864		return page;
   865	}
   866	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
