Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49559257AFB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759995; cv=none; b=P6N6uTg5unqJf9MhXuDO6VoUm3u5rxrXOTCOkf/pMymvW1PQD2zb012NIPpPtnRVDj6ueZjJsLXUmj2GJsmx8//pCXcGPsX9eaqG6CKo2qbcRhgyg/Nr37GD41aAqJDAcb810YfSR/xuk3s+G2r5XegtE+l7jnHuozdQzeiDhJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759995; c=relaxed/simple;
	bh=tmzXyCQyClZVMLdcfWwHpgz5WdASr9ZFiRjHqcikgP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YKTnpYssHD7gRcq0PkhBbmAy0R0Onzz1eZRpJr/cclTvj8Y5wmEBQA0Qwh1MHmeKgfNUDQkfw3KYsxNJr6Hc1dJu/6Pz+sfqkrJMtSkmIJJbeHTjphNT3kWiAg+Gg5E8LQLT82zUTY5kxJXNXMz5bfWYT2r0O+IeZwgaCqlSXuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/8Pa2VH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/8Pa2VH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747759993; x=1779295993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tmzXyCQyClZVMLdcfWwHpgz5WdASr9ZFiRjHqcikgP8=;
  b=a/8Pa2VHiNs2SQtlvAqxAu11loYh2zudpv20iYBGugkTHASi7oPulZtq
   tfOuzKMqUXmXKjH7IJMnPHtGxpp7ZsQYbWwHcOgyafIcbyslt33e/lLM+
   ZWxU1kuDexuIup65rZPDG3Wu6RYKf1h5xc2WxlCJTvK/IBZdgZcstlHC3
   1FbP9HJYHly7t1WoVxQU7LPYK0UQ3Q8GXRKaPIHDMv0M+daMhxG8wS4Bo
   yEuL3TfskgZqWlfFsr2gYRGB6PEIYuN9YqTyvbawWUHM/n3JViux0ixTZ
   p5yPd/+KnUB5jkQHKph+iFRavFwAmgQXEqwnRgIjgyQebznndXghtG3ZG
   A==;
X-CSE-ConnectionGUID: NIYJwM/rQeqIxBIBe/EXiw==
X-CSE-MsgGUID: y4iH5EqhS7iYVyFbwj3QFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="61099572"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="61099572"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:53:12 -0700
X-CSE-ConnectionGUID: lzllfVyNT5Kzg+hEhFqF6g==
X-CSE-MsgGUID: Sg0s4aFAQjCmbQdUw3ZoRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140789528"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 May 2025 09:53:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHQDE-000NNq-2g;
	Tue, 20 May 2025 16:53:08 +0000
Date: Wed, 21 May 2025 00:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 433/433] mm/page_alloc.c:2741:29:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202505210010.RRTLpWKL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   a830675dbb006ceaf34b8cf9cd42e61ab8c53b4e
commit: b9d3d8f1e991052edb89b0537b8f2e8b2aa941ac [433/433] ANDROID: GKI: cma: redirect page allocation to CMA
config: arm64-randconfig-r123-20250520 (https://download.01.org/0day-ci/archive/20250521/202505210010.RRTLpWKL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250521/202505210010.RRTLpWKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210010.RRTLpWKL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:106:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
>> mm/page_alloc.c:2741:29: sparse: sparse: Using plain integer as NULL pointer
   mm/page_alloc.c:3252:51: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected int cma @@     got restricted gfp_t @@
   mm/page_alloc.c:3252:51: sparse:     expected int cma
   mm/page_alloc.c:3252:51: sparse:     got restricted gfp_t
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:325:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:325:27: sparse: sparse: restricted gfp_t degrades to integer

vim +2741 mm/page_alloc.c

  2736	
  2737	static struct page *__rmqueue_cma(struct zone *zone, unsigned int order,
  2738						int migratetype,
  2739						unsigned int alloc_flags)
  2740	{
> 2741		struct page *page = 0;
  2742	
  2743	retry:
  2744	#ifdef CONFIG_CMA
  2745		if (migratetype == MIGRATE_MOVABLE && !zone->cma_alloc)
  2746			page = __rmqueue_cma_fallback(zone, order);
  2747		else
  2748	#endif
  2749			page = __rmqueue_smallest(zone, order, migratetype);
  2750	
  2751		if (unlikely(!page) && __rmqueue_fallback(zone, order, migratetype,
  2752							  alloc_flags))
  2753			goto retry;
  2754	
  2755		trace_mm_page_alloc_zone_locked(page, order, migratetype);
  2756		return page;
  2757	}
  2758	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
