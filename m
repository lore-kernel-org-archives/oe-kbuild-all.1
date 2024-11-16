Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64ABF9CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731774288; cv=none; b=ZPOxKoOjHpZyyd8rdwxa0hmVEgLWkWxihAm4crq35RE7NXLTlBQoTthayXgECvI+yxLIflEavcr15Jg415Jyc+H5/3fa/XqTRR66PIzcjAGC8zoo2guJ8XjrCOsQG/AH1XrEwke4kMybA4kpbLnXd7QrDPVciv5g7IWnVGn2SAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731774288; c=relaxed/simple;
	bh=5yK0cQ2vIUmpVGrKE+3BGCIl94U3Mf+S8KfP63Ytyys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOJb6S0wm37Xx4AlA9I3daUiLzsoMUAVBDiTL6gzBNjbIWU/VNT1s2Zs7MFJRzi88JWPionoh/XRd+eMrGTzOcv5olXkh7RkPtNr1zeUdTMOVZuqmP4T55oqzhOcgmIUxFGaqGSn0Gb3lpQFoTptKTKKJQp/sNKtgYyyzW9iLMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LE33RRv9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LE33RRv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731774285; x=1763310285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yK0cQ2vIUmpVGrKE+3BGCIl94U3Mf+S8KfP63Ytyys=;
  b=LE33RRv9Bu8KgMnrmhcBec5cXuOixvTsmsmyUi5vCdPYDKZdwUkLHQmq
   Av8iflyyaEePBt1S7Eh6p08EbMKuXWpl35Vk1tegtAKKu9iaXVEDIGlwa
   lzygvsCM3TU3UJFLfAzeT/4dFOlf+U3MreN3HRayoA788zgMV2fansblY
   4iiKtiL01+RIutZOttYaGlLTyi7YQktPok8bMtfQHni7G8Bux1uDg7cBq
   203tInzqPpn6bbmru58U5jj1xkJoMJhaCHO1Ox1Q+f8fKhx6R7xvfvSip
   BcQWQsMqgk7ALSNOOURxP4DaVsd/zkMgMchlLasRjlBBrIVtcYVazxfMW
   A==;
X-CSE-ConnectionGUID: abEz6otEQUmHX+OwX/Rkyw==
X-CSE-MsgGUID: eQmsFyJmT4u8i2xbagWoJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31713581"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31713581"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 08:24:45 -0800
X-CSE-ConnectionGUID: GCY81N71SjOXa/Y/MTxfag==
X-CSE-MsgGUID: B41VgNyZQkOWG5uO/6qwgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="89221138"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Nov 2024 08:24:44 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCLbF-0000uf-2k;
	Sat, 16 Nov 2024 16:24:41 +0000
Date: Sun, 17 Nov 2024 00:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-9dc491310679 14/66]
 mm/vmscan.c:1565:27: error: implicit declaration of function
 'lru_raw_gen_from_flags'
Message-ID: <202411170023.bAbbytdz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-9dc491310679
head:   85b769c103dd3276826ee519cc574181563acb08
commit: 29749af3cb36ba2c31106d631bffa86aa7f7e3de [14/66] CHROMIUM: mm/mglru: Improve isolated page access bit harvesting
config: arm-vf610m4_defconfig (https://download.01.org/0day-ci/archive/20241117/202411170023.bAbbytdz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170023.bAbbytdz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170023.bAbbytdz-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c:1043:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
    1043 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
   mm/vmscan.c: In function 'folio_check_references':
>> mm/vmscan.c:1565:27: error: implicit declaration of function 'lru_raw_gen_from_flags' [-Wimplicit-function-declaration]
    1565 |                 int gen = lru_raw_gen_from_flags(READ_ONCE(folio->flags));
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/vmscan.c:15:
>> mm/vmscan.c:1567:45: error: 'ISOLATED_FOLIO_MIN' undeclared (first use in this function)
    1567 |                 VM_WARN_ON_ONCE_FOLIO(gen < ISOLATED_FOLIO_MIN, folio);
         |                                             ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/vmscan.c:1567:17: note: in expansion of macro 'VM_WARN_ON_ONCE_FOLIO'
    1567 |                 VM_WARN_ON_ONCE_FOLIO(gen < ISOLATED_FOLIO_MIN, folio);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1567:45: note: each undeclared identifier is reported only once for each function it appears in
    1567 |                 VM_WARN_ON_ONCE_FOLIO(gen < ISOLATED_FOLIO_MIN, folio);
         |                                             ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/vmscan.c:1567:17: note: in expansion of macro 'VM_WARN_ON_ONCE_FOLIO'
    1567 |                 VM_WARN_ON_ONCE_FOLIO(gen < ISOLATED_FOLIO_MIN, folio);
         |                 ^~~~~~~~~~~~~~~~~~~~~


vim +/lru_raw_gen_from_flags +1565 mm/vmscan.c

  1539	
  1540	static enum folio_references folio_check_references(struct folio *folio,
  1541							  struct scan_control *sc)
  1542	{
  1543		int referenced_ptes, referenced_folio;
  1544		unsigned long vm_flags;
  1545		int ret = 0;
  1546		bool trylock_failed = false;
  1547	
  1548	#ifdef CONFIG_ANDROID_VENDOR_OEM_DATA
  1549		trace_android_vh_page_should_be_protected(folio, sc->nr_scanned,
  1550			sc->priority, &sc->android_vendor_data1, &ret);
  1551	#endif
  1552		trace_android_vh_check_folio_look_around_ref(folio, &ret);
  1553		if (ret)
  1554			return ret;
  1555	
  1556		trace_android_vh_folio_trylock_set(folio);
  1557		referenced_ptes = folio_referenced(folio, 1, sc->target_mem_cgroup,
  1558						   &vm_flags);
  1559		referenced_folio = folio_test_clear_referenced(folio);
  1560		trace_android_vh_get_folio_trylock_result(folio, &trylock_failed);
  1561		if (trylock_failed)
  1562			return FOLIOREF_KEEP;
  1563	
  1564		if (lru_gen_enabled()) {
> 1565			int gen = lru_raw_gen_from_flags(READ_ONCE(folio->flags));
  1566	
> 1567			VM_WARN_ON_ONCE_FOLIO(gen < ISOLATED_FOLIO_MIN, folio);
  1568	
  1569			if (gen > ISOLATED_FOLIO_MIN)
  1570				referenced_ptes += gen - ISOLATED_FOLIO_MIN;
  1571		}
  1572	
  1573		/*
  1574		 * The supposedly reclaimable folio was found to be in a VM_LOCKED vma.
  1575		 * Let the folio, now marked Mlocked, be moved to the unevictable list.
  1576		 */
  1577		if (vm_flags & VM_LOCKED)
  1578			return FOLIOREF_ACTIVATE;
  1579	
  1580		/*
  1581		 * There are two cases to consider.
  1582		 * 1) Rmap lock contention: rotate.
  1583		 * 2) Skip the non-shared swapbacked folio mapped solely by
  1584		 *    the exiting or OOM-reaped process.
  1585		 */
  1586		if (referenced_ptes == -1)
  1587			return FOLIOREF_KEEP;
  1588	
  1589		if (referenced_ptes) {
  1590			/*
  1591			 * All mapped folios start out with page table
  1592			 * references from the instantiating fault, so we need
  1593			 * to look twice if a mapped file/anon folio is used more
  1594			 * than once.
  1595			 *
  1596			 * Mark it and spare it for another trip around the
  1597			 * inactive list.  Another page table reference will
  1598			 * lead to its activation.
  1599			 *
  1600			 * Note: the mark is set for activated folios as well
  1601			 * so that recently deactivated but used folios are
  1602			 * quickly recovered.
  1603			 */
  1604			folio_set_referenced(folio);
  1605	
  1606			if (referenced_folio || referenced_ptes > 1)
  1607				return FOLIOREF_ACTIVATE;
  1608	
  1609			/*
  1610			 * Activate file-backed executable folios after first usage.
  1611			 */
  1612			if ((vm_flags & VM_EXEC) && folio_is_file_lru(folio))
  1613				return FOLIOREF_ACTIVATE;
  1614	
  1615			return FOLIOREF_KEEP;
  1616		}
  1617	
  1618		/* Reclaim if clean, defer dirty folios to writeback */
  1619		if (referenced_folio && folio_is_file_lru(folio))
  1620			return FOLIOREF_RECLAIM_CLEAN;
  1621	
  1622		return FOLIOREF_RECLAIM;
  1623	}
  1624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
