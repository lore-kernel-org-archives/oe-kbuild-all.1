Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D956C37475D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jul 2026 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124631; cv=none; b=GSgwRfloEUEUwWQE75tFtrG/T3+puUl93hobI3myEm+iuLZTTC7wp7UL1iI70OMalu/nm/4W/vHppNdPIGsqvZWdHBPwS07943CWSRoxR1JU8qPs9OzE1IHScpDaC549YxwxE/QixgLSR2eZ4SEG48Gdr4BZoVYBHu+QHEQx+XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124631; c=relaxed/simple;
	bh=rlZsjcY4gsQo9GwynL+DF3A5cNwIH3rTsbvgWTNXxFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SMO9gKemGiE7iH2/m8ldMRGscemNBAoIkSalCZTICWjyb4tYDWgNnD3uUcbdjP+WP+qxsIA61DTvq4c1shT4fiQdFYtxD5CnTg8eBf8jqHcMNsp8KjwuOUIEG1XWCq0ilTpf8JkM1mJEJR/w0Lg/sZgATXxz8+kOhWswKt2JiNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLheQoOc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLheQoOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784124629; x=1815660629;
  h=date:from:to:cc:subject:message-id;
  bh=rlZsjcY4gsQo9GwynL+DF3A5cNwIH3rTsbvgWTNXxFg=;
  b=nLheQoOcoMhwMEnf0cqY3/5lyqo97/HcRPM09W16OOdlwnNAYL9nMVh+
   olORV0WkB36IMMrb78zyG3rtKIo7akBYJP8WAVtboTaqcofe/Oe02Gd4T
   H1CACZby7Y26cVXySM1ssB8OSAg1z1RUtjJve6IO8DR41+9sSKmMnsQvS
   yWsno+HJqfapsu5XXLvG4fsmbZXHdPXnv43yNr4aBTUxsGTWIEAjvN8La
   jCifi7ZvWlijlz6yWg+DbUX02Q1esUMk1UvXnRJwQoxLwgsbDTh34QVWS
   mW+IcDVqvaC+12GXpPIhL2efXeimSQubRvspVhZySwggY2LlYorXRoPkz
   g==;
X-CSE-ConnectionGUID: qLWCtSL/TXWB/G369nmBcQ==
X-CSE-MsgGUID: XOKv2rdwS82Ed6GUsp2Luw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84615843"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84615843"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:10:28 -0700
X-CSE-ConnectionGUID: HoaVfa2mQ3yjoHkFde97zw==
X-CSE-MsgGUID: ihwuGqboS5OpBCNJPur1Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="251778380"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jul 2026 07:10:27 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk0Jc-000000004G3-3vP6;
	Wed, 15 Jul 2026 14:10:24 +0000
Date: Wed, 15 Jul 2026 16:10:18 +0200
From: kernel test robot <lkp@intel.com>
To: "Pratyush Yadav (Google)" <pratyush@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/memblock.c:1811:13: error: implicit declaration of
 function 'kho_scratch_overlap'; did you mean 'kho_scratch_only'?
Message-ID: <202607151624.fHajjE6d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-generalize-radix-tree-APIs/20260710-014638
head:   a4ac1827ac09b0b27fd42c9776b5f5bae67530c8
commit: 788c372caf6d783deb58a4ba3e8c2c95d62b3454 memblock: make HugeTLB bootmem allocation work with KHO
date:   6 days ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260715/202607151624.fHajjE6d-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260715/202607151624.fHajjE6d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607151624.fHajjE6d-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memblock.c: In function 'memblock_alloc_hugetlb':
>> mm/memblock.c:1811:13: error: implicit declaration of function 'kho_scratch_overlap'; did you mean 'kho_scratch_only'? [-Wimplicit-function-declaration]
    1811 |         if (kho_scratch_overlap(addr, size)) {
         |             ^~~~~~~~~~~~~~~~~~~
         |             kho_scratch_only


vim +1811 mm/memblock.c

  1763	
  1764	/**
  1765	 * memblock_alloc_hugetlb - allocate boot memory for HugeTLB pages
  1766	 * @size:      size of the memory to be allocated in bytes
  1767	 * @nid:       nid of the free memory to find, %NUMA_NO_NODE for any node
  1768	 * @exact_nid: only allocate from the specified nid. If %false, the specified
  1769	 *             nid is tried first, and then all nodes are tried as fallback.
  1770	 *
  1771	 * HugeTLB pages are always aligned by their size, so the alignment matches
  1772	 * @size. Since the memory is for userspace, mirrored memory is not used. The
  1773	 * memory is not zeroed. Does not panic if request cannot be satisfied.
  1774	 *
  1775	 * Return:
  1776	 * Virtual address of allocated memory block on success, %NULL on failure.
  1777	 */
  1778	void * __init memblock_alloc_hugetlb(phys_addr_t size, int nid, bool exact_nid)
  1779	{
  1780		enum memblock_flags flags = choose_memblock_flags();
  1781		phys_addr_t addr, start = 0, end = MEMBLOCK_ALLOC_ACCESSIBLE;
  1782	
  1783		memblock_dbg("%s: %llu bytes, nid=%d, exact_nid=%d %pS\n", __func__,
  1784			     (u64)size, nid, exact_nid, (void *)_RET_IP_);
  1785	
  1786		/* Don't waste mirrored memory on HugeTLB pages. */
  1787		flags &= ~MEMBLOCK_MIRROR;
  1788	retry:
  1789		/* HugeTLB pages are always aligned by their size. */
  1790		addr = memblock_find_in_range_node(size, size, start, end, nid, flags);
  1791		if (addr)
  1792			goto found;
  1793	
  1794		/* Try all nodes if allowed. */
  1795		if (numa_valid_node(nid) && !exact_nid) {
  1796			nid = NUMA_NO_NODE;
  1797			goto retry;
  1798		}
  1799	
  1800		/* Found nothing... :-( */
  1801		return NULL;
  1802	
  1803	found:
  1804		/*
  1805		 * HugeTLB pages can be preserved with KHO and no preserved memory can
  1806		 * be in scratch. So retry if found address overlaps with scratch.
  1807		 *
  1808		 * Scratch areas are normally not very large, so this shouldn't take too
  1809		 * many retries.
  1810		 */
> 1811		if (kho_scratch_overlap(addr, size)) {
  1812			if (memblock_bottom_up())
  1813				start = addr + size;
  1814			else
  1815				start = addr - size;
  1816	
  1817			goto retry;
  1818		}
  1819	
  1820		if (__memblock_reserve(addr, size, nid, MEMBLOCK_RSRV_KERN | MEMBLOCK_RSRV_HUGETLB))
  1821			return NULL;
  1822	
  1823		memblock_prep_allocation(addr, size, true);
  1824		return phys_to_virt(addr);
  1825	}
  1826	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
