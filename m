Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AB52D2385
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 02:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784167271; cv=none; b=Vf+PmNXNUtNWwMSUQXOAQ1If97c7+RRYvVWoQhLSjNHfUz/O6nHihZeg4u280xro/7UrBd01MqLIkBVKeKGxO1P4LZzIFYHZBB0fN9McfiYzEQrEOEcZhrvtrE3mr2xMKaEArMoFF3dGcfJdVc7xYU/VgSBDUTF/VlnKjGS15oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784167271; c=relaxed/simple;
	bh=5sYBvXIZaZcc+vbLWIylqObRlnikdR29DCfzHkEZHhY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FVdyi4PgDblZ+pUt25QV9A0HmmXzcyLqG0WrMkoRUGzORn2f2EZXIEvpbuHW/iEuEHKeho+gyZRwUY0/95QJ5tT5/emOQF5Zku/1u848eh1macfslGe2b400/ij8XNbIORGQ3sVPtHHlK5SJQ8t/bqX8xP4jnwD4iOyBq1H/V/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSuW7kRv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSuW7kRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784167269; x=1815703269;
  h=date:from:to:cc:subject:message-id;
  bh=5sYBvXIZaZcc+vbLWIylqObRlnikdR29DCfzHkEZHhY=;
  b=mSuW7kRvEbHOuGhT+KUa6Qi2sAvbLPKGEXu94hPmF37b8NzGTl4QdMw4
   guRP2ZlZ2tDFuzaHTvo8afw/EkKVGlOOcsJJgUCxFdW9qPeYdaoCkw2Rz
   tT2QIMvUsvr1ZmdNtedRQk8Y36jg6QDeDGuS6y/FiAakqhzRiS7hQwPV/
   U8XPX9eA0Vr7jhHDARmJjBzAOTXjjxqh/TDrQM9Ko7Ym1lvFg9oXz+II2
   LTL2IYZJW5l68CZNZeA3dfYN7cMfQiwqX+tJFFzjbwcLiQBBs55qmjByP
   n50AJ99zHCfP8DpGkYTXjOhfSlyVam+fXiRl1Nbf215t7NPeDaSXn2a7B
   g==;
X-CSE-ConnectionGUID: 0WuyiQc2R3C+/914TxFqeg==
X-CSE-MsgGUID: y6Z0CLz9Siq8Yq66hPtyqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95960511"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="95960511"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:01:09 -0700
X-CSE-ConnectionGUID: 5RSRJqaPS4qXZuf/g0zzsw==
X-CSE-MsgGUID: BdIlgbX6TauI38bG62ag/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="261269734"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jul 2026 19:01:07 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkBPM-000000004TJ-3ePQ;
	Thu, 16 Jul 2026 02:01:04 +0000
Date: Thu, 16 Jul 2026 04:00:38 +0200
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_boot 47/70] mm/mm_init.c:936:37: error:
 'struct zone' has no member named 'pageblock_flags'
Message-ID: <202607160306.Rfvcv11C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   a8a4b998ba937d19200cfad69da3029fd54a8f5a
commit: 8d43a66fdb5007eb7f368b20a2ca44395e8e47d9 [47/70] mm: guard pageblock init against missing pageblock_flags
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260716/202607160306.Rfvcv11C-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607160306.Rfvcv11C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607160306.Rfvcv11C-lkp@intel.com/

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
