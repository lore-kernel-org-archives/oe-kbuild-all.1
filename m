Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADC38120D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 11:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728734225; cv=none; b=Y4CAxHPMPbWHOccIjlC6IVrRe3QwYJitRHTxp0IQkByiOWCBYsgLvWX2DyVmBjN46gh4q2oM+k2sODKU4SzwoWtvBSeEZwME1pUOEkqp5PkdHolN8QIhAezgJ8rpXqB4vhQlSEz8qZ7zm2b+bhwFFXjjBRzxbO0i4JW0pfVYSSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728734225; c=relaxed/simple;
	bh=t6jsab1ApF7iGjm9xAQCNfBHiGWpj7emCvGENj8MUpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=luZYGWL0CaOQJaYg0rosqhb12Lak2U/yEjSf00n5OCHlelAx/KP2bbmKJxGvPgAeEmpmEuk0UarbOSY1IkVeQbrWSdoh+S/t1vogz5uhal/5BGNjeFrKKz2gDRvpJrQB5qqfAjrO4TtBmtK/+AYB+mn4to5x85zP3NbrvoBy8YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NP2pqi86; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NP2pqi86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728734224; x=1760270224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t6jsab1ApF7iGjm9xAQCNfBHiGWpj7emCvGENj8MUpc=;
  b=NP2pqi862q7A8TN4kJG0kStAosrMYzUiV5XjVRzmuzzf8vKfm2xmRIfz
   lq6Z7C/eGZeErNoh49bglaz132zoApcuGhbeYWPDokrDCknkNqE0onfwT
   LtjUPxlTvSI+rTTAaqQaIXN2y/NMyaqJXntXLS27zYWBiatbWFVZbFFb2
   6mBDBrvhWyMvICV2FYRiol/FO2+5p0foCPrUAR8QLABDHLDQAry/9eS4j
   7o1tPM9eJSsz7kEov1eirBi67AtxrAU92oltK83aNEbhfN0f6NBp9fSD7
   nLwEYFbdSEIC7xUGL++rryqOz05epzDk6xD/W9ylexSzXYoCmMsfC3uxz
   g==;
X-CSE-ConnectionGUID: XTb2J2JTR0yn5Z1zOaLxMg==
X-CSE-MsgGUID: e4EPEjhFTlGtKGmLA5AhyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32043989"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="32043989"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 04:57:03 -0700
X-CSE-ConnectionGUID: 2gYJXahHR1iptmnQ79yx+w==
X-CSE-MsgGUID: h08J2ypfTj2EhaPrbE4sOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="100464173"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Oct 2024 04:57:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szak0-000DKT-0X;
	Sat, 12 Oct 2024 11:57:00 +0000
Date: Sat, 12 Oct 2024 19:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 3/5] mm/vmscan.c:1537:31: error: use of
 undeclared identifier 'ISOLATED_FOLIO_MIN'
Message-ID: <202410121918.iHFqEK5S-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241012/202410121918.iHFqEK5S-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121918.iHFqEK5S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121918.iHFqEK5S-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c:1535:13: error: call to undeclared function 'lru_raw_gen_from_flags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1535 |                 int gen = lru_raw_gen_from_flags(READ_ONCE(folio->flags));
         |                           ^
>> mm/vmscan.c:1537:31: error: use of undeclared identifier 'ISOLATED_FOLIO_MIN'
    1537 |                 VM_WARN_ON_ONCE_FOLIO(gen < ISOLATED_FOLIO_MIN, folio);
         |                                             ^
   mm/vmscan.c:1539:13: error: use of undeclared identifier 'ISOLATED_FOLIO_MIN'
    1539 |                 if (gen > ISOLATED_FOLIO_MIN)
         |                           ^
   mm/vmscan.c:1540:29: error: use of undeclared identifier 'ISOLATED_FOLIO_MIN'
    1540 |                         referenced_ptes += gen - ISOLATED_FOLIO_MIN;
         |                                                  ^
   4 errors generated.


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
