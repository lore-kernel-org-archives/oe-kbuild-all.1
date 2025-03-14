Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0AA20296A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 18:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741975858; cv=none; b=cJysl6EehjrU/bGP0YaorYluNLKeD1R2a3gVw5d6LkzqRvpIpfGib41h2li2Neu9oFe4E0H2utcbVEYO+aFbEb6xOPAHDMTph1zrZmW1Z6EPkS6+/UsMIyvpv19NVSSl+Fs046fulO5HcyZadTNtPnj6FjBuiMMVgS3/o2GFsho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741975858; c=relaxed/simple;
	bh=HIAiosRRimBK6y8dQHC1mnAeQD3A2nqHOAZVcyUZUTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=etIxWYWuRsbpQYXGJ5DgWQiT0pDQn9ctil/Eu4ysiqtjQ7jEhGCIDXWH3VMo3nIVYhWdhfCJUNeEK2UCMrVLUPV7W9m2qNc3lb7I2QYdbkeJTtJ0XtT1bW5E3rPVFl3y3p5Y9Qo2qBKtLSAiP08lZ1bX52wCyL1x1z2NRR46a7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SD39JsyF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SD39JsyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741975857; x=1773511857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HIAiosRRimBK6y8dQHC1mnAeQD3A2nqHOAZVcyUZUTQ=;
  b=SD39JsyFEHKLTjJZ5XhCs841PSjumlJ+UCIzMililkIEO4ST9I1boIvO
   pusxYQkJIRje+MEgpnLMvWAXsv4Ws/hEOlyMlkP/9BGAWbRI+hjgR16j7
   5va3I4iMeKhEpfCycMq9Ls9aCletkxBFoBlEGiaiWOPk6CsvfGC47qfcM
   t3FJGRdSjIx4pz3HNdj2Mg6mPPURprqPsjwjmNVv3J7D+7uKmBQVm/rqo
   CeGZB7zLf1sUrxuuYi65FxBBa9LlnO4g99Cf9yDU3+9+L82Tyvh1cEWKl
   piEUqax4DYzlL/Bpsw5cJjxF36i93gqhIwu2eW+XRHl5SgIfv/FbRcOQ2
   Q==;
X-CSE-ConnectionGUID: 3EP6ibnjTiK+629f9KT0pg==
X-CSE-MsgGUID: rR0pHVOEQ5m8Zidc5jdqwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="46928573"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="46928573"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 11:10:56 -0700
X-CSE-ConnectionGUID: QMHPjbyjTLibTl3JyZneJg==
X-CSE-MsgGUID: lELgLiKFTpCc2LgQey/q+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121866084"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Mar 2025 11:10:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt9Uj-000AjA-11;
	Fri, 14 Mar 2025 18:10:53 +0000
Date: Sat, 15 Mar 2025 02:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-01 0/1] mm/page_alloc.c:1363:25:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202503150255.pHcXsYH3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-01
head:   6726d0da8bd163f294a4cd801fa5028d44aa0916
commit: a85227c886b7a22cd53bdfcf0740b6e0bd623351 [0/1] ANDROID: page_alloc: add vendor hook to bypass free_pages_prepare
config: i386-randconfig-061-20250314 (https://download.01.org/0day-ci/archive/20250315/202503150255.pHcXsYH3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503150255.pHcXsYH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503150255.pHcXsYH3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:194:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
>> mm/page_alloc.c:1363:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1363:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1363:25: sparse:     got restricted fpi_t [usertype] fpi_flags
   mm/page_alloc.c:1392:6: sparse: sparse: symbol 'free_hpage' redeclared with different type (incompatible argument 2 (different base types)):
   mm/page_alloc.c:1392:6: sparse:    void extern [addressable] [toplevel] free_hpage( ... )
   mm/page_alloc.c: note: in included file:
   include/linux/mm.h:4125:6: sparse: note: previously declared as:
   include/linux/mm.h:4125:6: sparse:    void extern [addressable] [toplevel] free_hpage( ... )
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c:2539:6: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2670:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c:2904:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4641:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false

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
