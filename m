Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241B52500C2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Nov 2024 22:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732486643; cv=none; b=YjZCiSWyC5Ee6Fal+cKIGlKnNU2+kzy6R3v70XiGVq7otYuENR/z+yCMuCmpvpcqMdefY7rNiE8KChArG3sxd0NFhoTcpUIu1iH1bjF5BuhflBrcwp5eleRkgCWbgQdyiwUIR8H64MdxUrG8+Re1FsdcLMigAhcPfmdvcjmnp28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732486643; c=relaxed/simple;
	bh=+UEKJoWQB0/dhnpaEdVs0BcNJPzG7jBL7VQNX6P5bb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ovFWjQEh0E0FStZ41CVmdsC3aMikJ+HYW1qIrICnVQVQj0h/A9wtXQpbKzgRfIqVIKRnr0/keLECEyYX7Xq6kT4PVW1KU3rdPl0F1NrCgI/T95QhM/d9r2kv8thBydEo6cX71jhhsERn+3GfGqVFNCs1I2DXgBEo8aPRYOkg3oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SX7vzgtk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SX7vzgtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732486641; x=1764022641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+UEKJoWQB0/dhnpaEdVs0BcNJPzG7jBL7VQNX6P5bb8=;
  b=SX7vzgtkV5bd0WTR6S+OZI/4MT22J/9GswGONCuDTu+0gdcx+CDaUqNg
   VwObuG+qTEF1b77MnO2iAHBgjmrkND/h+n+3uOBzASpqNyfdB6Foah9Nd
   C+/UvRcivjZDquKFM9YiN6Sd3HMxJUMYBkTMYP3kBIsqmVllJYAl56RZM
   hzsCrtu5ZsEUheKn9XCLSg0Vn65YFg9afk4NOQKaTHv0qT1CHNUSo3Fzx
   yn/JkAsvYHMi4OpPtegpU2qaJjTqOdsPi7T1n6zjMBwa/TsrkymIorUHk
   zzWt+aliV2o5Z0nRv7KiJEvHGR3Wqb3x03JGRYnFw0bR5KLfxMSH1atea
   A==;
X-CSE-ConnectionGUID: P593K4poSaC0qfHos9UVPg==
X-CSE-MsgGUID: AT7IE17mTWiNCJYIgbQyRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="20168530"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="20168530"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 14:17:21 -0800
X-CSE-ConnectionGUID: lN3b55S8RsyxmqQEdnpqgg==
X-CSE-MsgGUID: 8pqFtJFjTRGSha1NchNeAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="114363009"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2024 14:17:19 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFKur-0005Fl-1Z;
	Sun, 24 Nov 2024 22:17:17 +0000
Date: Mon, 25 Nov 2024 06:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 5/14] mm/page_alloc.c:1363:25: sparse:
 sparse: incorrect type in argument 3 (different base types)
Message-ID: <202411250635.AVrdlvvj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e2fbfb2efc8d61bff3b6ca9212c57cd9568f6442
commit: a85227c886b7a22cd53bdfcf0740b6e0bd623351 [5/14] ANDROID: page_alloc: add vendor hook to bypass free_pages_prepare
config: i386-randconfig-061-20241114 (https://download.01.org/0day-ci/archive/20241125/202411250635.AVrdlvvj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250635.AVrdlvvj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250635.AVrdlvvj-lkp@intel.com/

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
