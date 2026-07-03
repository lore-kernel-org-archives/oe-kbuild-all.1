Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E12E3290BA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 04:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783054641; cv=none; b=tz7B1fqMKct3XPQ+q/WHJbdsXHYsqzEwiIg08ciJpRbYAa90QAMbhA4/d82o1NSvkOtUKYr8y7RQ4ZuMdN126DWJsRHtR27lea8rT06X5CSBTvkA/uL+yKoeWMwEDcch+8chxlH4yAkwqr5mKb47PS4y3YCwtTmg1Y0PRIiEDeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783054641; c=relaxed/simple;
	bh=tlNY2Ll4WDVvEhdN0senfG9O2Nc5Ya22TEaAhU8d+78=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g/bPw5IPMLObUR3Kca18VT9+oG+a3LCLiQKPJ6bmD1WLyBqNcF20yIj8TpI6B8jhwqk7xdonB/aP6EVafeUUOF+qoGrMPZQQnp5cHmORW5uiCb31UkQE6HbptPGuV0nM2Q6FZ9rQqAUF8BvPrzO+/vn+TsOcoKPyLpaPET6zNT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSbpAgeX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSbpAgeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783054632; x=1814590632;
  h=date:from:to:cc:subject:message-id;
  bh=tlNY2Ll4WDVvEhdN0senfG9O2Nc5Ya22TEaAhU8d+78=;
  b=LSbpAgeXsvxLa1z0xZn+Lr7Dj3d16+ryjiPf2gs2P4WX0no8UQIzenzU
   NLpQ6aYKncKQ5GQnNVJ3/o8ajTjhI9PiQio0RI+AQGXos2HeDmtMmF9iO
   lANkRBJ50Pa8frG+odZFMAKMVgYD05kiDz+LL4yNm/zAo4+D/OdLqlzxc
   qj+gwrserAKlqs9c3yu/AWA1/0Jtlfg0UFh2nt+Q4Y/JMUv1b9JuYp4DR
   RD/Nqwswx9YXbVnx0jWWse7dk5QEpnKKvV45s/jGdj+mhkpzrBCcGNd6v
   GfERnp8qbpGJjNOAIm5ZKkaOaVJpxbkPW73B5XlecAKirwexx2DihA3Yl
   Q==;
X-CSE-ConnectionGUID: 3ajM/1FGTmOB1U1oDh5TYg==
X-CSE-MsgGUID: Q0UbZ1UYQEqHyds1Mydubw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="86349743"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86349743"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 21:57:09 -0700
X-CSE-ConnectionGUID: 0SqW4HiATD62iMVm7WyzeA==
X-CSE-MsgGUID: S7/qivFhRxu4EmTol7dXoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253168965"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Jul 2026 21:57:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfVxZ-00000000BgN-1qTY;
	Fri, 03 Jul 2026 04:57:05 +0000
Date: Fri, 03 Jul 2026 12:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_boot 47/62] mm/mm_init.c:920:37: error:
 'struct zone' has no member named 'pageblock_flags'
Message-ID: <202607031235.EwDEhq0x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   a74f943885b7a0e655c7c47d4d02f852c12c1ce1
commit: 944d16e25477c831c7a6708bb81667dcb5acc6a6 [47/62] mm: guard pageblock init against missing pageblock_flags
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260703/202607031235.EwDEhq0x-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031235.EwDEhq0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031235.EwDEhq0x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from mm/mm_init.c:9:
   mm/mm_init.c: In function 'memmap_init_range':
>> mm/mm_init.c:920:37: error: 'struct zone' has no member named 'pageblock_flags'
     920 |                         if (likely(z->pageblock_flags)) {
         |                                     ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^


vim +920 mm/mm_init.c

   887	
   888		for (pfn = start_pfn; pfn < end_pfn; ) {
   889			/*
   890			 * There can be holes in boot-time mem_map[]s handed to this
   891			 * function.  They do not exist on hotplugged memory.
   892			 */
   893			if (context == MEMINIT_EARLY) {
   894				if (overlap_memmap_init(zone, &pfn))
   895					continue;
   896				if (defer_init(nid, pfn, zone_end_pfn)) {
   897					deferred_struct_pages = true;
   898					break;
   899				}
   900			}
   901	
   902			page = pfn_to_page(pfn);
   903			__init_single_page(page, pfn, zone, nid);
   904			if (context == MEMINIT_HOTPLUG) {
   905	#ifdef CONFIG_ZONE_DEVICE
   906				if (zone == ZONE_DEVICE)
   907					__SetPageReserved(page);
   908				else
   909	#endif
   910					__SetPageOffline(page);
   911			}
   912	
   913			/*
   914			 * Usually, we want to mark the pageblock MIGRATE_MOVABLE,
   915			 * such that unmovable allocations won't be scattered all
   916			 * over the place during system boot.
   917			 */
   918			if (pageblock_aligned(pfn)) {
   919				struct zone *z = page_zone(page);
 > 920				if (likely(z->pageblock_flags)) {
   921					init_pageblock_migratetype(page, migratetype,
   922							isolate_pageblock);
   923				} else {
   924					pr_warn_once("memmap_init_range: skipping pageblock init for pfn 0x%lx (zone %s has no pageblock_flags)\n",
   925						     pfn, z->name);
   926				}
   927				cond_resched();
   928			}
   929			pfn++;
   930		}
   931	}
   932	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
