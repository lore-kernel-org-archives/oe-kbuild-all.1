Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648882D3750
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766242815; cv=none; b=cY3c9VnGetuMEpz6PAAoLCDTsCjQMvCdYXOmQj6pBTGyzNf0QzrxWW7m9gnQ8asp6J41JIV3KU17z9VQ9r5I6LD/orRvpZnPAnu99o+dXpUXCPV+trruZnTZ83407yD76rl/JGb+JiNRPrXadO4OUnuz4wUVQypeDs2jqdZHiQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766242815; c=relaxed/simple;
	bh=t0kTphUfV5Viyt9qXf69USjyofS5XLA9Xg7l4P6/zzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WmkqibqbGK/Ku/7XkM70Q9eFx+TU+/I+dPCkSEOKbzUcpYKb26NfzhAIuF7Ylkm9tQi5Junx36isLIXXNUwreNybNDPduem0TvwafeftGaBc+s5JW6pWooerz/nQXTyrDF/8SJUXd0q1m02XjlT6keY4sLTWnocq+M1df/xrRS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNZstMmD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNZstMmD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766242813; x=1797778813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t0kTphUfV5Viyt9qXf69USjyofS5XLA9Xg7l4P6/zzU=;
  b=UNZstMmD4dYRzkxs2lKKdUn6JF3CN9DudBUWNyJCDgaFAJtvWYliDHlk
   ObhqjhoWZJSw1oYcarVqDVhHkocmho2IDbq6CXDNXPYIRCR1Vkl3Giotm
   /q2CbNiAFQ+JrHcIvezgN4zpS66FEHMxl+FszXMnue1OCzET2NcFaVDE+
   ls3rUPGqgu1I4RWHfzHIzRC8SThDLqPQtJdpnBuqE0GdSa7D7Ax3OJ9eV
   OR+Hh96LtazwbSdKFM+ApZoUanW9nate/preKGeszO0/UnvchhBkNQsQl
   HxZ+4blcaeCrtFBryJf1j9YW6z7F2d0ceYqkcbLOn1H6GM5wcbKomqUxu
   g==;
X-CSE-ConnectionGUID: awyOgfm8Sb2xsLTp0WnHmA==
X-CSE-MsgGUID: n1/0kg7aSayzt1lrdMVnIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68254174"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68254174"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:00:13 -0800
X-CSE-ConnectionGUID: wxVlBfpeTN2APgbcsInRag==
X-CSE-MsgGUID: uy/yLvW+RRy8j0MsKaC63Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204177193"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2025 07:00:11 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyRF-000000004hl-138u;
	Sat, 20 Dec 2025 15:00:09 +0000
Date: Sat, 20 Dec 2025 22:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:hugetlb-init/v0 15/26] arch/powerpc/mm/mem.c:223:19: error:
 'zone_dma_bits' undeclared; did you mean 'zone_dma_limit'?
Message-ID: <202512202237.ObA7f9uX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git hugetlb-init/v0
head:   8f1fbf04ce5ef30eb770231992ca055d4f45e5a7
commit: c4213ce62b5b611f3c28bdd8be9b6f0b15130071 [15/26] powerpc: introduce arch_zone_limits_init()
config: powerpc64-randconfig-001-20251220 (https://download.01.org/0day-ci/archive/20251220/202512202237.ObA7f9uX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202237.ObA7f9uX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202237.ObA7f9uX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:28,
                    from arch/powerpc/include/asm/page.h:11,
                    from arch/powerpc/include/asm/mmu.h:143,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from arch/powerpc/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/memblock.h:12,
                    from arch/powerpc/mm/mem.c:15:
   arch/powerpc/mm/mem.c: In function 'arch_zone_limits_init':
>> arch/powerpc/mm/mem.c:223:19: error: 'zone_dma_bits' undeclared (first use in this function); did you mean 'zone_dma_limit'?
              1UL << (zone_dma_bits - PAGE_SHIFT));
                      ^~~~~~~~~~~~~
   include/linux/minmax.h:92:28: note: in definition of macro '__careful_cmp_once'
     auto ux = (x); auto uy = (y);   \
                               ^
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   arch/powerpc/mm/mem.c:222:28: note: in expansion of macro 'min'
     max_zone_pfns[ZONE_DMA] = min(max_low_pfn,
                               ^~~
   arch/powerpc/mm/mem.c:223:19: note: each undeclared identifier is reported only once for each function it appears in
              1UL << (zone_dma_bits - PAGE_SHIFT));
                      ^~~~~~~~~~~~~
   include/linux/minmax.h:92:28: note: in definition of macro '__careful_cmp_once'
     auto ux = (x); auto uy = (y);   \
                               ^
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   arch/powerpc/mm/mem.c:222:28: note: in expansion of macro 'min'
     max_zone_pfns[ZONE_DMA] = min(max_low_pfn,
                               ^~~
   In file included from <command-line>:
   include/linux/compiler.h:168:10: error: '__UNIQUE_ID_y__663' undeclared (first use in this function); did you mean '__UNIQUE_ID_x__662'?
     __PASTE(__UNIQUE_ID_,     \
             ^~~~~~~~~~~~
   include/linux/compiler_types.h:610:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:630:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
    #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
                            ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:20: note: in expansion of macro '__sign_use'
     (__sign_use(ux) & __sign_use(uy))
                       ^~~~~~~~~~
   include/linux/minmax.h:93:20: note: in expansion of macro '__types_ok'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
                       ^~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:16:23: note: in expansion of macro '___PASTE'
    #define __PASTE(a, b) ___PASTE(a, b)
                          ^~~~~~~~
   include/linux/compiler.h:168:2: note: in expansion of macro '__PASTE'
     __PASTE(__UNIQUE_ID_,     \
     ^~~~~~~
   include/linux/minmax.h:98:48: note: in expansion of macro '__UNIQUE_ID'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
                                                   ^~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   arch/powerpc/mm/mem.c:222:28: note: in expansion of macro 'min'
     max_zone_pfns[ZONE_DMA] = min(max_low_pfn,
                               ^~~


vim +223 arch/powerpc/mm/mem.c

   206	
   207	/*
   208	 * Zones usage:
   209	 *
   210	 * We setup ZONE_DMA to be 31-bits on all platforms and ZONE_NORMAL to be
   211	 * everything else. GFP_DMA32 page allocations automatically fall back to
   212	 * ZONE_DMA.
   213	 *
   214	 * By using 31-bit unconditionally, we can exploit zone_dma_limit to inform the
   215	 * generic DMA mapping code.  32-bit only devices (if not handled by an IOMMU
   216	 * anyway) will take a first dip into ZONE_NORMAL and get otherwise served by
   217	 * ZONE_DMA.
   218	 */
   219	void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
   220	{
   221	#ifdef CONFIG_ZONE_DMA
   222		max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
 > 223					      1UL << (zone_dma_bits - PAGE_SHIFT));
   224	#endif
   225		max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
   226	#ifdef CONFIG_HIGHMEM
   227		max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
   228	#endif
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
