Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4134519005E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771000060; cv=none; b=eSG8OhhZapKieztg5q9vueKFJXDEag+71x0OECZQh4L+FRxBKXKRa5csk7PX7CphqSG0ooc6VlfmDwOmPYIJxVdtX/lAiHvTivmljVb0OkODp3MdqKMgRhkWmPVPPDfOmI4z0D3rpVI/STgwOQHaYvn9zYN7suahfz7AGYo5mVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771000060; c=relaxed/simple;
	bh=j6ixpRbqQbX0//KZuZeir8bb7H3794PP1sjrcM1Pnh8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=su971IrkyYczskqklcSXRzNcbmAVLaKyTGLbJzON0AHg3sLl85f2XzNG3fuyR3H/UPpJCW6pS1Sr9/o+glJy8EWgZyexf+i0HRS8qETZqZmzV43VtcwkQc2JD83CTpIaGFi5/WhH1Zcj9F7ql4T54jnVNNoWESqmWNBFkUer7Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XP98CPKI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XP98CPKI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771000059; x=1802536059;
  h=date:from:to:cc:subject:message-id;
  bh=j6ixpRbqQbX0//KZuZeir8bb7H3794PP1sjrcM1Pnh8=;
  b=XP98CPKIhUl0RCvFq3Akcc9FUuPD0nd80alGMGZEYOH3lfdI4Epyjuc8
   VRN4G7JSTim/YxOkDzMq1cROZh2dxwL3oCXQVIFHEfInzkVmFrkO+IjRX
   kYQgWsxMbfhQh6hBsUH7o7fVj4UbEt7FpiYcozhP0mTOPM15mggpKY90C
   ulPykiA78CZgDS76eHZ7Tum5SsnZhDC4+9vmD9c9+PXDnOeJvHWV67/nb
   GMVla2o85ktyevvSRHvxunVXyWx75MX5d9pnTD5Rh3b3O6FiRjOyHw6Ru
   9Glant0vEfdMSAzMHPOdH1Qukf7FfZvzsKr0rEFyIHhgsqnn8qqOfOxvM
   w==;
X-CSE-ConnectionGUID: G2W1aDUQTLGGusHRo7uVWg==
X-CSE-MsgGUID: FDM0vfHyRSeyWac4Q0RJvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72080395"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="72080395"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 08:27:39 -0800
X-CSE-ConnectionGUID: VW/nPUUxRPu1P0IHgKVh1g==
X-CSE-MsgGUID: JJPfA7VtRHyTB2H6XXkD0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212057144"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Feb 2026 08:27:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqw11-00000000vfC-1ADz;
	Fri, 13 Feb 2026 16:27:35 +0000
Date: Sat, 14 Feb 2026 00:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3] mm/page_alloc.c:1831:6:
 warning: no previous prototype for 'prep_new_page'
Message-ID: <202602140016.PFmTD3Gh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   a18295bb2ff61afce1b5cfd06eb893d75c39c61c
commit: f2c613bbd9ad3f09e4eb94bf541cdfb57423dcc9 [3/3] ANDROID: export symbol prep_new_page for vendor module
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260214/202602140016.PFmTD3Gh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140016.PFmTD3Gh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140016.PFmTD3Gh-lkp@intel.com/

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
