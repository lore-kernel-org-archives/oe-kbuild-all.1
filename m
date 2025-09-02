Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FD02BE04B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 13:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818907; cv=none; b=uM4s44SFl+Y5w9sf3H4jaI+XJ/Z95y/uTNUC0RjIj3JoFcWXrcDpw9Mc6KdWfSx1+Pksxa98ONgPw6Mft9146kFmz4oH0X50hhw31ECezkLRqa2t8xDjlclCdRG0HfMfOo0KATsihfGeWhLaCKtytv66dApi0S+rxvneRc7QxUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818907; c=relaxed/simple;
	bh=OQEPMw2ajhV1AaTnRDYGn0gaJhrUogUQxim76v7TX18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oP7Z0ZPQRjmb4eg6Awu838kDUnq6RZyQCQuCW0bh+O4Rt/L/ykt5+sbkYpLWAb+Crsx3WrHt08IusUKYLdneSK7cwq2loWGkZFOzAWV2ny9eSGRUcA6qbKPMnVwWNaVvPe0LMlvmUSsHIHZZTOYQeFQs7dMu+HD3LtNuANBbv6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5CQFBXX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5CQFBXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756818905; x=1788354905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OQEPMw2ajhV1AaTnRDYGn0gaJhrUogUQxim76v7TX18=;
  b=n5CQFBXX0L4NcBIWUC2DUdoRjwuIfhOVEuq7VeoNBqJu46TVCh0vNBvy
   F1K7H/ZU1smMQ+kKqV/E+qXy3LWUXB7awwtDIVh/78k6YiH0Mof8JXRx6
   qaN/8Mo59e7SZn1EkfT0VcF7xBe7fKYSSVkGxVxM95G7SkLAtrNELggp9
   tetQw5o5FiTEAPQ9Q2Rn8VagO+vhGPcOpfyIIAoYFbAdR67N5xOq3lrru
   Ar/3JUOxzFf3KNvRUnJtXWY1ITGafHP11Bo8sNNLBXE04+uwZJwVOMEop
   Ox0s+VmNkBfRkv8AKo9bq8q9XL/RABEkYQsKGr6Em9ixuezQGmJGlJNEn
   Q==;
X-CSE-ConnectionGUID: GX3O40dOTAi/JtB7sySYwA==
X-CSE-MsgGUID: 3CxQMuIwTLuqBVP3dz9/+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59157946"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59157946"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:15:04 -0700
X-CSE-ConnectionGUID: U1YYEEBtSg6quNqEARBa7A==
X-CSE-MsgGUID: j+fKM/z9RVGQoVcun+SqHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171644025"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Sep 2025 06:15:03 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utQqi-00022t-1i;
	Tue, 02 Sep 2025 13:15:00 +0000
Date: Tue, 2 Sep 2025 21:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 6/6] mm/memory_hotplug.c:452:12:
 warning: no previous prototype for function '__remove_pfn_range_from_zone'
Message-ID: <202509022133.YTmiMA07-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   119e72f374248c57f950f0658c1e1099b40e2ffa
commit: f5bc00581306fa4057d2e3a84b9a347c1ada021e [6/6] anolis: mm/memory_hotplug: refactor remove_pfn_range_from_zone()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250902/202509022133.YTmiMA07-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509022133.YTmiMA07-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509022133.YTmiMA07-lkp@intel.com/

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
