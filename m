Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD661B424F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 04:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764651602; cv=none; b=Aa8sJzezguBNhfNvm8TajEmPyYGGbdYC50j5NA9MrG6vh7++niBoyiuU4+iPM8qoshdqbGrS+AKXjfiYCl7sAi6Qk5B6TqFcrq21WizToU7F0J0eZWEnzKZLdCBDjCMF+Q6Yz8TyMDkM65P4xsG5EjuWKd13uIUPElcq5tSslNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764651602; c=relaxed/simple;
	bh=kOegLafmANCuIAWKGeRjvcLC5FhDcJdmhZCkPsJUKgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wk4Ny0g8QM/0MPZGqpe8b66u/JciUK/n3pkJ4Fej/Iqz2SXf/GPS2b7BecB8SF4XxO5CQNL6hvrd3gadhSIBd545t1k0pw3GpfpiMFdZwPDz+c88fxiv5DC87yiX4h0chv7re7EI1h3F/F1M2As89XgwalsSx8fXrGRVODX31Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4cLMIgM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4cLMIgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764651600; x=1796187600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kOegLafmANCuIAWKGeRjvcLC5FhDcJdmhZCkPsJUKgA=;
  b=S4cLMIgMBiTBQ4N21/AP00gcjKXfE7PrRSquGpl1/PaMZ9vHgx4mMKTp
   eaVX63rlU9jJhalzCvs93zbQgpU1yrXr3tfrcWrIfvQFd5xqw0fnC+sg0
   BRM5LOMjZEgD3pNik+RnbwvtG6oDspQ9qUfd0BH4CmjAsID/Jfcr7qMKd
   YMty8cIv/qjZqpEkTm6/yyVt1WK8otd9i3X1Y3YRuF5o+PQf06IHGYLXN
   3lVYMK1COrTSriZO2XS05LnpnKkBEvs4W83TV/o/I5MUFgHSOeO/Ae84d
   y8l58+Q9o3Sv9Uipj0KN7k5jDsPPoZ8f6TJK0/a6V84QB27WKWUEPF2VU
   Q==;
X-CSE-ConnectionGUID: 5yJSt+WKS4C7SjgdQlESVQ==
X-CSE-MsgGUID: N5VbQidpQ1+dTbVel/XFsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78072890"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="78072890"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 20:59:58 -0800
X-CSE-ConnectionGUID: RuQayqR3RsagLLx0d24zfw==
X-CSE-MsgGUID: eeBb2CuSRkOsN5nFONW/pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="194367372"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Dec 2025 20:59:56 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQIUU-000000009Q9-0oda;
	Tue, 02 Dec 2025 04:59:54 +0000
Date: Tue, 2 Dec 2025 12:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] mm/memory_hotplug.c:452:12:
 warning: no previous prototype for function '__remove_pfn_range_from_zone'
Message-ID: <202512021204.32jcdmBi-lkp@intel.com>
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
head:   fb3dc582fdefab0d6ab237b393b1e7e7f65dc78c
commit: f5bc00581306fa4057d2e3a84b9a347c1ada021e [0/1] anolis: mm/memory_hotplug: refactor remove_pfn_range_from_zone()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251202/202512021204.32jcdmBi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021204.32jcdmBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021204.32jcdmBi-lkp@intel.com/

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
