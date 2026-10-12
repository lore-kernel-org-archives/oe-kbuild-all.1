Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102B537E5C9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 22:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791845463; cv=none; b=dFENVKHbQtvdsUwxHKPNpDdP3QGp+f1Bn/5kZZMls85uiQoJDI+Zr2LpsFygkrP9ftZ0Kv9YaEeue+hT0iBOGBEJil7n5LfTKSRcDcBMh6GQbpTjeDBpuHz/orMwdR213OBAFjcr63fqzFE7F8ohiJ7nehiHlE7UVAAtb1N/1CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791845463; c=relaxed/simple;
	bh=aHsBIYav2HpB+/vcEAIyY0I8oz3ggs00Wrh1yfu2SKg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bruNsB3n6BfvYfCgLsG40bDlQqOHopvUZaqIXmDIDt5+/DnvAsOqsjsNhqx3tiOYksXj2uMV5htEt7kH7cit3Q/xr30ndHEFC/a3Kp2ZdoyqUBj6dV2wrLJVgfxqlmfgx0qVQGjiEYP/gBEx2CUXpwMyILLW5Y/itMACZhS1rHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwuKdeHb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwuKdeHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791845462; x=1823381462;
  h=date:from:to:cc:subject:message-id;
  bh=aHsBIYav2HpB+/vcEAIyY0I8oz3ggs00Wrh1yfu2SKg=;
  b=EwuKdeHbf35rqywptm54JDp/xsWPTI3F7Kn8ycG9aWGKrKCvCC3WWRPH
   IrlNDI+b+WJDBGBT/FNjqvTSbLVAXpbSbTjSeeBzyJHe/AuCL1W51TJRV
   3wEbqC9bDcI4sUzUPJKD9KIfQsq3xFxdScARxvr//gZtHKL5XLsD7mrfb
   LmTSgzI2CRPxK7cgRjmA7IgId/S5ueS1ueerh2wwXgrOGST/rG5/xEV7T
   0XCS3STQmboGNvAOvSEFLWkGEzmk4bf9AKdagvDY9CLq1tOOonQw6CrHP
   6Bw+KUwxCYTLwv9itdowEYkwKFQ+xlD8p0h+a5+6a2ayNBzclZhpOWPhi
   A==;
X-CSE-ConnectionGUID: vYAZSNHBS7mff9qPdA2PeA==
X-CSE-MsgGUID: sPB+alvASgGhjaL0Jry+RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="467237"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="467237"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 15:51:02 -0700
X-CSE-ConnectionGUID: wL1dZstuRBeyp651eAVDzA==
X-CSE-MsgGUID: Zm0WM76tSUOZnjAhrTVe4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1332444"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 12 Oct 2026 15:51:01 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGOrC-00000000AFn-1Lqv;
	Mon, 12 Oct 2026 22:50:58 +0000
Date: Tue, 13 Oct 2026 00:50:07 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3] mm/page_alloc.c:1831:6:
 warning: no previous prototype for 'prep_new_page'
Message-ID: <202610130013.ccJ2o2PW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   56e06df0a40e2b5f08e5af33bd5395f5d0922c83
commit: f2c613bbd9ad3f09e4eb94bf541cdfb57423dcc9 [0/3] ANDROID: export symbol prep_new_page for vendor module
config: i386-randconfig-2301-20261012 (https://download.01.org/0day-ci/archive/20261013/202610130013.ccJ2o2PW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130013.ccJ2o2PW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130013.ccJ2o2PW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:1831:6: warning: no previous prototype for 'prep_new_page' [-Wmissing-prototypes]
    1831 | void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
         |      ^~~~~~~~~~~~~


vim +/prep_new_page +1831 mm/page_alloc.c

  1830	
> 1831	void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
  1832								unsigned int alloc_flags)
  1833	{
  1834		post_alloc_hook(page, order, gfp_flags);
  1835	
  1836		if (order && (gfp_flags & __GFP_COMP))
  1837			prep_compound_page(page, order);
  1838	
  1839		/*
  1840		 * page is set pfmemalloc when ALLOC_NO_WATERMARKS was necessary to
  1841		 * allocate the page. The expectation is that the caller is taking
  1842		 * steps that will free more memory. The caller should avoid the page
  1843		 * being used for !PFMEMALLOC purposes.
  1844		 */
  1845		if (alloc_flags & ALLOC_NO_WATERMARKS)
  1846			set_page_pfmemalloc(page);
  1847		else
  1848			clear_page_pfmemalloc(page);
  1849		trace_android_vh_test_clear_look_around_ref(page);
  1850	}
  1851	EXPORT_SYMBOL_GPL(prep_new_page);
  1852	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
