Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C11F145A19
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728734827; cv=none; b=i3xmC31A1sqgpHLFFD0alOifkvCLFIbykAXS1bCeYekVpK6CUSu+kGikwhzq1YGduk6Hlb7cA80dYNGYFtFENyV4Fjb0lRftba0tANtCtydESyoU/Lk0uvwcJrvCzCqCjYboixTYF8HcxXjFpkVygkhuXnnwUBOe2DN1aNjTCvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728734827; c=relaxed/simple;
	bh=SN6xjBa4ZRJAdKTTbCzfC9y+oYPHSVXHzroiXipdGfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BR7+UqfA5C0yDWzoJRGpCTyljuCNJWxS9aM8DMxiqytQtTso7J0aXRVxhfehgCu4fFT0/gjBIVKa5x2iZdKAx5DUeW2f1UD+buXkWsSM9SuzoT1qhBVlYQt/Gx8h4kCsjeD2LDf4ycSgxnCksooHZg7saLS7bMKPAI4NqaNomk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZqHW/Op; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZqHW/Op"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728734825; x=1760270825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SN6xjBa4ZRJAdKTTbCzfC9y+oYPHSVXHzroiXipdGfY=;
  b=OZqHW/OpebVx/dEsZAtoynB/6ETqhMFAEmsRPklwnlftHQ963pvd4Tyu
   mkpbyxqEEdwhtjmJ/ZMpovJjIaXj4jbsiYuzjKN+q8Fz9d78BVa6UFnxt
   vfzV/KIhu3IbF3Zj3s1RcB2M54T+u1yvySkaVtQ3S3Q7gsk2zLiaibLtP
   7FGudGjgNlhVb2t3vBdnnY6F6pqHpkyWK+eZL7paDCjI4xzkGLXuX1KQr
   3rQcNEh7ZZhFrp4aw9EVks+Gk0gdLs58E7y7OdPUxVllhhcAkZFukf2TH
   bW0G1pUCK5F8PPiwFK3g7XTrBTRJ7B2tOJYSr1nXDnKl/JVuTuaa/SfTO
   g==;
X-CSE-ConnectionGUID: 8tWkHJ25ST6JdzN1xK/HPQ==
X-CSE-MsgGUID: oB8jwoESSjGeA6LO4C81Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28301938"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="28301938"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 05:07:05 -0700
X-CSE-ConnectionGUID: ViHEYS6+RaeNJ4z3NASFfA==
X-CSE-MsgGUID: aobIDGBmRYGuj+3tRCwLAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77338660"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Oct 2024 05:07:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szatg-000DLh-28;
	Sat, 12 Oct 2024 12:07:00 +0000
Date: Sat, 12 Oct 2024 20:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 3/5] mm/vmscan.c:1537:45: error:
 'ISOLATED_FOLIO_MIN' undeclared
Message-ID: <202410122013.EnLPIEO0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   dc34775004416cce5b19d0d38d0b0988891cb80b
commit: bc4946831df47ecd08b164f726d5fd5846be326e [3/5] CHROMIUM: mm/mglru: Improve isolated page access bit harvesting
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241012/202410122013.EnLPIEO0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410122013.EnLPIEO0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410122013.EnLPIEO0-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'folio_check_references':
   mm/vmscan.c:1535:27: error: implicit declaration of function 'lru_raw_gen_from_flags' [-Werror=implicit-function-declaration]
    1535 |                 int gen = lru_raw_gen_from_flags(READ_ONCE(folio->flags));
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/vmscan.c:15:
>> mm/vmscan.c:1537:45: error: 'ISOLATED_FOLIO_MIN' undeclared (first use in this function)
    1537 |                 VM_WARN_ON_ONCE_FOLIO(gen < ISOLATED_FOLIO_MIN, folio);
         |                                             ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/vmscan.c:1537:17: note: in expansion of macro 'VM_WARN_ON_ONCE_FOLIO'
    1537 |                 VM_WARN_ON_ONCE_FOLIO(gen < ISOLATED_FOLIO_MIN, folio);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1537:45: note: each undeclared identifier is reported only once for each function it appears in
    1537 |                 VM_WARN_ON_ONCE_FOLIO(gen < ISOLATED_FOLIO_MIN, folio);
         |                                             ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/vmscan.c:1537:17: note: in expansion of macro 'VM_WARN_ON_ONCE_FOLIO'
    1537 |                 VM_WARN_ON_ONCE_FOLIO(gen < ISOLATED_FOLIO_MIN, folio);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ISOLATED_FOLIO_MIN +1537 mm/vmscan.c

  1523	
  1524	static enum folio_references folio_check_references(struct folio *folio,
  1525							  struct scan_control *sc)
  1526	{
  1527		int referenced_ptes, referenced_folio;
  1528		unsigned long vm_flags;
  1529	
  1530		referenced_ptes = folio_referenced(folio, 1, sc->target_mem_cgroup,
  1531						   &vm_flags);
  1532		referenced_folio = folio_test_clear_referenced(folio);
  1533	
  1534		if (lru_gen_enabled()) {
  1535			int gen = lru_raw_gen_from_flags(READ_ONCE(folio->flags));
  1536	
> 1537			VM_WARN_ON_ONCE_FOLIO(gen < ISOLATED_FOLIO_MIN, folio);
  1538	
  1539			if (gen > ISOLATED_FOLIO_MIN)
  1540				referenced_ptes += gen - ISOLATED_FOLIO_MIN;
  1541		}
  1542	
  1543		/*
  1544		 * The supposedly reclaimable folio was found to be in a VM_LOCKED vma.
  1545		 * Let the folio, now marked Mlocked, be moved to the unevictable list.
  1546		 */
  1547		if (vm_flags & VM_LOCKED)
  1548			return FOLIOREF_ACTIVATE;
  1549	
  1550		/* rmap lock contention: rotate */
  1551		if (referenced_ptes == -1)
  1552			return FOLIOREF_KEEP;
  1553	
  1554		if (referenced_ptes) {
  1555			/*
  1556			 * All mapped folios start out with page table
  1557			 * references from the instantiating fault, so we need
  1558			 * to look twice if a mapped file/anon folio is used more
  1559			 * than once.
  1560			 *
  1561			 * Mark it and spare it for another trip around the
  1562			 * inactive list.  Another page table reference will
  1563			 * lead to its activation.
  1564			 *
  1565			 * Note: the mark is set for activated folios as well
  1566			 * so that recently deactivated but used folios are
  1567			 * quickly recovered.
  1568			 */
  1569			folio_set_referenced(folio);
  1570	
  1571			if (referenced_folio || referenced_ptes > 1)
  1572				return FOLIOREF_ACTIVATE;
  1573	
  1574			/*
  1575			 * Activate file-backed executable folios after first usage.
  1576			 */
  1577			if ((vm_flags & VM_EXEC) && folio_is_file_lru(folio))
  1578				return FOLIOREF_ACTIVATE;
  1579	
  1580			return FOLIOREF_KEEP;
  1581		}
  1582	
  1583		/* Reclaim if clean, defer dirty folios to writeback */
  1584		if (referenced_folio && folio_is_file_lru(folio))
  1585			return FOLIOREF_RECLAIM_CLEAN;
  1586	
  1587		return FOLIOREF_RECLAIM;
  1588	}
  1589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
