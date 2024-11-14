Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DA213FD99
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731592812; cv=none; b=gfWdffwJfE5GzgJoi0bRP2oXo/kcFs9ACaeCrXy36N1so6RMD2A8p4zZnnGEptFk2AuxpO37ZNOxsf56hXbRCzz7WUxs8XdRSLkauDKGtoDI10gK8nyz3DRivfxsFuxnqnNbF2sHgGLunwdZ2/LHrw93EZTj2jAMOz92XBduS00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731592812; c=relaxed/simple;
	bh=vLtp6WjIxdRbLk/3pmLTuLEzbufxUmWlcSMl/rbI+a8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HqMXjsIbkLoNaqVEQYx7rqVUePtRizP52ZxJjLnUT3hjOm5XvHFN+hBJTYanWOpf+cKL9tk56vF4lh2tOJNdoPhDk3uF+yRcB1IL1hpwhC1V8E7rBL68tNJ69fYk6GC4aL4bTpkjv+5i52KOuvsC2NGb/J3pJPzyljPa/1ocWvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdvA5wk7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdvA5wk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731592808; x=1763128808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vLtp6WjIxdRbLk/3pmLTuLEzbufxUmWlcSMl/rbI+a8=;
  b=kdvA5wk7BkCCpQFXxFy8HDpdQMI8Df5rChsmRmmZrI7h2G7fk9lCdZaI
   1nm+nH+EZp6om/PNUyigrxToNoqvIWMJTxyyo0RGDmXT0gPJArIsWUnfD
   Nmrix6VsjcjpfSqUfMQEu1s8OQ8JUhcHjmRSVwvu8gQTcO0fIBYOFg2Ij
   IZM5e7aIiFKARVPXQNhrNWL4FkeVsz9vS23e7gSf3KJvFwSWUWBzfhSdm
   1VxMRXA95m/LIsFBeFk9p0nzrRarN4p/0RVz0RTKfbu3vOEkrbImXjllE
   PmpXDw4FY7lD3f8w/49kLLUSZl+YBljxrzEVGesA7FlPowCZG4u3PoCs5
   w==;
X-CSE-ConnectionGUID: oteYGQVESNCv0GqOPl4VMg==
X-CSE-MsgGUID: gQzYMuc/QMOLx2vBLE1DVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35461616"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="35461616"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 06:00:00 -0800
X-CSE-ConnectionGUID: c+byLENcSMyQ1L3gOIZ3MQ==
X-CSE-MsgGUID: 63j8XE/DRO6O/AIYWtonvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="92664557"
Received: from lkp-server01.sh.intel.com (HELO c7bc087bbc55) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Nov 2024 05:59:59 -0800
Received: from kbuild by c7bc087bbc55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBaO4-00004l-2m;
	Thu, 14 Nov 2024 13:59:56 +0000
Date: Thu, 14 Nov 2024 21:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 5/14] mm/page_alloc.c:1363:25: sparse:
 sparse: incorrect type in argument 3 (different base types)
Message-ID: <202411142129.yxq1CZH6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   14bff9b9205aef5c9fba8ae471ada76148266697
commit: a85227c886b7a22cd53bdfcf0740b6e0bd623351 [5/14] ANDROID: page_alloc: add vendor hook to bypass free_pages_prepare
config: i386-randconfig-061-20241114 (https://download.01.org/0day-ci/archive/20241114/202411142129.yxq1CZH6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411142129.yxq1CZH6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411142129.yxq1CZH6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:194:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
>> mm/page_alloc.c:1363:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1363:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1363:25: sparse:     got restricted fpi_t [usertype] fpi_flags
   mm/page_alloc.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/page_alloc.c:2539:6: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2670:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/page_alloc.c:2904:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/page_alloc.c:4641:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

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
