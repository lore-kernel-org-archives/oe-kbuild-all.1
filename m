Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE621AC8A2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 18:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731349240; cv=none; b=sKG8rX88OIG8hqx7yANqLD/MSJEVjflxzCW8pjP/ND5LbYRaAjQE1oXsJM5cEQc9kjn/p0LPr21k/wSNu6fgAFJBHQZzR/Ga5idJJIJ0/bBLhaDkMH/QOzq2NLcpmKrWudPDbqivD2o9pT5ER2EpyySSM5k2K9GWVjiNgjJ6PdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731349240; c=relaxed/simple;
	bh=z9j21DvRgipbuyWmdVNYQqe06OcBsNRIGkfQj1MW590=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wj+FaDdIQNaIHotj+t6yOVb5CQmFO4VldyCe76mCMrYabZ/pkTKb3PscA5T91gr1lgpysCgYCik/CCus3iI32rQtISGHBqZvPeQ6Trvdn25m+h3DuVrNdWUXzZdzhPySUkMVOgK5HypRg4ymy4NorAE0a5LLiRYwPlYsKG0kWm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0fSRl/v; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0fSRl/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731349239; x=1762885239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z9j21DvRgipbuyWmdVNYQqe06OcBsNRIGkfQj1MW590=;
  b=e0fSRl/vClkzlSpAENXGkwfIctbUfdlfRlrQy6fBQ4lsFB+uvXDMkWOw
   HpMGXBWsYalWgxc6kuVaw6yNSeDPDnniK7lmcEsUA9KYCmTr0rfaviO4z
   /NJEasoyDCajHrR1gaVM1cTRnxEAiQ+yHLClb5snrgdxoI6BzrEWeHIeY
   X2xUUcbZRkc1nmnAnWROqVbhSGmY1OR7f36MP0Mi9NIf9b5yTEdeNjbWM
   4yCRCJ62+RR4n8BNKZZ1awHu3TT4VnLliFEvtJQ2MNhVFjQtCpff/3Rsu
   pP/z3fswGknZSi0HANg+17mElrwusSSrkedjnHh+8BLlOBGraxBqzOwC6
   g==;
X-CSE-ConnectionGUID: uQ3Aq54ARR+74Ey9mbFAFg==
X-CSE-MsgGUID: KAK8Tq8YRne8sFU32Ys34A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53725093"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53725093"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 10:20:36 -0800
X-CSE-ConnectionGUID: c1Eoood1Sze2bQ4lIP1m+Q==
X-CSE-MsgGUID: Ef0d7fezSfyyJB+BBz8Lgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="117956315"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Nov 2024 10:20:35 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAZ1c-00006l-1v;
	Mon, 11 Nov 2024 18:20:32 +0000
Date: Tue, 12 Nov 2024 02:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 57/64] fs/xfs/xfs_zone_alloc.c:616:2: error:
 member reference type 'struct rw_semaphore' is not a pointer; did you mean
 to use '.'?
Message-ID: <202411120227.fqQWteqg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   f9bf4d561e545fe8e988fb807cc47d879f0a00f8
commit: 2f5de4ae28a5883ab65a767f5b0f1c7cc85bc0eb [57/64] xfs: add a separate data structure for open zones
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241112/202411120227.fqQWteqg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411120227.fqQWteqg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411120227.fqQWteqg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_zone_alloc.c:5:
   In file included from fs/xfs/xfs.h:26:
   In file included from fs/xfs/xfs_linux.h:25:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/xfs_zone_alloc.c:616:2: error: member reference type 'struct rw_semaphore' is not a pointer; did you mean to use '.'?
     616 |         lockdep_assert_held(rtg_rmap(rtg)->i_lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:52: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                             ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
      54 |         int __ret_warn_on = !!(x);                      \
         |                                ^
>> fs/xfs/xfs_zone_alloc.c:616:2: error: cannot take the address of an rvalue of type 'struct lockdep_map'
     616 |         lockdep_assert_held(rtg_rmap(rtg)->i_lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:45: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                      ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
      54 |         int __ret_warn_on = !!(x);                      \
         |                                ^
   4 warnings and 2 errors generated.


vim +616 fs/xfs/xfs_zone_alloc.c

   606	
   607	/*
   608	 * Check if @rgbno in @rgb is a potentially valid block.  It might still be
   609	 * unused, but that information is only found in the rmap.
   610	 */
   611	bool
   612	xfs_zone_rgbno_is_valid(
   613		struct xfs_rtgroup	*rtg,
   614		xfs_rgnumber_t		rgbno)
   615	{
 > 616		lockdep_assert_held(rtg_rmap(rtg)->i_lock);
   617	
   618		if (rtg->rtg_open_zone)
   619			return rgbno < rtg->rtg_open_zone->oz_write_pointer;
   620		return !xa_get_mark(&rtg_mount(rtg)->m_groups[XG_TYPE_RTG].xa,
   621				rtg_rgno(rtg), XFS_RTG_FREE);
   622	}
   623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
