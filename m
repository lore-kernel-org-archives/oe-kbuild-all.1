Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CF73630B2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 09:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134934; cv=none; b=AEigDMTgAs6e7JWMdutXRk9KH/vVY005ZTu1P55oX6l6GhT49mB5U0FTYy6f4yvBaecWnYCUHA3B9P/YrO/QJ0hOn1ccfxOSagViI3fp7qMNb12Whf029QPhmbdQ1SJksGdXJI+tRgTaXHoL23U3YhNGKfczJey2sQJkkV7ulEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134934; c=relaxed/simple;
	bh=Hw1WKhDvr0U6j5Hab/gVKniKHLnLJfvLMvKQ1kd7gVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ThwiI53QvUZMKMh9HYwCzCU+deA/YVZRt10jjuKV3kktMD9TMtdqlcykSAajSM4VW2gIOyxdzRQ7UqF6gqnDthf07kmlMVAhHdbO5NWvU22x/n4NhFNbbCv6EI8+F+GBwm/hp3SPWuE0I+5vrQOXQrvA8bQE4GcUdaUFmiM8IgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maVtrrFV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maVtrrFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780134933; x=1811670933;
  h=date:from:to:cc:subject:message-id;
  bh=Hw1WKhDvr0U6j5Hab/gVKniKHLnLJfvLMvKQ1kd7gVs=;
  b=maVtrrFV+edaDcil21kKUC1G3st9hQ6BIaEX2Z9GI8x1oRR9leuwIoAi
   rQH+6Nsrku4HrXwu63PS9nj4pESw3ZYa2LSNbVxr47Ah2LN/3yMnfzzpV
   ncLQSfqVXKWhDLj6GW+O96WaCQHU05JAF1/oTKpMSgaHcep1NHERTzGHC
   QjpkV9Igg1/qf5yoe5J4XzumKF7lwO08iXQHhT11Q9FDQSw8c8MWsIRLs
   It3pd8jdwvGR13Cp/SMq9vyipLIVESdRPHNEg3hkZuIPQUZop6AkA948b
   P1hZvBz+50HsxUJ4w+bH/laQDH+uSxzuoDqWSu0jmwyCBYtbLDLY0cMiM
   w==;
X-CSE-ConnectionGUID: GrArkT0kShG7Z2Wfi0lbkA==
X-CSE-MsgGUID: RU2qxW42QGS7hAYQ8lowBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="68506025"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="68506025"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 02:55:32 -0700
X-CSE-ConnectionGUID: QaNqWfTrQWWz/3kmCIbDmA==
X-CSE-MsgGUID: f/kJ63IJTBCZRe9UsPCnxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="248171975"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 May 2026 02:55:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTGPg-000000008Ik-1YWM;
	Sat, 30 May 2026 09:55:28 +0000
Date: Sat, 30 May 2026 17:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 42/43] mm/mm_init.c:920:37: error:
 'struct zone' has no member named 'pageblock_flags'
Message-ID: <202605301742.KfG0qQ9w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   dea73df6b6f456832390a9acd2c44cf235110d30
commit: a2a98cd08700b29ee25458e078d1c20cc3cb4131 [42/43] mm: guard pageblock init against missing pageblock_flags
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260530/202605301742.KfG0qQ9w-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301742.KfG0qQ9w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301742.KfG0qQ9w-lkp@intel.com/

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
