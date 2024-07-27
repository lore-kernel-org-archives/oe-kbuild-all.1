Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4EB1F956
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 22:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722118906; cv=none; b=ZZ2+nf3ya4I8zGiH/ywC/L1FIJTMflG9odsBb5WMO8/vXEvrrTp7wNzPB0+NrDkgXS1fu9iu2kSgkTJ9/UbPE3BzVbFKnfrzZnVkhLtq2wGis5uNE1cMtqLnnbQJkyafVORgVGO7Thsuto5QsKfwDfxKzk/f2/kVYgUTNjSUu2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722118906; c=relaxed/simple;
	bh=6/rCEWauy8YvI0T5Q/9uPB44GWklhda6UM2C10ubpjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QdPuVEZ4iPyr/A7jTD8Zd5S9ElJ3b3yf+jAVBZMm6BKhEga1J4sALjzqx8AumOmNcYVk4Zv853+qh7hw7QIaSLQ2YouzYjguGJW219vocn/t/V6jxgHrQtBDbBQ7ZAcuC/7ec3UVK6+9UKwl5f1Mp6NfUJ7A4Xh9K+rn7lm+248=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNx98BRI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNx98BRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722118903; x=1753654903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6/rCEWauy8YvI0T5Q/9uPB44GWklhda6UM2C10ubpjo=;
  b=nNx98BRIL7qMxsxUjteWeead6I1kXzYBCJlFwozi8x3xU6iHSHmwmDe8
   T1GMYAJX0jK/kF1Pas8c7TNyEhoXgkhsZopiHdVZZJmcyORXEeLVeASU5
   dJIT/c6QkopjLqXoS9VLdjAbOBKQMyVM9t2tB5EQVwmb7VciWDmuhFXah
   uF7kHFRFdwNNks8hmYYxnI6FkDJX/skwlzzLXTeA9eGHd9LzGawyIK046
   wM6rPEpdMli/0BHbrsGzxzQSduu6KFKTClB0HDGbHd3Bzogk/1N2ipfZd
   hUxP4Yh8tGx+obKFFoggYDKXO+vgIjII9m4O1MmUya1m+It6S54UPve20
   w==;
X-CSE-ConnectionGUID: UD1smj/tQiWZVcI1FEz8pw==
X-CSE-MsgGUID: J54Y/Y9/QGibr2B3TpyLHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="20047479"
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="20047479"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 15:21:42 -0700
X-CSE-ConnectionGUID: XdSyM7GzQNiulaNpz36d6Q==
X-CSE-MsgGUID: TBDchMLzRh+F3QPwlZNy3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="58693299"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jul 2024 15:21:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXpnH-000qHs-0J;
	Sat, 27 Jul 2024 22:21:39 +0000
Date: Sun, 28 Jul 2024 06:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 5/14] mm/page_alloc.c:1363:25: sparse:
 sparse: incorrect type in argument 3 (different base types)
Message-ID: <202407280656.1c6Tnlzh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   af55892f201c8f709725d75d306b1cdd20984b97
commit: a85227c886b7a22cd53bdfcf0740b6e0bd623351 [5/14] ANDROID: page_alloc: add vendor hook to bypass free_pages_prepare
config: x86_64-randconfig-123-20240728 (https://download.01.org/0day-ci/archive/20240728/202407280656.1c6Tnlzh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407280656.1c6Tnlzh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407280656.1c6Tnlzh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:194:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
>> mm/page_alloc.c:1363:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1363:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1363:25: sparse:     got restricted fpi_t [usertype] fpi_flags
   mm/page_alloc.c:2583:9: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2670:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
   mm/page_alloc.c:2904:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4638:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block

vim +1363 mm/page_alloc.c

  1351	
  1352	static void __free_pages_ok(struct page *page, unsigned int order,
  1353				    fpi_t fpi_flags)
  1354	{
  1355		unsigned long flags;
  1356		int migratetype;
  1357		unsigned long pfn = page_to_pfn(page);
  1358		struct zone *zone = page_zone(page);
  1359		bool skip_free_unref_page = false;
  1360		bool skip_free_pages_prepare = false;
  1361	
  1362		trace_android_vh_free_pages_prepare_bypass(page, order,
> 1363				fpi_flags, &skip_free_pages_prepare);
  1364		if (skip_free_pages_prepare)
  1365			goto skip_prepare;
  1366	
  1367		if (!free_pages_prepare(page, order, fpi_flags))
  1368			return;
  1369	skip_prepare:
  1370		/*
  1371		 * Calling get_pfnblock_migratetype() without spin_lock_irqsave() here
  1372		 * is used to avoid calling get_pfnblock_migratetype() under the lock.
  1373		 * This will reduce the lock holding time.
  1374		 */
  1375		migratetype = get_pfnblock_migratetype(page, pfn);
  1376		trace_android_vh_free_unref_page_bypass(page, order, migratetype, &skip_free_unref_page);
  1377		if (skip_free_unref_page)
  1378			return;
  1379	
  1380		spin_lock_irqsave(&zone->lock, flags);
  1381		if (unlikely(has_isolate_pageblock(zone) ||
  1382			is_migrate_isolate(migratetype))) {
  1383			migratetype = get_pfnblock_migratetype(page, pfn);
  1384		}
  1385		__free_one_page(page, pfn, zone, order, migratetype, fpi_flags);
  1386		spin_unlock_irqrestore(&zone->lock, flags);
  1387	
  1388		__count_vm_events(PGFREE, 1 << order);
  1389	}
  1390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
