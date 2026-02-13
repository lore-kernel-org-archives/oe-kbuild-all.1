Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A9F218ACC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771001320; cv=none; b=dkVVSQhLfiMPgnDe//Ivtj2t11U09O7CyIDPKjk/dPxAxzTLTFKVOrjhCD5RvpJNq2V1tCmM/rNLlP4TWjKUT/oxcUJf7Y+zBaiMmdG+H7i5Aty2iGbZ4BwTO0ye8r1M9rgXhq1aK6MsvrYcmMmQ0/mUwyLdMMqpFG5rxhu9W4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771001320; c=relaxed/simple;
	bh=nsBGIIg5g7P5m1IpdYxWp9N6p6DCAKeRdh7qVgGezek=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dX8EBIm3joXx93NgAS1D/XDXw6sbytyQPYAEYH26qWwtrs3O/4onCRnfQEgBKyiraeS4dOasT4UjiMP3NCZz+uFRw3Q6YK3q8w56yXA/3/odxTQcrH5X22u3e0ycuDFZ3m7ggCiXwU6oj1VlD336cDva1rvBa64mbjyYr3VFlMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkpn6WmB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkpn6WmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771001320; x=1802537320;
  h=date:from:to:cc:subject:message-id;
  bh=nsBGIIg5g7P5m1IpdYxWp9N6p6DCAKeRdh7qVgGezek=;
  b=gkpn6WmBzmtoYLZM9Or69G9jutNXWISYZO36w3PBSwrpgzhtzFOQ66B6
   YVyKtxJ6V3UHOhZ8qk8kxdnde4hvnhxQHx0sU4aMmupcDlHapVrtj3Mip
   3o8zfxlQkmJkrQVL+mLrbllgA7WhoQnfXn3jLmkMHvjM5RiLtGBqdFi/B
   pn6r8ESckEFjOEB9/SzouKci2ju4dAFAh2HX+O25ynZNhhegLhWp5Z5FQ
   OX09qB8rB/yL3XRQcS+W7QaeMX89bHe9rpMwG4Tz9VRAP+NUqwNAfi73V
   G11HhMWkMYJlwwqqoXmJD7dxRBEB6WWNKiiS2YG+UQG4CEOvCDDzPZdGq
   A==;
X-CSE-ConnectionGUID: 2YY8GRg+QYifMEoPQ04FHg==
X-CSE-MsgGUID: UnFbI3pRTKiIb7nQJdtFlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72363781"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="72363781"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 08:48:40 -0800
X-CSE-ConnectionGUID: 1IXocpqPR7SvdHAaz6HeMg==
X-CSE-MsgGUID: vvN8hLRXTcSmHcTdFrbUMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="213068965"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2026 08:48:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqwLL-00000000vfo-2z69;
	Fri, 13 Feb 2026 16:48:35 +0000
Date: Sat, 14 Feb 2026 00:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3] mm/page_alloc.c:1831:6:
 warning: no previous prototype for function 'prep_new_page'
Message-ID: <202602140040.G6QAARrG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   a18295bb2ff61afce1b5cfd06eb893d75c39c61c
commit: f2c613bbd9ad3f09e4eb94bf541cdfb57423dcc9 [3/3] ANDROID: export symbol prep_new_page for vendor module
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260214/202602140040.G6QAARrG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140040.G6QAARrG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140040.G6QAARrG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:1831:6: warning: no previous prototype for function 'prep_new_page' [-Wmissing-prototypes]
    1831 | void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
         |      ^
   mm/page_alloc.c:1831:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1831 | void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
         | ^
         | static 
   1 warning generated.


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
