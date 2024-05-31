Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EBA39FF3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 18:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717179263; cv=none; b=gbdkhy/fxycl3ZNr8lmR0JjUvlQcnulPoLdET4AlmFfKrLySA/WFvIbexr+kBw3KurQ/BBLyfYFS+DnCFYIy91NR4YwviEDnJyj79od3K2JhCtkSBRobhk5qnyoIRDWW+kvGgVscpRNsJD4njh8F/+BnHwvuc+G2NFEOIoCRjgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717179263; c=relaxed/simple;
	bh=Hu8QRlzNnf1GqRPQ72pRWZ5tvGvhir2IFpTRyupcGMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rqxsB3D68Xil1XDo/1oMcmT8ZM3ew8O7qsuD8KQDfR23xFTXdCme8dq9DWSR8J7IDvIjc0eghGb9OPyxVURqz2+LITvmSwJLoMaaj97iHaPIGOZALYHC8qq/v6axFuexH1owWOgWDjnrodlE+ytMTrD30P28HOQiKGupwIxErCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8IiRLjs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8IiRLjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717179261; x=1748715261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hu8QRlzNnf1GqRPQ72pRWZ5tvGvhir2IFpTRyupcGMY=;
  b=E8IiRLjsEuFO08Vhk6BKauDfq7VJArI4OWnLF1UrMXMAWg5+gzZHxp6S
   3Bv1KQoxNF/rcwDmLB8wGD0ZeTwNgLOd3fZcR0cCBGC/gS9wXP06YXMTr
   3f/pZqfIqyTxJkfN474TwUmZAXmuVFmyW+SG2lZ/858Rr1fNEredT36s0
   qmtGuaepdxN9b+V3g1zdrU/Xk5u4/Tl6j1KCXc5p4i5P4eFxBBp45S679
   btxRcSf9OD8ovDNcHHMpO3NxlAPfiDZ1Rou5yzCFtEZSeL4tdmn9fh5Iu
   M6PbuLJH2M4NR70rTSmCQbzjp48rMSNu22OgZbLiXIGPAq4swwUEdCXvv
   w==;
X-CSE-ConnectionGUID: Kh6vsn8xSDygRFf4igw4ZQ==
X-CSE-MsgGUID: pYImyA8nRnquDGDoUIhP6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="39133588"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="39133588"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 11:14:21 -0700
X-CSE-ConnectionGUID: Aw3aKhOmT6Crz5fyNaoL5Q==
X-CSE-MsgGUID: TTi753ojQlCmxPT7ioW2Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="36853885"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 31 May 2024 11:14:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD6la-000HdD-1Z;
	Fri, 31 May 2024 18:14:15 +0000
Date: Sat, 1 Jun 2024 02:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7193/9806] mm/page_alloc.c:4110:16: error:
 implicit declaration of function 'dynamic_pool_should_alloc'
Message-ID: <202406010233.N3paZ0zK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   735f0ab7121a98dd501241bd147c5c95e6e0b38c
commit: fd855715f24e3eeadaa56de5fde21c55a14aeea0 [7193/9806] mm/mem_reliable: Fallback to dpool if reliable memory is not enough
config: arm64-randconfig-004-20240601 (https://download.01.org/0day-ci/archive/20240601/202406010233.N3paZ0zK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010233.N3paZ0zK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010233.N3paZ0zK-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'mem_reliable_fallback_dpool':
>> mm/page_alloc.c:4110:16: error: implicit declaration of function 'dynamic_pool_should_alloc' [-Werror=implicit-function-declaration]
    4110 |         return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/dynamic_pool_should_alloc +4110 mm/page_alloc.c

  4101	
  4102	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4103	{
  4104		if (!reliable_allow_fb_enabled())
  4105			return false;
  4106	
  4107		if (!(gfp_mask & GFP_RELIABLE))
  4108			return false;
  4109	
> 4110		return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
  4111	}
  4112	#else
  4113	static inline struct zone *mem_reliable_fallback_zone(gfp_t gfp_mask,
  4114							      struct alloc_context *ac)
  4115	{
  4116		return NULL;
  4117	}
  4118	static inline void mem_reliable_fallback_slowpath(gfp_t gfp_mask,
  4119							  struct alloc_context *ac) {}
  4120	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4121	{
  4122		return false;
  4123	}
  4124	#endif
  4125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
