Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AEC171CD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 02:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783133505; cv=none; b=jEfziNHP9Xkb4CorhxRl+yuQ02G/n7EwPQQMXU5tl3yjRX70f62XQm4S/jno/QJsZAZUQQoDHhJQDmibxpGze0159GdijL7jXw+o54u7PygG3TKS7kb11Xw4qKCz2hnzKVTfOUXF1k1XqrqtVPRazsnhBUWNBA4sftkLW8NCko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783133505; c=relaxed/simple;
	bh=Gh6kV/CXLSQ6Eu/jx1YDZ3GY9oF+YkNGPM1tvj4+5cE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fSzVBljIMxP38oj/HAmkpes+xyHY1FRR3CUVsYjSNpQUvqoCrdVadCg97LlyPEcfXEnI4cnsuZSbTDDwMhTYasDqI9cozcw6cq1YOMZRHJHKQvNFpRlnwdgR23WGpxOabg/JwS5+zSSNG7lC6O0GUE/BFx0LSINYXc/7Xe4HC8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVvsZ/l3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVvsZ/l3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783133504; x=1814669504;
  h=date:from:to:cc:subject:message-id;
  bh=Gh6kV/CXLSQ6Eu/jx1YDZ3GY9oF+YkNGPM1tvj4+5cE=;
  b=nVvsZ/l3apo1EWEDNqdPlDDnN6EMoN+RnSWVJ0zN0vAzbfxitzkyTq3k
   eccxrs49eadZnCzy8bSkf6hXEteCeCg6sqxD5XjvnaRbUnfQ4rse8Q93d
   EUqvXscLCgoo37QETfU6+t2XTrDHITaIqqFWTM8J2gj6moaPFqxCAittu
   RlQlQ9Z9aXrWr84etd9n878Lx8cly3b31xXLhPHkt4Qy3/24UuBy8Il9a
   yzTqfJoMoMS6pCJtY/BRc16piZREMHHuJkR6DAwrDqPaKlqUR+ZunPMvy
   k+m74xKFFCZlgZAv8weFsbmserD/LSE10rygWd2DJnK2eVGh0Msv0D9B3
   w==;
X-CSE-ConnectionGUID: xRGRuRVlQveuQ8opQBI2Zg==
X-CSE-MsgGUID: cm+obPUyQjGFJXjm6jIxhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83646219"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83646219"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 19:51:43 -0700
X-CSE-ConnectionGUID: 2pVEFVOZRE6g1YGmc7vTsA==
X-CSE-MsgGUID: lS6AAwoTScqpIlFp8waiZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="248778925"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jul 2026 19:51:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfqTf-00000000CmV-3EZa;
	Sat, 04 Jul 2026 02:51:36 +0000
Date: Sat, 04 Jul 2026 10:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] mm/page_alloc.c:1729:6:
 warning: no previous prototype for 'prep_new_page'
Message-ID: <202607041026.SYysmHf4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   067e5e6bd6445f97dfbbf71bc3693d1bea71972d
commit: 3eb552620ce010b786bdc76a74722b9339d9c0ba [2/2] ANDROID: export symbols for vendor module
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260704/202607041026.SYysmHf4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041026.SYysmHf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041026.SYysmHf4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:1729:6: warning: no previous prototype for 'prep_new_page' [-Wmissing-prototypes]
    1729 | void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
         |      ^~~~~~~~~~~~~


vim +/prep_new_page +1729 mm/page_alloc.c

  1728	
> 1729	void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
  1730								unsigned int alloc_flags)
  1731	{
  1732		post_alloc_hook(page, order, gfp_flags);
  1733	
  1734		if (order && (gfp_flags & __GFP_COMP))
  1735			prep_compound_page(page, order);
  1736	
  1737		/*
  1738		 * page is set pfmemalloc when ALLOC_NO_WATERMARKS was necessary to
  1739		 * allocate the page. The expectation is that the caller is taking
  1740		 * steps that will free more memory. The caller should avoid the page
  1741		 * being used for !PFMEMALLOC purposes.
  1742		 */
  1743		if (alloc_flags & ALLOC_NO_WATERMARKS)
  1744			set_page_pfmemalloc(page);
  1745		else
  1746			clear_page_pfmemalloc(page);
  1747		trace_android_vh_test_clear_look_around_ref(page);
  1748	}
  1749	EXPORT_SYMBOL_GPL(prep_new_page);
  1750	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
