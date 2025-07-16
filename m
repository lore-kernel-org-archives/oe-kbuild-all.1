Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079B72F1FF1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 10:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661807; cv=none; b=p1K2P3hiQP1/qePoOOluQk0WeH223BWzHQV4TK05LS1eixt2reZWGJsEvXm1FM/DZkFLxXE8VXMb0pAqpLPYU4dROPXI3JD+FyNznQ5LJxK+XqUFRSS9bPdU4N8avlSMu+KV0FM1mE0UplyiUHS56UC7632qwPTggGmbgr/GdJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661807; c=relaxed/simple;
	bh=vJYigQ76h6Eux/NMtYks6cEL0AC7SamhKZ/tYl90CKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RDwASVqhh0Y7VZ74JNoOMDz38WZQ28xSUmWYZPjGwSz9zEssvQo5vJFvI1/EVzDD4gJxqKh36sBGBssNRam6oyU3+nYoTrEnQh+CLAOGj/IcCZt777QXD62/i4hBBzG0a7En0kcU8v8COWRmoC8B57ZuVSpT7ShKeebmHiCKLdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxJpHuaw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxJpHuaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752661806; x=1784197806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vJYigQ76h6Eux/NMtYks6cEL0AC7SamhKZ/tYl90CKQ=;
  b=NxJpHuaw/b1hP5d2A1fOORs7SC6oivtCMFZCLe71wouEZGxQ1f6nEWY+
   P3UpDt5C8cDsRVA7N0knw6CfI40cETQg9ia/e6RLuEtSXjp3IQWz58CMa
   KqAnv7jbnt9/2Pv1s1mExeLLfuwFzvYoYwuaCuURWuEVHCmsgameFa0gT
   KSltjZe61D+VkJEFEFPsahwXZ3KhrjVemw1fS6p1yOgnQi9iAZ21UBJgr
   I28MKnzHgtTItMuqJvyrqNzz19A8ZII9RyFDaj44WvlDHCp1Dek9JAhz7
   fgqog/rp7eaeZkARRwju3wAKretmHIN2u0N0j45KWJSTDP1+mFZffdW6D
   g==;
X-CSE-ConnectionGUID: UCRv14u2TbGewVeHOUfAAg==
X-CSE-MsgGUID: z+8Uq+6hSDS4zr/fh2SGzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58558865"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="58558865"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 03:30:05 -0700
X-CSE-ConnectionGUID: hRMEaJFKQFut6/XgOmDRHg==
X-CSE-MsgGUID: TNZP0k60QV6FcvqGAneLjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="163103920"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jul 2025 03:30:03 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubzOi-000CEl-2e;
	Wed, 16 Jul 2025 10:30:00 +0000
Date: Wed, 16 Jul 2025 18:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 6/6] mm/memory_hotplug.c:982:6:
 warning: no previous prototype for function '__adjust_present_page_count'
Message-ID: <202507161821.WI61luWQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   1535649a0387dabbc4baec56dbc329c3046d3ad1
commit: 66756394812b1ce3d99fd553b8d496da6a755dce [6/6] anolis: mm/memory_hotplug: refactor adjust_present_page_count()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250716/202507161821.WI61luWQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161821.WI61luWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161821.WI61luWQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory_hotplug.c:982:6: warning: no previous prototype for function '__adjust_present_page_count' [-Wmissing-prototypes]
     982 | void __adjust_present_page_count(struct page *page, struct memory_group *group,
         |      ^
   mm/memory_hotplug.c:982:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     982 | void __adjust_present_page_count(struct page *page, struct memory_group *group,
         | ^
         | static 
   1 warning generated.


vim +/__adjust_present_page_count +982 mm/memory_hotplug.c

   981	
 > 982	void __adjust_present_page_count(struct page *page, struct memory_group *group,
   983				       long nr_pages, struct zone *zone, int phase)
   984	{
   985		const bool movable = zone_idx(zone) == ZONE_MOVABLE;
   986		unsigned long flags;
   987	
   988		if (phase == MHP_PHASE_DEFAULT || phase == MHP_PHASE_DEFERRED) {
   989			/*
   990			 * We only support onlining/offlining/adding/removing of complete
   991			 * memory blocks; therefore, either all is either early or hotplugged.
   992			 */
   993			if (early_section(__pfn_to_section(page_to_pfn(page))))
   994				zone->present_early_pages += nr_pages;
   995			zone->present_pages += nr_pages;
   996			pgdat_resize_lock(zone->zone_pgdat, &flags);
   997			zone->zone_pgdat->node_present_pages += nr_pages;
   998			pgdat_resize_unlock(zone->zone_pgdat, &flags);
   999		}
  1000	
  1001		if (phase == MHP_PHASE_DEFAULT || phase == MHP_PHASE_PREPARE) {
  1002			if (group && movable)
  1003				group->present_movable_pages += nr_pages;
  1004			else if (group && !movable)
  1005				group->present_kernel_pages += nr_pages;
  1006		}
  1007	}
  1008	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
