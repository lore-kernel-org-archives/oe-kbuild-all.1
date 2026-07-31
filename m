Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0992C21DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498197; cv=none; b=GUPrqwuHTmQ4WyPOxMFpZIvxjqXNOQdB0ZtD30Z5St+j3JV7DXj4wgzXuTaOMNPgkGfZ+hZZEGPbyqP8FOeS/9m8rwESTtdXwxJPN2Y0Ew4gaB4r+qhrSkwiBbh+qpze3LvRNl/dXwbf2WXQZ22wwbjEJr8SuyVf3Uo/1/OuJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498197; c=relaxed/simple;
	bh=lNPULcxf/8vZPXnbmICR0Mk7rStgHgn/Coe8OeLDrRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IRsC1W9ZFbwye/4gCbqp5lIdS1DANBrvhTQbPREriGo4HYgengNZ6E1S26NmHVj13pwW3cM/f7NWWfn3rmxDpd9qaUzyVRSdve00A5Z9nTZ+R947ZYPzUDdVqjYKJ0KbFP5MTIzssE4TsYuL6JH7496lJ1SVCCC2o0FxzD0Mtso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvOq1IgK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvOq1IgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785498196; x=1817034196;
  h=date:from:to:cc:subject:message-id;
  bh=lNPULcxf/8vZPXnbmICR0Mk7rStgHgn/Coe8OeLDrRY=;
  b=bvOq1IgKK9zaJLFUwaQRWITj2t8HxakYxSkKcV9fRknz4SqImQDH83rN
   GkTrm1a/LkT3ZwebE2a2qiWYMPX4Pfm0AcGNfla1N35JLd01BmmPRWNUi
   d8lr6Nh8Zve+k0AdJlbnSovA1J8qc5v9gdRyzv6BOvk/nIhO0WNC/3aS6
   7YXaoUmp/tU/7aOhTTHERmlLlEA++EhJ8Zu++6fxQiFtaasPxQw47/6fu
   rl+jZq63VQq2Yl850BQd/sIgV6hSlgFqHAwuriDGT8pmbF/lRJ8zpumOr
   D+4HV2EO3/DOkMGJ0/Y4XppgGeFlp5Iu9PO6/GE6xkeGhmCg3b8lqHL+w
   Q==;
X-CSE-ConnectionGUID: iTn/HF57QFymVMNyln10bg==
X-CSE-MsgGUID: eceJVl7vSuS2z8MVD4GvMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97637464"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="97637464"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 04:43:15 -0700
X-CSE-ConnectionGUID: bIkKAc6lRG2l8umz4NGJ3g==
X-CSE-MsgGUID: xX7o/K7qTKWUwagI2bPeSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="257886322"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jul 2026 04:43:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpldu-000000000oX-3xiS;
	Fri, 31 Jul 2026 11:43:10 +0000
Date: Fri, 31 Jul 2026 19:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2/2] mm/swap.c:488: warning:
 Function parameter or member 'vma_flags' not described in
 '__lru_cache_add_inactive_or_unevictable'
Message-ID: <202607311903.nml3X2ds-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Laurent,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   1290154c48656bd1012a837076a0fbe379330eb3
commit: cbff8f39079ffd607e894aede8590d69cb6ba803 [2/2] FROMLIST: mm: introduce __lru_cache_add_active_or_unevictable
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607311903.nml3X2ds-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311903.nml3X2ds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311903.nml3X2ds-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap.c:488: warning: Function parameter or member 'vma_flags' not described in '__lru_cache_add_inactive_or_unevictable'
>> mm/swap.c:488: warning: Excess function parameter 'vma' description in '__lru_cache_add_inactive_or_unevictable'


vim +488 mm/swap.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  477  
00501b531c4723 Johannes Weiner 2014-08-08  478  /**
b518154e59aab3 Joonsoo Kim     2020-08-11  479   * lru_cache_add_inactive_or_unevictable
00501b531c4723 Johannes Weiner 2014-08-08  480   * @page:  the page to be added to LRU
00501b531c4723 Johannes Weiner 2014-08-08  481   * @vma:   vma in which page is mapped for determining reclaimability
00501b531c4723 Johannes Weiner 2014-08-08  482   *
b518154e59aab3 Joonsoo Kim     2020-08-11  483   * Place @page on the inactive or unevictable LRU list, depending on its
12eab4289d3203 Miaohe Lin      2020-10-13  484   * evictability.
00501b531c4723 Johannes Weiner 2014-08-08  485   */
cbff8f39079ffd Laurent Dufour  2018-04-17  486  void __lru_cache_add_inactive_or_unevictable(struct page *page,
cbff8f39079ffd Laurent Dufour  2018-04-17  487  					 unsigned long vma_flags)
00501b531c4723 Johannes Weiner 2014-08-08 @488  {
b518154e59aab3 Joonsoo Kim     2020-08-11  489  	bool unevictable;
b518154e59aab3 Joonsoo Kim     2020-08-11  490  
00501b531c4723 Johannes Weiner 2014-08-08  491  	VM_BUG_ON_PAGE(PageLRU(page), page);
00501b531c4723 Johannes Weiner 2014-08-08  492  
cbff8f39079ffd Laurent Dufour  2018-04-17  493  	unevictable = (vma_flags & (VM_LOCKED | VM_SPECIAL)) == VM_LOCKED;
b518154e59aab3 Joonsoo Kim     2020-08-11  494  	if (unlikely(unevictable) && !TestSetPageMlocked(page)) {
0964730bf46b4e Hugh Dickins    2020-09-18  495  		int nr_pages = thp_nr_pages(page);
00501b531c4723 Johannes Weiner 2014-08-08  496  		/*
00501b531c4723 Johannes Weiner 2014-08-08  497  		 * We use the irq-unsafe __mod_zone_page_stat because this
00501b531c4723 Johannes Weiner 2014-08-08  498  		 * counter is not modified from interrupt context, and the pte
00501b531c4723 Johannes Weiner 2014-08-08  499  		 * lock is held(spinlock), which implies preemption disabled.
00501b531c4723 Johannes Weiner 2014-08-08  500  		 */
0964730bf46b4e Hugh Dickins    2020-09-18  501  		__mod_zone_page_state(page_zone(page), NR_MLOCK, nr_pages);
0964730bf46b4e Hugh Dickins    2020-09-18  502  		count_vm_events(UNEVICTABLE_PGMLOCKED, nr_pages);
00501b531c4723 Johannes Weiner 2014-08-08  503  	}
9c4e6b1a7027f1 Shakeel Butt    2018-02-21  504  	lru_cache_add(page);
00501b531c4723 Johannes Weiner 2014-08-08  505  }
00501b531c4723 Johannes Weiner 2014-08-08  506  

:::::: The code at line 488 was first introduced by commit
:::::: 00501b531c4723972aa11d6d4ebcf8d6552007c8 mm: memcontrol: rewrite charge API

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
