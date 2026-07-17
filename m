Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6FF3EC691
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 10:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285135; cv=none; b=VYmLYJ/nWDYjXBO0lkJZZ8hw1TA87BkMeyQ5moYkUtKF+/Jruwv8cwvamyWoilRPi1+dai7JoW2P7zjBJfOEGWrW/IVe0ZuRWx0VXe7IZ4aR9H3y+8Rx1YAFdlHu0a28HKAzpy3VW1QCkxaCmBE6+EaS7y3DDkWELDVEQIUg5lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285135; c=relaxed/simple;
	bh=iqNMGP00xg7Ht76C3STJ3A96Eqn9TsigSRAtbHEHaH4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CbH30JKh5bxqxpF5Bwl6+/aqzdIr1JBIMML8ZJRX8q1+HaJouiLllnB1KCr9jvqwFRBiPKIiZQn8g149Z5B+/dKGcYJoNP/U2f0ybGSSrmJAfOPAGWu4Z64KqEFgkoN93a5qEVLo8FOqnBz9Y7CxC8/SSBTHrqWHkri4bVrKAVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbYEuAJZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbYEuAJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784285132; x=1815821132;
  h=date:from:to:cc:subject:message-id;
  bh=iqNMGP00xg7Ht76C3STJ3A96Eqn9TsigSRAtbHEHaH4=;
  b=JbYEuAJZQ/CkiF8m/iHgsEXneVjLRcn5t3CyhfFMUwNTpU+m1I2Qu+jm
   9oZTDOyoFUekuHg0LnSDetlt0CouFBf6YLqqdgWf2ajFWdHlJ33PUoRBV
   IaHmQIG8Zee+Wdo5/V9JLlox+kMDKXt7AzFREzaXfbSiPUjZYZcdQKHFe
   AoG7th1xEm3GvxxlJ0RM1KSF1sY4DnGNDQ/+L0Gyyne50DGp09GIjwGgu
   8EJWgsCTIdC94bWNY8pvp3uIm4xpjS2dCL7up+hqPZO/Zkm+B171dGALK
   Mcq8jZbe+Y9bsFp1O0LsSyg/slgcD57XMFLnBzXyszHMov7KM/oOmeHvx
   Q==;
X-CSE-ConnectionGUID: nO8HBwpITEmutJ/4UnmL7g==
X-CSE-MsgGUID: 0JZWNrczTNCh1tMvqFmitg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96319612"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="96319612"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:45:31 -0700
X-CSE-ConnectionGUID: nlsf6g4oQS6UgKVGX/hadw==
X-CSE-MsgGUID: WvBs5HzCTVafnLpsTfYeeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="253343554"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jul 2026 03:45:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkg4N-00000000SeE-2z3Q;
	Fri, 17 Jul 2026 10:45:27 +0000
Date: Fri, 17 Jul 2026 18:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_boot 47/70] mm/mm_init.c:936:37: error:
 'struct zone' has no member named 'pageblock_flags'
Message-ID: <202607171815.dLK0C5iF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   a8a4b998ba937d19200cfad69da3029fd54a8f5a
commit: 8d43a66fdb5007eb7f368b20a2ca44395e8e47d9 [47/70] mm: guard pageblock init against missing pageblock_flags
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260717/202607171815.dLK0C5iF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171815.dLK0C5iF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171815.dLK0C5iF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from mm/mm_init.c:9:
   mm/mm_init.c: In function 'memmap_init_range':
>> mm/mm_init.c:936:37: error: 'struct zone' has no member named 'pageblock_flags'
     936 |                         if (likely(z->pageblock_flags)) {
         |                                     ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^


vim +936 mm/mm_init.c

   903	
   904		for (pfn = start_pfn; pfn < end_pfn; ) {
   905			/*
   906			 * There can be holes in boot-time mem_map[]s handed to this
   907			 * function.  They do not exist on hotplugged memory.
   908			 */
   909			if (context == MEMINIT_EARLY) {
   910				if (overlap_memmap_init(zone, &pfn))
   911					continue;
   912				if (defer_init(nid, pfn, zone_end_pfn)) {
   913					deferred_struct_pages = true;
   914					break;
   915				}
   916			}
   917	
   918			page = pfn_to_page(pfn);
   919			__init_single_page(page, pfn, zone, nid);
   920			if (context == MEMINIT_HOTPLUG) {
   921	#ifdef CONFIG_ZONE_DEVICE
   922				if (zone == ZONE_DEVICE)
   923					__SetPageReserved(page);
   924				else
   925	#endif
   926					__SetPageOffline(page);
   927			}
   928	
   929			/*
   930			 * Usually, we want to mark the pageblock MIGRATE_MOVABLE,
   931			 * such that unmovable allocations won't be scattered all
   932			 * over the place during system boot.
   933			 */
   934			if (pageblock_aligned(pfn)) {
   935				struct zone *z = page_zone(page);
 > 936				if (likely(z->pageblock_flags)) {
   937					init_pageblock_migratetype(page, migratetype,
   938							isolate_pageblock);
   939				} else {
   940					pr_warn_once("memmap_init_range: skipping pageblock init for pfn 0x%lx (zone %s has no pageblock_flags)\n",
   941						     pfn, z->name);
   942				}
   943				cond_resched();
   944			}
   945			pfn++;
   946		}
   947	}
   948	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
