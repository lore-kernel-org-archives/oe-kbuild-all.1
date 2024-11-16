Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E3F18052
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731772966; cv=none; b=DQx/Rfqxx6BQyP3hj/QCunLbQCOnaa61aimiz3yWX6jnIOzFpTdfRUgVPmcYbQ1e0SHYy1elK0De1gP766V4h5C/ZZEcNkY76iClusNNw7YxHmAFd5SuLmuIkdfM3mAxPMzpjf0jDcmEr8qBcKu1/7zSTJCAmKQeZxL3pkvwI4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731772966; c=relaxed/simple;
	bh=uOaWKu/O1DnXZaM5dloHn2ZKgh6IIxjSZK/I05mEt5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhcWw0sN5u7mP3CBqCX+6luf08tL3BKPt8NXEJzDWozBkv0Jdx9cVmNx1FEZViz3KDWZxqUgzjzRbp/Mhw/MJQZwPdNLlAs0HYMbElzo6LoMCMsp3TkZu6/zYxxM8WWXDYCt8k/xNugsc0KoNw0dNLZ90/EzHCvIQn1is52keX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZW/nlN1Q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZW/nlN1Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731772963; x=1763308963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uOaWKu/O1DnXZaM5dloHn2ZKgh6IIxjSZK/I05mEt5I=;
  b=ZW/nlN1Q1j2K18hIcKdIXD1KKJFK7vZiFV8b8XF9/5TSl/2UHN5q2NI7
   g+07Otag3SBCa8G7iJYmf60bD7Qyi+K6+3TUJFkP86yZlYKi+ZozfUxBQ
   QA1d5eWLv8lwfneJaCgrFqsuWJzf4BvwRfV1Pv0Au5fjU6vd0QXI5AvmL
   eVkHsaCLcrtuf3dRby53UIdXFSMt6UhYVZe2FdM/im1ZITuuBDZ3w823H
   q0HlyYe2Lwz77h//0DbdC4s62mgliCmV3ZUR/tZtT4XbRdjv4XI7+i8wj
   66kZ9RJum3TM7p8Pe6EkDjfUjmo46F6/t4s3bmiadt/ceOJGmonlYtuxi
   g==;
X-CSE-ConnectionGUID: nZHmiqGvTNaDrRLQAzv3Rw==
X-CSE-MsgGUID: Ltv5Ch35SF+0mdA0R5wIbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31868653"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31868653"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 08:02:42 -0800
X-CSE-ConnectionGUID: k4xu2b0ORqa0UZH9WRCCww==
X-CSE-MsgGUID: ruc+0xm7Q8SzSrI/KNYvbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88398100"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Nov 2024 08:02:40 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCLFu-0000rp-24;
	Sat, 16 Nov 2024 16:02:38 +0000
Date: Sun, 17 Nov 2024 00:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-9dc491310679 14/66]
 mm/vmscan.c:1565:13: error: call to undeclared function
 'lru_raw_gen_from_flags'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202411162345.DOyJHTij-lkp@intel.com>
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
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241116/202411162345.DOyJHTij-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241116/202411162345.DOyJHTij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411162345.DOyJHTij-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:49:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:51:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      51 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:678:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     678 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1043:15: warning: no previous prototype for function 'shrink_slab' [-Wmissing-prototypes]
    1043 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^
   mm/vmscan.c:1043:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1043 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         | ^
         | static 
>> mm/vmscan.c:1565:13: error: call to undeclared function 'lru_raw_gen_from_flags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1565 |                 int gen = lru_raw_gen_from_flags(READ_ONCE(folio->flags));
         |                           ^
>> mm/vmscan.c:1567:31: error: use of undeclared identifier 'ISOLATED_FOLIO_MIN'
    1567 |                 VM_WARN_ON_ONCE_FOLIO(gen < ISOLATED_FOLIO_MIN, folio);
         |                                             ^
   mm/vmscan.c:1569:13: error: use of undeclared identifier 'ISOLATED_FOLIO_MIN'
    1569 |                 if (gen > ISOLATED_FOLIO_MIN)
         |                           ^
   mm/vmscan.c:1570:29: error: use of undeclared identifier 'ISOLATED_FOLIO_MIN'
    1570 |                         referenced_ptes += gen - ISOLATED_FOLIO_MIN;
         |                                                  ^
   mm/vmscan.c:2446:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2446 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2974:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2974 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2975:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2975 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:7353:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    7353 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   9 warnings and 4 errors generated.


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
