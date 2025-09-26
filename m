Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7034BA5F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758866932; cv=none; b=FzqZivxGCov8MnvGLRPA114lbQXd+qg3UJY31YpoznYJCdPGb2Ojb5472h0SUotpcsqW7YZrc9VwuCvSnhpxwbU4VWQK5KFmO9gL1E9Dmw9RSz8tnsZYKF6/390aUc5SCwTye/9ajLeSsdsIwHGoBkJjjVqSCriXFtgMrVD97w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758866932; c=relaxed/simple;
	bh=hhI5//EynWFiYaQMvCk3kQ/lEJk+gMXpq+zvJSOhQus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ouq9lZNNE74UF8MCwdbI8Bh4lUgVJ7wbOxugcERywlsjDYWKloffaFmKfe0o8LiLgWpfV8lSOH7K8p47NKEwtmfek+sQPaNFURr9917QZZ44V2jiAIC/PTwaEx94VS28WdDMUeuXA6sxNm1V3rQeiiveGfDUqfop3SLwGR+dHPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBrWibNQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBrWibNQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758866931; x=1790402931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hhI5//EynWFiYaQMvCk3kQ/lEJk+gMXpq+zvJSOhQus=;
  b=KBrWibNQKENhhMvN3HQ9PNKyFWCZpYLGQzHxSQI3qh1hnrsWs7DeKg47
   kB4pkIs+oTI5bx+09xSE6Bx6FbOrdTCHQLUYDwJZVR4BNHZrzTApbIHJT
   94JYoIPuDvFNpyIMcGOH08ut1Y78vF73s/8BKSRWav2bp6dc6he7yW8fd
   a95lbYrA9uxJdDBXDnvDG/6tvFSjmmCwOrcVG5fw4dw9JFdtz4pghLEdw
   Nrj60ZZrz9nXHpE4pWchxreV61air9Gl1O96rVDo/5V+lyWUsaY+Xkx+J
   ztYF52h7eBvnwIQXUOZH481AdrKCLCXxUI8f1Hi8Ci8/E75t3lFFsrioZ
   w==;
X-CSE-ConnectionGUID: F/P8kWNNSFW8+fmfhsH2tA==
X-CSE-MsgGUID: bclMHjvzS4+hNynVZpZfqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61247471"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61247471"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 23:08:50 -0700
X-CSE-ConnectionGUID: eDD/NhPvTxiTl157azdFNA==
X-CSE-MsgGUID: pSdZiz4jRtmu3SdLwj5/VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="177459997"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Sep 2025 23:08:48 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v21dO-0005xP-1A;
	Fri, 26 Sep 2025 06:08:46 +0000
Date: Fri, 26 Sep 2025 14:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2938/2938] mm/page_alloc.c:4110:9: error:
 implicit declaration of function 'dynamic_pool_should_alloc'
Message-ID: <202509261459.GIpDqA4A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3e16741023a15d92f4be3343cb4d8b508327dda3
commit: fd855715f24e3eeadaa56de5fde21c55a14aeea0 [2938/2938] mm/mem_reliable: Fallback to dpool if reliable memory is not enough
config: arm64-randconfig-003-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261459.GIpDqA4A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261459.GIpDqA4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509261459.GIpDqA4A-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'mem_reliable_fallback_dpool':
>> mm/page_alloc.c:4110:9: error: implicit declaration of function 'dynamic_pool_should_alloc' [-Werror=implicit-function-declaration]
    4110 |  return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
