Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A585F1632E7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 08:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780128169; cv=none; b=KNfSX0SmH+HUFjDFXe1ipJEPZhE1hAYGFCvHrA+rZMqAotMqitOp7LHPWlUR5avW3Y2F+GwW50nIhaJoxZEikmUk9lK1a3ouRBlXX8KR4T1iRy99jKOhFmkDjCyPO/T3X2sMFKWIwnAq4ei9MMeUTknMsEc1TMh7LoIzL6EItnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780128169; c=relaxed/simple;
	bh=1i3YteHo0+Ds3v9K6BAMrkIZAmDzS1B9hUThgLenArQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LtRM7UKwU0uQNXXrzPG8mLcM92EPA/yhwV5zVHb2axzKI8a0ghdytsP8UArZkKJqxVdDmbdsEJZzRJECRrbRZOQ50XtfbMGjZvv5xEkEPbK7wNqF3JKnj10lRxxL22k3OO+AHOSWlzjIukzhqUSRCPPR76xYGER4KVc+EL5br6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDPCPzIS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDPCPzIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780128168; x=1811664168;
  h=date:from:to:cc:subject:message-id;
  bh=1i3YteHo0+Ds3v9K6BAMrkIZAmDzS1B9hUThgLenArQ=;
  b=fDPCPzISj48hqmi9BH2AwBaRZ+T2AyTFcHUQFtjoo2y+tAN82LitJfN4
   YtEFYAa467J+2NuQ9n7wZ+4shSSqJgVDv4/NYSz7mFPymm0nym60+Ou5d
   i7A1TG2bHUQ/FwBgmSZcyZqVCTbndEk1W29v9zfAVkrTfSMwT2Nt1feOD
   PEuTDHRekpGGbUQwDONrpkJTduLcgLZcmD5MVju5Lr9E1Jrbh5916CXBM
   rakZANj9RrwLLLDPeH/ryULvpUkJtjlC0Vv49OjScyesmhLyFdCc3LKmh
   vJ2HfUQ6Ji9C8oockdzKSM4ftBpi4r0lfLUrwLj2DGMiTdLX+IzzIDtQu
   g==;
X-CSE-ConnectionGUID: 8yKYb3QhTuKrMP2N0uwL6A==
X-CSE-MsgGUID: F90HIJEiSkSVoqSt+T5NFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="84829595"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="84829595"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 01:02:47 -0700
X-CSE-ConnectionGUID: zzwIWFx1TtKodfzkr3cWjw==
X-CSE-MsgGUID: umMS4cyCTjGJ8wPJRA/wsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="240047315"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 May 2026 01:02:47 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTEea-0000000015R-2Rbt;
	Sat, 30 May 2026 08:02:44 +0000
Date: Sat, 30 May 2026 10:02:20 +0200
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 42/43] mm/mm_init.c:920:37: error:
 'struct zone' has no member named 'pageblock_flags'
Message-ID: <202605300924.HRYSUNlR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   dea73df6b6f456832390a9acd2c44cf235110d30
commit: a2a98cd08700b29ee25458e078d1c20cc3cb4131 [42/43] mm: guard pageblock init against missing pageblock_flags
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260530/202605300924.HRYSUNlR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300924.HRYSUNlR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300924.HRYSUNlR-lkp@intel.com/

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
