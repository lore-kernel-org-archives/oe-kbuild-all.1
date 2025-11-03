Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ED71684B0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 03:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762141448; cv=none; b=VleNmPjF2aKeI2bPORVHzTuIkXB57QIci5Jq+gThM5v8g2AwBRP51Z+ThAORDELQX7VBn5v7U5C/O5+XZiOWYfVyxrFcoidNVVTv+dCH208TV/bEOP4MfyT0f3oPoVyggmzxKuRVnUzX8lb0FzQZRn7LBblb/IoMGjsHz1BihTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762141448; c=relaxed/simple;
	bh=sPlvFDP9gFHCkSb11oYADO1zIbncVVLqc7wZ0nOIBVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d6wGgVnxrJbd9LFlv5eGitwKyUr2kjf8funL6cQZalyjaRjqIlU+T82pebMqWNb3m6HDsILaqH6xEwRDMu2+qBmvfZGDaqDnnZhl7wTUZqyRcFSytz2nyWfw33h6idTIiFqasIiIzGejaN33/mBpmeZFO70PoFH0/UgqGUdFAbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEIdYNDs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEIdYNDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762141446; x=1793677446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sPlvFDP9gFHCkSb11oYADO1zIbncVVLqc7wZ0nOIBVo=;
  b=ZEIdYNDsTFouWct2ZLCU81Xkih0SoQLukRzC4KFLOPFFpsZcBoHr6gVp
   NX+2z5QinpPWj0K5/6SINK0AUX9Kx3Wj6daXThjZ7pYiI5osvkL07fV3v
   HIi3DftgXzBtEJW3vjaJQLUnslG3Nc3x4U7Q2dN3Fdo/I/WjeLzqw5lWE
   WoUk9Yz8/9L4C9h/D5EBTChpVnR3OOMZNuQGWwGk22bDYFwIqEbRZIJnA
   nVMHwRSseho9mkDmAiLcQyaqpbZ8/xz7FDs/4ngjVrNozaKgfcYUw2SSb
   JjHAhssLufhN4VxWWj9KQwfXx4TUYfq3UYC8vLuS6cwz5MgbVAYa4KLVg
   g==;
X-CSE-ConnectionGUID: ps/A0mbIRs6sr85bMH7tKQ==
X-CSE-MsgGUID: /uYVEaFbTWuKzNideqtkDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64310000"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="64310000"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 19:44:03 -0800
X-CSE-ConnectionGUID: SI3e1h3iQ4eazYX/mWb+Sw==
X-CSE-MsgGUID: sdHDxXSrQdOaGfwpjm+7+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186432031"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Nov 2025 19:44:02 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFlU2-000Po8-0a;
	Mon, 03 Nov 2025 03:43:55 +0000
Date: Mon, 3 Nov 2025 11:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 16/16] mm/memory_hotplug.c:664:12:
 warning: no previous prototype for function '__move_pfn_range_to_zone'
Message-ID: <202511031158.UWfMDKhg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7103f9d5c75b142fc88eb149bc55d2e8c8ed76f3
commit: 6c4a83f3c62b8ef3f8bd1ec3c1d374bf0e12713d [16/16] anolis: mm/memory_hotplug: refactor move_pfn_range_to_zone()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251103/202511031158.UWfMDKhg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cc271437553452ede002d871d32abc02084341a8)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511031158.UWfMDKhg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511031158.UWfMDKhg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory_hotplug.c:664:12: warning: no previous prototype for function '__move_pfn_range_to_zone' [-Wmissing-prototypes]
     664 | void __ref __move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
         |            ^
   mm/memory_hotplug.c:664:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     664 | void __ref __move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
         | ^
         | static 
   mm/memory_hotplug.c:995:6: warning: no previous prototype for function '__adjust_present_page_count' [-Wmissing-prototypes]
     995 | void __adjust_present_page_count(struct page *page, struct memory_group *group,
         |      ^
   mm/memory_hotplug.c:995:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     995 | void __adjust_present_page_count(struct page *page, struct memory_group *group,
         | ^
         | static 
   2 warnings generated.


vim +/__move_pfn_range_to_zone +664 mm/memory_hotplug.c

   663	
 > 664	void __ref __move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
   665					  unsigned long nr_pages, struct vmem_altmap *altmap,
   666					  int migratetype, int phase)
   667	{
   668		struct pglist_data *pgdat = zone->zone_pgdat;
   669		int nid = pgdat->node_id;
   670		unsigned long flags;
   671	
   672		if (phase == MHP_PHASE_DEFAULT || phase == MHP_PHASE_PREPARE) {
   673	#ifdef KIDLED_AGE_NOT_IN_PAGE_FLAGS
   674			kidled_free_page_age(pgdat);
   675	#endif
   676			clear_zone_contiguous(zone);
   677	
   678			/* TODO Huh pgdat is irqsave while zone is not. It used to be like that before */
   679			pgdat_resize_lock(pgdat, &flags);
   680			zone_span_writelock(zone);
   681			if (zone_is_empty(zone))
   682				init_currently_empty_zone(zone, start_pfn, nr_pages);
   683			resize_zone_range(zone, start_pfn, nr_pages);
   684			zone_span_writeunlock(zone);
   685			resize_pgdat_range(pgdat, start_pfn, nr_pages);
   686			pgdat_resize_unlock(pgdat, &flags);
   687		}
   688	
   689		/*
   690		 * TODO now we have a visible range of pages which are not associated
   691		 * with their zone properly. Not nice but set_pfnblock_flags_mask
   692		 * expects the zone spans the pfn range. All the pages in the range
   693		 * are reserved so nobody should be touching them so we should be safe
   694		 */
   695		if (phase == MHP_PHASE_DEFAULT || phase == MHP_PHASE_DEFERRED)
   696			memmap_init_zone(nr_pages, nid, zone_idx(zone), start_pfn, 0,
   697				 MEMINIT_HOTPLUG, altmap, migratetype);
   698	
   699		if (phase == MHP_PHASE_DEFAULT || phase == MHP_PHASE_PREPARE)
   700			set_zone_contiguous(zone);
   701	}
   702	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
