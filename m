Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9527FBAC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 06:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745043480; cv=none; b=oCXTFa8aoDMkpsNAJMozqZ/nZjpUu6wmLh3czcbmD/rBh1PkTgDARkDcg5uWzbiydTPBtaFzxk6sPSZH3HC9hdVh767C09jCMNW7q8QohCVAgUuxZxHWihq12BjhDveSQ4O+MlDCcgirCwMF/nwFhLckRC0k8ai1cpEh7UTB27o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745043480; c=relaxed/simple;
	bh=TChxUsFKpPS8INXefsXoLUL2SpsAiDoMkhdMySBMcuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u+lyppiFFe/EQoSYKAb0ns5bX9EicnwEjjYgUiqXx7lGg3MKjwf9jQBC6U+6rBRkO+BpSkiqe1UV56V1gltgoRlUwPko+VljNPfxIW3HEwiOrwywmtfSBQrhkSfWpxNCanix23FYaVx5IXLWVoytLeZMaWsHx7KsWtjRmxrSa0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+1JFK9V; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+1JFK9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745043478; x=1776579478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TChxUsFKpPS8INXefsXoLUL2SpsAiDoMkhdMySBMcuE=;
  b=X+1JFK9VI3Xlxm/KJE0qk4KM7kHisli4JGWJQxjT6zZ106XheQl6w3qB
   eMyu6BUbTk1rghf/A1jeNW3oTQzwRCUaytC5oeoe+fKpJulVKlxn6pKAx
   qoFuHvJzs3pfgB0t+VOIrK+6RpJrEt14sC3c/fI3jeOyydH/EauNfuCE8
   Pt4hZ/d1NHnNTV/BhFL4LBSQeZs4ztCnha5Z1UleER9GfdVwBdB2EWH29
   ybu8SA9GzQn2tnc8MksCtdJdlIkRj4f4zGXWwq1Y4igOIdWGeTp+hnLcH
   qZJA7obfbKk3nHNCZ+T2X2BdINpUeO6iRtCaxl5iHqIIJ716gMqaM1nIm
   A==;
X-CSE-ConnectionGUID: fWCB7FMxQ9++hzInKwwhpA==
X-CSE-MsgGUID: X3QNfrQaTTqP3rH+38cwyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="58044781"
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="58044781"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 23:17:58 -0700
X-CSE-ConnectionGUID: J6gapLXOTBaAEJUuby379Q==
X-CSE-MsgGUID: LYN41tKnTEa/Zq+2ULL5rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="132172044"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Apr 2025 23:17:56 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u61WU-0003eP-2R;
	Sat, 19 Apr 2025 06:17:54 +0000
Date: Sat, 19 Apr 2025 14:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 1/22] mm/page_isolation.c:574:71: error:
 expected ')' before 'PageOfflineRestorable'
Message-ID: <202504191408.jpdX9oDa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   c0ca4eb396d25b10b9c749411814cff272b05065
commit: 6beb1db008901362ed89cc414af874229d4cef95 [1/22] mm/memory_hotplug: PG_offline_restorable for offlining memory with PageOffline pages
config: csky-randconfig-002-20250419 (https://download.01.org/0day-ci/archive/20250419/202504191408.jpdX9oDa-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504191408.jpdX9oDa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504191408.jpdX9oDa-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_isolation.c: In function '__test_page_isolated_in_pageblock':
>> mm/page_isolation.c:574:71: error: expected ')' before 'PageOfflineRestorable'
     574 |                 else if ((flags & MEMORY_OFFLINE) && PageOffline(page)
         |                         ~                                             ^
         |                                                                       )
     575 |                          PageOfflineRestorable(page))
         |                          ~~~~~~~~~~~~~~~~~~~~~                         


vim +574 mm/page_isolation.c

   522	
   523	/**
   524	 * undo_isolate_page_range - undo effects of start_isolate_page_range()
   525	 * @start_pfn:		The first PFN of the isolated range
   526	 * @end_pfn:		The last PFN of the isolated range
   527	 * @migratetype:	New migrate type to set on the range
   528	 *
   529	 * This finds every MIGRATE_ISOLATE page block in the given range
   530	 * and switches it to @migratetype.
   531	 */
   532	void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
   533				    int migratetype)
   534	{
   535		unsigned long pfn;
   536		struct page *page;
   537		unsigned long isolate_start = pageblock_start_pfn(start_pfn);
   538		unsigned long isolate_end = pageblock_align(end_pfn);
   539	
   540		for (pfn = isolate_start;
   541		     pfn < isolate_end;
   542		     pfn += pageblock_nr_pages) {
   543			page = __first_valid_page(pfn, pageblock_nr_pages);
   544			if (!page || !is_migrate_isolate_page(page))
   545				continue;
   546			unset_migratetype_isolate(page, migratetype);
   547		}
   548	}
   549	/*
   550	 * Test all pages in the range is free(means isolated) or not.
   551	 * all pages in [start_pfn...end_pfn) must be in the same zone.
   552	 * zone->lock must be held before call this.
   553	 *
   554	 * Returns the last tested pfn.
   555	 */
   556	static unsigned long
   557	__test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
   558					  int flags)
   559	{
   560		struct page *page;
   561	
   562		while (pfn < end_pfn) {
   563			page = pfn_to_page(pfn);
   564			if (PageBuddy(page))
   565				/*
   566				 * If the page is on a free list, it has to be on
   567				 * the correct MIGRATE_ISOLATE freelist. There is no
   568				 * simple way to verify that as VM_BUG_ON(), though.
   569				 */
   570				pfn += 1 << buddy_order(page);
   571			else if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
   572				/* A HWPoisoned page cannot be also PageBuddy */
   573				pfn++;
 > 574			else if ((flags & MEMORY_OFFLINE) && PageOffline(page)
   575				 PageOfflineRestorable(page))
   576				/*
   577				 * If the page is a restorable PageOffline() page,
   578				 * we can offline the memory block, as the driver will
   579				 * re-discover them when re-onlining the memory.
   580				 */
   581				pfn++;
   582			else
   583				break;
   584		}
   585	
   586		return pfn;
   587	}
   588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
