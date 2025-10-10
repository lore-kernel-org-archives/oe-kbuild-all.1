Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F249E4A02
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 17:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760117950; cv=none; b=corClyjkj5bcSzik0IFvHkXwTx9zeDAH3p8FPxZ5Xf8XcO/Tx/4wqHX2MsZbJG5WwmcnBc3FsbBFuRfx84fnPwwCKc3i9H9nfuHcHcj3JLzRyFwHPRA02310KhgUiOYGG5eCXDYtAVKsLu4TBl+DQyfZ5f0F/ZVpT6eV9ju68jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760117950; c=relaxed/simple;
	bh=nWDcMAUXv3fwFMRJLpsTpLzixoGEIsMnETVSbR6DsVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAixoSo1KmrJTk3aHq0T+a01q4WZFY5/L6N5WBpUu2aoTFACEi34ZIAcDRauTbgzdTH/i/AnFRGdAyePD2qrfptdUBK+0rdDhfJkvgGbI8tSdDAcdd8/C91ipad1q98wOMMEHon6noHamOXZsE8yoNLmYtkc3RCAzEre3zpkhh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efqAuZeq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efqAuZeq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760117948; x=1791653948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWDcMAUXv3fwFMRJLpsTpLzixoGEIsMnETVSbR6DsVY=;
  b=efqAuZeqhQCthpp5noQinx9x/OvLemLaxsE25J/STN5grPmLqC2SQLxt
   UBhoByxRu3PiQAG1IEnf2Qs9kPm9Uogpmkb2XMz7spAiAxv7dA9oPWcgb
   H87Ui4QF5bCgJRRDOyfZbQlvK9tWaaA1znxYy3Enk5lqsolryFfVpo/HC
   801g0fjQMQ8yVqD8PN1S5qJPZqM8BGFfEQwU5Y87baCwp4dex1nc6YhMU
   FLWNv5QirNIJK8SZjCkaFselynh/rkkahiYQsAw+NOPrcZb9TLw2UIrE7
   x3TXrfMeToziI15HB4p9gWl82NZjuC6NLBr7zNKC8WnCsKvOIffJjGMcr
   A==;
X-CSE-ConnectionGUID: HQDwaMbfRqmB5RJUDHzk/w==
X-CSE-MsgGUID: 4FRESErETvybQOL2MKioaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="84965802"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="84965802"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 10:39:08 -0700
X-CSE-ConnectionGUID: rQ1n+hO/Q9GFsQ9L4Jcfqw==
X-CSE-MsgGUID: 2E3EZxepSSiKhLKA89pGzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="180278557"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Oct 2025 10:39:07 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7H55-000311-2r;
	Fri, 10 Oct 2025 17:39:03 +0000
Date: Sat, 11 Oct 2025 01:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/3] mm/memory_hotplug.c:452:12:
 warning: no previous prototype for function '__remove_pfn_range_from_zone'
Message-ID: <202510110109.dfLsypId-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   d3c7bd9fa87b650ea6f757905765429dadcae46a
commit: f5bc00581306fa4057d2e3a84b9a347c1ada021e [0/3] anolis: mm/memory_hotplug: refactor remove_pfn_range_from_zone()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251011/202510110109.dfLsypId-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110109.dfLsypId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110109.dfLsypId-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory_hotplug.c:452:12: warning: no previous prototype for function '__remove_pfn_range_from_zone' [-Wmissing-prototypes]
     452 | void __ref __remove_pfn_range_from_zone(struct zone *zone,
         |            ^
   mm/memory_hotplug.c:452:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     452 | void __ref __remove_pfn_range_from_zone(struct zone *zone,
         | ^
         | static 
   mm/memory_hotplug.c:681:12: warning: no previous prototype for function '__move_pfn_range_to_zone' [-Wmissing-prototypes]
     681 | void __ref __move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
         |            ^
   mm/memory_hotplug.c:681:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     681 | void __ref __move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
         | ^
         | static 
   mm/memory_hotplug.c:1013:6: warning: no previous prototype for function '__adjust_present_page_count' [-Wmissing-prototypes]
    1013 | void __adjust_present_page_count(struct page *page, struct memory_group *group,
         |      ^
   mm/memory_hotplug.c:1013:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1013 | void __adjust_present_page_count(struct page *page, struct memory_group *group,
         | ^
         | static 
   3 warnings generated.


vim +/__remove_pfn_range_from_zone +452 mm/memory_hotplug.c

   451	
 > 452	void __ref __remove_pfn_range_from_zone(struct zone *zone,
   453					      unsigned long start_pfn,
   454					      unsigned long nr_pages,
   455						  int phase)
   456	{
   457		const unsigned long end_pfn = start_pfn + nr_pages;
   458		struct pglist_data *pgdat = zone->zone_pgdat;
   459		unsigned long pfn, cur_nr_pages, flags;
   460	
   461		if (phase == MHP_PHASE_DEFAULT || phase == MHP_PHASE_DEFERRED) {
   462			/* Poison struct pages because they are now uninitialized again. */
   463			for (pfn = start_pfn; pfn < end_pfn; pfn += cur_nr_pages) {
   464				cond_resched();
   465	
   466				/* Select all remaining pages up to the next section boundary */
   467				cur_nr_pages =
   468					min(end_pfn - pfn, SECTION_ALIGN_UP(pfn + 1) - pfn);
   469				page_init_poison(pfn_to_page(pfn),
   470						sizeof(struct page) * cur_nr_pages);
   471			}
   472		}
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
