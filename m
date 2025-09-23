Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7560925DB0A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 06:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758610742; cv=none; b=qY8HyBEQI6J4qX1/f1N/cAjKpvE+pt5atO68RnCw6tpnM07MESMp+eDbppQ2zEa0xX548eGCuHhXKKDurcR8yuI7qtnjqmjXykOsM1mHVkkVv84qtd0ABeija+faxei4/ZzSwNMTQxwGWv5ML81BYoEpRH4vU4FTb8pm76p2EKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758610742; c=relaxed/simple;
	bh=CLmtoVzL0UJhLoz8naA0TiNiBXQbU1eFHbUeGuYjTPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PGhVafaeqw5dsoh3Ulbv3kMCjsiDVI3H+Jdi/spaBoAz4oAi/w60WQpV31/MsN0Zvby+39rhQKpvvx1cajPA5O9kxFy7AUxgDAS14rvNUmrM0hi9maT7bjbBXOONruNGaWgdoQsWoi1HVJj9coJRZ97bu8VLF9NvfTsQ0Fh6J+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EOjk6wfn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOjk6wfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758610741; x=1790146741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CLmtoVzL0UJhLoz8naA0TiNiBXQbU1eFHbUeGuYjTPg=;
  b=EOjk6wfn3DHh8/89+JswzO/XVAwvyYiQv6FRk+2NBFgH5nebw+6XK8hU
   RlMPPCBw87NZCQ3SuFbj7OTrjtd7iAeQgxyLkbWx0NBgWR/uSJLjl6Z30
   znj2Qf0iZjPcPBlVLYHNR2Z86k5wLwUCvvYFpPusiIpFZw5Zo1q2UhfsU
   dO8KYvaagMPuV66r/F6fTAI9xE4yVC9O5OAIbZ//LAb9PjE+WL68uSsMl
   99MfaL9qjNZBoL/aVmCz72xID9X1qaUIcVx3Gy0KXd9M5Wqu0pgh6Zzpi
   nogpY1RvGVvkJxwFDqSqaGGtSH1s5Gw1uDaaXTY6KPVUqhh4Qx91cxp2K
   g==;
X-CSE-ConnectionGUID: 1kMuowNgQ1iZoRuIAzJRNw==
X-CSE-MsgGUID: YYaXB0RDRquyczvq5U/vTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60102182"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="60102182"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 23:59:00 -0700
X-CSE-ConnectionGUID: NHOdp9F4SbGdDDcUEQG9jg==
X-CSE-MsgGUID: +OX9xfBPStaaY8cCVgQJuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="176284141"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2025 23:58:59 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0wzI-0002pn-2v;
	Tue, 23 Sep 2025 06:58:56 +0000
Date: Tue, 23 Sep 2025 14:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 123/123]
 drivers/iommu/intel/iommu.c:372:7: warning: no previous prototype for
 'alloc_pgtable_page'
Message-ID: <202509231429.QL1ykRQg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   9b3db453632000dc689f48634f7e31f84c375e37
commit: e42a203b2796650a4080fd1fb484d0f75459c3e0 [123/123] anolis: Revert "iommu/vt-d: Move inline helpers to header files"
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250923/202509231429.QL1ykRQg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231429.QL1ykRQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231429.QL1ykRQg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/intel/iommu.c:372:7: warning: no previous prototype for 'alloc_pgtable_page' [-Wmissing-prototypes]
     372 | void *alloc_pgtable_page(int node, gfp_t gfp)
         |       ^~~~~~~~~~~~~~~~~~
>> drivers/iommu/intel/iommu.c:383:6: warning: no previous prototype for 'free_pgtable_page' [-Wmissing-prototypes]
     383 | void free_pgtable_page(void *vaddr)
         |      ^~~~~~~~~~~~~~~~~


vim +/alloc_pgtable_page +372 drivers/iommu/intel/iommu.c

   371	
 > 372	void *alloc_pgtable_page(int node, gfp_t gfp)
   373	{
   374		struct page *page;
   375		void *vaddr = NULL;
   376	
   377		page = alloc_pages_node(node, gfp | __GFP_ZERO, 0);
   378		if (page)
   379			vaddr = page_address(page);
   380		return vaddr;
   381	}
   382	
 > 383	void free_pgtable_page(void *vaddr)
   384	{
   385		free_page((unsigned long)vaddr);
   386	}
   387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
