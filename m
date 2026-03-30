Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0617346766
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 19:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900422; cv=none; b=JUqb9EsJi/ht+BZaA+a4BfUVkbiijsjchE8Nw+Ak+dZhr/scdrCk7HX05WBum/xUZ115Wscbb/hoF7T/sXBwe66lCzNHOoNdrHmI/Z+deeFN2ZJrftJ/9KjruBqP0QpCvrOE/ecf/Kl2eyJn+Cl2hfFTEa3Cdh07vPVLY2bfyyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900422; c=relaxed/simple;
	bh=nKoXvKBQuOTM4cYfkdF4CuA+2oWWAQe9LIraoay0Sxg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mbb5Cu/Zd5C16oVRjk8S6Pk+dJPFE6yDunQLJ3QpheqCo/kNFfNh6tGRSAz+kIYNMAyJhXS87V3H8ytxoN/XEBz0H3FI14a+bJ4bzQuPGoC9zfV32A4XOen0JnLpkF+ezPEGiA0mQ1ruAKJyQwlDe2cvKpgztFs5QMwXEvicqqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyK1lwVn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyK1lwVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774900421; x=1806436421;
  h=date:from:to:cc:subject:message-id;
  bh=nKoXvKBQuOTM4cYfkdF4CuA+2oWWAQe9LIraoay0Sxg=;
  b=SyK1lwVndc748a7m6GMxvj1v94u1anvojGbwjyVeE8JEMn2yAJTRIdYN
   rVcKnm6Hw4RoWmQz/4mFix0YPQrpWYWaHtcs6A9ITbaFxsmnWr+kzbfHH
   CC9KK84q0VHthovSa2iZZQ8LXpJzFMdpMqMChWlP89J1gXcHNFt6lm99K
   16ncbuhMNfFUm7Sv5SNByh1tAJFdNf8TDFPEXPWKtiH8D2u9FCyLQ3Cwv
   saOo7EwAsuzqpeAwaRPOMSaKzh7GEQykUUYPkmPBvUl+I+Tket1YPz4MR
   JY/Jb5tKlMDeFD39pMXBlV9CXy0CLT/4pC6F3odFUASuMMHz8AqA27G9e
   w==;
X-CSE-ConnectionGUID: g2yZs9a/RO6b3v2KdHXgnA==
X-CSE-MsgGUID: iZAN75sBQ6CmFx5QB9/Ohw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76094698"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="76094698"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 12:53:40 -0700
X-CSE-ConnectionGUID: XZu//cFaRkKDBIm4FmWhFA==
X-CSE-MsgGUID: V51kk7GfTTq6soRmxdEGvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="249366647"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Mar 2026 12:53:39 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Ig3-000000001cP-3xPj;
	Mon, 30 Mar 2026 19:53:35 +0000
Date: Tue, 31 Mar 2026 03:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Ballasi <tballasi@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-stable 86/300] mm/vmscan.c:6585:66: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202603310305.xSA9Y9fh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
head:   bc2e0d3bf965b1ee6c09b104447158725b831d84
commit: f9504d82d9d52bf557e87dab204fac4d93d53360 [86/300] mm: vmscan: add cgroup IDs to vmscan tracepoints
config: alpha-randconfig-r122-20260330 (https://download.01.org/0day-ci/archive/20260331/202603310305.xSA9Y9fh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310305.xSA9Y9fh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310305.xSA9Y9fh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/vmscan.c:6585:66: sparse: sparse: Using plain integer as NULL pointer
   mm/vmscan.c:6589:58: sparse: sparse: Using plain integer as NULL pointer

vim +6585 mm/vmscan.c

  6551	
  6552	unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
  6553					gfp_t gfp_mask, nodemask_t *nodemask)
  6554	{
  6555		unsigned long nr_reclaimed;
  6556		struct scan_control sc = {
  6557			.nr_to_reclaim = SWAP_CLUSTER_MAX,
  6558			.gfp_mask = current_gfp_context(gfp_mask),
  6559			.reclaim_idx = gfp_zone(gfp_mask),
  6560			.order = order,
  6561			.nodemask = nodemask,
  6562			.priority = DEF_PRIORITY,
  6563			.may_writepage = 1,
  6564			.may_unmap = 1,
  6565			.may_swap = 1,
  6566		};
  6567	
  6568		/*
  6569		 * scan_control uses s8 fields for order, priority, and reclaim_idx.
  6570		 * Confirm they are large enough for max values.
  6571		 */
  6572		BUILD_BUG_ON(MAX_PAGE_ORDER >= S8_MAX);
  6573		BUILD_BUG_ON(DEF_PRIORITY > S8_MAX);
  6574		BUILD_BUG_ON(MAX_NR_ZONES > S8_MAX);
  6575	
  6576		/*
  6577		 * Do not enter reclaim if fatal signal was delivered while throttled.
  6578		 * 1 is returned so that the page allocator does not OOM kill at this
  6579		 * point.
  6580		 */
  6581		if (throttle_direct_reclaim(sc.gfp_mask, zonelist, nodemask))
  6582			return 1;
  6583	
  6584		set_task_reclaim_state(current, &sc.reclaim_state);
> 6585		trace_mm_vmscan_direct_reclaim_begin(sc.gfp_mask, order, 0);
  6586	
  6587		nr_reclaimed = do_try_to_free_pages(zonelist, &sc);
  6588	
  6589		trace_mm_vmscan_direct_reclaim_end(nr_reclaimed, 0);
  6590		set_task_reclaim_state(current, NULL);
  6591	
  6592		return nr_reclaimed;
  6593	}
  6594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
