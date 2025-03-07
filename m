Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37D61A3146
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741332214; cv=none; b=cy2VtZy92CsctH2ykyVKnAioKZb/TPw1qq59gPsxiry0l7xGGD0pyqeWSM/g5ya9LONB/AFjJ7VIgMlFs9e7qje3Lbo7ngcq3MnDXrVtfnkuN9HifBUXYw33p0q0019oMAv7imU3KSFMBI9n7CC7dRb/6+X3XS3l+oHMTZwVJUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741332214; c=relaxed/simple;
	bh=89ogA/XPFlCQZzMCO32lLlxodG9UI3Wb7VLr/O4REPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBONIcO5qvPDkUZi7PlkbUJA4ZX22i71f+cPSVec923fzmj6TKOILtp0887Wk+wCS29lBIFg2klmfJHJfxYoiPJH2uSlkNYCsaHGIDKdOwAhcUlCXG6p1A08Nu9sUzDhF90eaErV+uYQtSHvkBjHzaC0LToxysHA0z6ROLi+sno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNd10nxl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNd10nxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741332213; x=1772868213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=89ogA/XPFlCQZzMCO32lLlxodG9UI3Wb7VLr/O4REPE=;
  b=MNd10nxl28alFagNMgJaX5mUB5Q20k0OjA8DheihW/61yKjApX2/NUWd
   ruOlppM0oV9YQyhTrdy+dwbdM1SUuYwIvWtTlCGsJSmc5+eUG/+6hBuRQ
   WXoHpAmeKvDcH1hjlRryRmVkFqCJ0fl2yErr33FTRlUxRQquXp80L6kSm
   6ZupUxpvo20SkeBLVvzpO1m4a0MZ6QAhiu4sWdV9G0DeRv0wsSH6XzaAc
   AgztdoKECPzccIKhudjr6Hp3AlHwsUKdMj3DYn9pj8AVcyF+xoPwm6yT/
   FFWDcwpNjyF7uGatN2Qvi5Q1U6RTtLfJJX3eEr79zwta7dLHut7TUX3nI
   Q==;
X-CSE-ConnectionGUID: CykYQhUhT0ydA3DAl1oppg==
X-CSE-MsgGUID: /Is3F5lBToiGGLXXYP6UNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52577634"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="52577634"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 23:23:31 -0800
X-CSE-ConnectionGUID: GyMV3pmRT1qAy7Rk4lB+UQ==
X-CSE-MsgGUID: O6dY2zykSYGSoabnwFNqYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150197413"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Mar 2025 23:23:30 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqS3M-00007R-00;
	Fri, 07 Mar 2025 07:23:28 +0000
Date: Fri, 7 Mar 2025 15:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] mm: kpromoted: Hot page info collection and
 promotion daemon
Message-ID: <202503071523.f89emNyA-lkp@intel.com>
References: <20250306054532.221138-3-bharata@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306054532.221138-3-bharata@amd.com>

Hi Bharata,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/x86/mm linus/master v6.14-rc5]
[cannot apply to akpm-mm/mm-everything next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/mm-migrate-Allow-misplaced-migration-without-VMA-too/20250306-134949
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250306054532.221138-3-bharata%40amd.com
patch subject: [RFC PATCH 2/4] mm: kpromoted: Hot page info collection and promotion daemon
config: s390-randconfig-001-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071523.f89emNyA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071523.f89emNyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071523.f89emNyA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/kpromoted.c: In function 'kpromoted_record_access':
>> mm/kpromoted.c:158:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     158 |         int ret, bkt;
         |             ^~~


vim +/ret +158 mm/kpromoted.c

   147	
   148	/*
   149	 * Called by subsystems that generate page hotness/access information.
   150	 *
   151	 * Records the memory access info for futher action by kpromoted.
   152	 */
   153	int kpromoted_record_access(u64 pfn, int nid, int src, unsigned long now)
   154	{
   155		struct page_hotness_info *phi;
   156		struct page *page;
   157		struct folio *folio;
 > 158		int ret, bkt;
   159	
   160		count_vm_event(KPROMOTED_RECORDED_ACCESSES);
   161	
   162		switch (src) {
   163		case KPROMOTED_HW_HINTS:
   164			count_vm_event(KPROMOTED_RECORD_HWHINTS);
   165			break;
   166		case KPROMOTED_PGTABLE_SCAN:
   167			count_vm_event(KPROMOTED_RECORD_PGTSCANS);
   168			break;
   169		default:
   170			break;
   171		}
   172	
   173		/*
   174		 * Record only accesses from lower tiers.
   175		 * Assuming node having CPUs as toptier for now.
   176		 */
   177		if (node_is_toptier(pfn_to_nid(pfn))) {
   178			count_vm_event(KPROMOTED_RECORD_TOPTIER);
   179			return 0;
   180		}
   181	
   182		page = pfn_to_online_page(pfn);
   183		if (!page || is_zone_device_page(page))
   184			return 0;
   185	
   186		folio = page_folio(page);
   187		if (!folio_test_lru(folio))
   188			return 0;
   189	
   190		bkt = hash_min(pfn, KPROMOTED_HASH_ORDER);
   191		mutex_lock(&page_hotness_lock[bkt]);
   192		phi = kpromoted_lookup(pfn, bkt, now);
   193		if (!phi) {
   194			ret = PTR_ERR(phi);
   195			goto out;
   196		}
   197	
   198		if ((phi->last_update - now) > msecs_to_jiffies(KPROMOTED_FREQ_WINDOW)) {
   199			/* New window */
   200			phi->frequency = 1; /* TODO: Factor in the history */
   201			phi->last_update = now;
   202		} else {
   203			phi->frequency++;
   204		}
   205		phi->recency = now;
   206	
   207		/*
   208		 * TODOs:
   209		 * 1. Source nid is hard-coded for some temperature sources
   210		 * 2. Take action if hot_node changes - may be a shared page?
   211		 * 3. Maintain node info for every access within the window?
   212		 */
   213		phi->hot_node = (nid == NUMA_NO_NODE) ? 1 : nid;
   214		mutex_unlock(&page_hotness_lock[bkt]);
   215	out:
   216		return 0;
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
