Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD74C199E8D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 18:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717698086; cv=none; b=L++gGRKk9Nxb/E6pe8rpjpVlhoIKN48oOdqoX/IJmtHL1n7Eju3Ttuig2O717LFCGsfDS/WTPigkRiAAPtlV3ROarjaOzVjaQ10Tam8dyvnd/RRuTsWmLEVuNEIcEHUiiHlbm5kyC7EFiSr3/6r+kIIcxUpHdH30cp1a2PXR2UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717698086; c=relaxed/simple;
	bh=mCnFM0cnb8HayJ6hIdUy4/1QqYHmojAMYbsfCFlIQSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2s1yNJTJyl9M9fwzgrQAGw4b26m6G/9y8Dw0ev7G6RhzwS1lJ+iGpr8/0G7qfuwGnXspFI/3JpQaL5xDrgEIMRCHiKP1qUkTVApcxvv7MeixBzg+7hJFWok36WvOlSCVs2nwBOT8BEvU4BUp1dRQY5Uw9gpaAlyKrgoU+ehaZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtHnFVHP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtHnFVHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717698085; x=1749234085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mCnFM0cnb8HayJ6hIdUy4/1QqYHmojAMYbsfCFlIQSE=;
  b=gtHnFVHPtyQDpVlrNM9aabfH+ZXQAOq3uhJsQYZtaVmwt57RYR2mgSjU
   9t9Dt9uv7oTFrfmEiAkr7/vslilezPgKSGSGUSd+V4EuXfhzDxExjY1ML
   hqNZ6w0AAqyblHb6kg0Ivo8fVAqWKkkoiYdkNNsNizoJqkxm3/GmzyeE5
   WQ3ao3mNBbb7o0Vm7b9lrT/7cRvWqK8wOMxlUudJcsXzeGwrMIk5pfvKM
   XHhvE3JwdunPgAP2HvTzn9119OUd164ONSsNMiqos/3tJ5tvYRdYmtW5/
   vbgt8N5spM682xzk1mkWfi3XFlS4Aa7fyGD1E0hc+Fru1/JAws+0KW2lW
   g==;
X-CSE-ConnectionGUID: vmBUS69fRuG2yOG+rsNCKg==
X-CSE-MsgGUID: RPo1sCpYTCWXUG6LNErQ2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25045386"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="25045386"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 11:21:22 -0700
X-CSE-ConnectionGUID: 6oY3vRk7QnKancbvBZSqYA==
X-CSE-MsgGUID: xG2wduzoTN+yNoDyzL92lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="42973545"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Jun 2024 11:21:22 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFHji-0003YM-2P;
	Thu, 06 Jun 2024 18:21:18 +0000
Date: Fri, 7 Jun 2024 02:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:virtio-mem-pg-offline 4/5] mm/mm_init.c:896:37:
 error: 'ZONE_DEVICE' undeclared
Message-ID: <202406070235.ztWtXeAi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux virtio-mem-pg-offline
head:   816f41acc6e1b0eebb95b16ec843eef595962c17
commit: 3c5d3350005737fdc58ea48fdceea146132e0fdf [4/5] mm/memory_hotplug: initialize memmap with PageOffline() instead of PageReserved()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240607/202406070235.ztWtXeAi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070235.ztWtXeAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070235.ztWtXeAi-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mm_init.c: In function 'memmap_init_range':
>> mm/mm_init.c:896:37: error: 'ZONE_DEVICE' undeclared (first use in this function)
     896 |                         if (zone == ZONE_DEVICE)
         |                                     ^~~~~~~~~~~
   mm/mm_init.c:896:37: note: each undeclared identifier is reported only once for each function it appears in
   mm/mm_init.c: In function 'memblock_free_pages':
   mm/mm_init.c:2512:9: error: implicit declaration of function '_free_pages_core'; did you mean '__free_pages_core'? [-Werror=implicit-function-declaration]
    2512 |         _free_pages_core(page, order, MEMINIT_EARLY);
         |         ^~~~~~~~~~~~~~~~
         |         __free_pages_core
   cc1: some warnings being treated as errors


vim +/ZONE_DEVICE +896 mm/mm_init.c

   878	
   879		for (pfn = start_pfn; pfn < end_pfn; ) {
   880			/*
   881			 * There can be holes in boot-time mem_map[]s handed to this
   882			 * function.  They do not exist on hotplugged memory.
   883			 */
   884			if (context == MEMINIT_EARLY) {
   885				if (overlap_memmap_init(zone, &pfn))
   886					continue;
   887				if (defer_init(nid, pfn, zone_end_pfn)) {
   888					deferred_struct_pages = true;
   889					break;
   890				}
   891			}
   892	
   893			page = pfn_to_page(pfn);
   894			__init_single_page(page, pfn, zone, nid);
   895			if (context == MEMINIT_HOTPLUG) {
 > 896				if (zone == ZONE_DEVICE)
   897					__SetPageReserved(page);
   898				else
   899					__SetPageOffline(page);
   900			}
   901	
   902			/*
   903			 * Usually, we want to mark the pageblock MIGRATE_MOVABLE,
   904			 * such that unmovable allocations won't be scattered all
   905			 * over the place during system boot.
   906			 */
   907			if (pageblock_aligned(pfn)) {
   908				set_pageblock_migratetype(page, migratetype);
   909				cond_resched();
   910			}
   911			pfn++;
   912		}
   913	}
   914	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
