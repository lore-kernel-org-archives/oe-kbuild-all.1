Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C9433E7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 00:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777766932; cv=none; b=h1NzH+5Hf2/Tbljo5q3Q/H5Ap/j3kUhHe0ooGaNyETjeB1uwxgkf0KChKf04BhTjN53BEaRvquisvCM1Li9GNqeqj1097k5E3Ro1RLlVvKte1dHtKEviPNxRapWgtCgw3ZV4sGvVjU+tY+THKf8H9lZStekvcn0RNUNgnp1/n1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777766932; c=relaxed/simple;
	bh=+Iq2/bzQynfKEUMLAPUeUgFaVjpsthhVRmak+frMaT8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mWGtWSvjB9tXyUBt54RbyrtErOCsnHOeuRZ62HPxS5wL0MBfQP72XIjIgyiiqiOla2ryEquRtRN9H0wEtj7u/AYA7dC+0fe89P6cyfmixk+8+ZivTZ7I1ySAJpzpiHDwCpiJeXDGdJxaR+q7IZhUCBoIqRdHHWQi0HxGdH1pGcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0TUvj0s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0TUvj0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777766931; x=1809302931;
  h=date:from:to:cc:subject:message-id;
  bh=+Iq2/bzQynfKEUMLAPUeUgFaVjpsthhVRmak+frMaT8=;
  b=P0TUvj0sUiOJdzX+1SfmbKWXbPihdz+/pmuZOLZ9fuk3uZ3gP++NT4ZY
   nRPWXdR9lssiPGlFa8E64BwQ3vK7FeGw24BmRHiOvwScAd6RGoRdIvKxb
   UDQPnd8GEenunQhPOiTXK9NkYNSmuBbbG5fZGoQDyEp9nmE67gbhqTTIM
   4Kk48uShAGkOYaN6hlfHLt1Imqu4YABBp0tIECSSzrfriL57wYR1EPTsS
   yvZJtj2YT5/QExSN/IIYC2wqx/XaMuBJifbUIjThOiW5ux8+gbfwLtZ9z
   UCmwOjY8qzleMzlFkbqjBn3nbsr7B36T9Bm8Sp0VWxynvbowH2pI2/L3n
   w==;
X-CSE-ConnectionGUID: LxPnchuwTYGgqTppAWGp0g==
X-CSE-MsgGUID: nkUwrdz4R3evtfnMqtr/ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77842283"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="77842283"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 17:08:48 -0700
X-CSE-ConnectionGUID: J8mpHyIaQAqs9Xux+DbqCw==
X-CSE-MsgGUID: 5R031VWfQrG7Zd4uDMCDPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="273281127"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2026 17:08:47 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJKO4-000000001vh-1tsV;
	Sun, 03 May 2026 00:08:44 +0000
Date: Sun, 03 May 2026 08:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:slab-allow-runtime-parameter-tuning-rfc-v1r1-wip 5/5]
 mm/slub.c:5985:17: error: label 'flush' used but not defined
Message-ID: <202605030745.OSnL0xWj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git slab-allow-runtime-parameter-tuning-rfc-v1r1-wip
head:   cb8be1e8cd9f6033638b579596456da407e4fb5c
commit: cb8be1e8cd9f6033638b579596456da407e4fb5c [5/5] mm/slab: allow changing sheaf_capacity at runtime
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605030745.OSnL0xWj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030745.OSnL0xWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030745.OSnL0xWj-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'rcu_free_sheaf':
>> mm/slub.c:5985:17: error: label 'flush' used but not defined
    5985 |                 goto flush;
         |                 ^~~~
   mm/slub.c: In function 'bootstrap_cache_sheaves':
>> mm/slub.c:8575:38: error: 'struct kmem_cache_node' has no member named 'barn'
    8575 |                 if (get_node(s, node)->barn)
         |                                      ^~


vim +/flush +5985 mm/slub.c

2d517aa09bbc42 Vlastimil Babka        2025-09-03  5958  
ec66e0d599520a Vlastimil Babka        2025-09-03  5959  static void rcu_free_sheaf(struct rcu_head *head)
ec66e0d599520a Vlastimil Babka        2025-09-03  5960  {
ec66e0d599520a Vlastimil Babka        2025-09-03  5961  	struct slab_sheaf *sheaf;
fd6db58867924d Vlastimil Babka        2025-10-11  5962  	struct node_barn *barn = NULL;
ec66e0d599520a Vlastimil Babka        2025-09-03  5963  	struct kmem_cache *s;
ec66e0d599520a Vlastimil Babka        2025-09-03  5964  
ec66e0d599520a Vlastimil Babka        2025-09-03  5965  	sheaf = container_of(head, struct slab_sheaf, rcu_head);
ec66e0d599520a Vlastimil Babka        2025-09-03  5966  
ec66e0d599520a Vlastimil Babka        2025-09-03  5967  	s = sheaf->cache;
ec66e0d599520a Vlastimil Babka        2025-09-03  5968  
ec66e0d599520a Vlastimil Babka        2025-09-03  5969  	/*
ec66e0d599520a Vlastimil Babka        2025-09-03  5970  	 * This may remove some objects due to slab_free_hook() returning false,
ec66e0d599520a Vlastimil Babka        2025-09-03  5971  	 * so that the sheaf might no longer be completely full. But it's easier
ec66e0d599520a Vlastimil Babka        2025-09-03  5972  	 * to handle it as full (unless it became completely empty), as the code
ec66e0d599520a Vlastimil Babka        2025-09-03  5973  	 * handles it fine. The only downside is that sheaf will serve fewer
ec66e0d599520a Vlastimil Babka        2025-09-03  5974  	 * allocations when reused. It only happens due to debugging, which is a
ec66e0d599520a Vlastimil Babka        2025-09-03  5975  	 * performance hit anyway.
1ce20c28eafdc1 Vlastimil Babka        2025-11-05  5976  	 *
1ce20c28eafdc1 Vlastimil Babka        2025-11-05  5977  	 * If it returns true, there was at least one object from pfmemalloc
1ce20c28eafdc1 Vlastimil Babka        2025-11-05  5978  	 * slab so simply flush everything.
ec66e0d599520a Vlastimil Babka        2025-09-03  5979  	 */
1ce20c28eafdc1 Vlastimil Babka        2025-11-05  5980  	if (__rcu_free_sheaf_prepare(s, sheaf))
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  5981) 		goto flush_unlocked;
ec66e0d599520a Vlastimil Babka        2025-09-03  5982  
5ba6bc27b1f99b Vlastimil Babka (SUSE  2026-03-11  5983) 	barn = get_barn_node(s, sheaf->node);
5ba6bc27b1f99b Vlastimil Babka (SUSE  2026-03-11  5984) 	if (!barn)
fd6db58867924d Vlastimil Babka        2025-10-11 @5985  		goto flush;
fd6db58867924d Vlastimil Babka        2025-10-11  5986  
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  5987) 	if (!local_trylock(&s->cpu_sheaves->lock))
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  5988) 		goto flush_unlocked;
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  5989) 
ec66e0d599520a Vlastimil Babka        2025-09-03  5990  	/* due to slab_free_hook() */
ec66e0d599520a Vlastimil Babka        2025-09-03  5991  	if (unlikely(sheaf->size == 0))
ec66e0d599520a Vlastimil Babka        2025-09-03  5992  		goto empty;
ec66e0d599520a Vlastimil Babka        2025-09-03  5993  
ec66e0d599520a Vlastimil Babka        2025-09-03  5994  	/*
ec66e0d599520a Vlastimil Babka        2025-09-03  5995  	 * Checking nr_full/nr_empty outside lock avoids contention in case the
ec66e0d599520a Vlastimil Babka        2025-09-03  5996  	 * barn is at the respective limit. Due to the race we might go over the
ec66e0d599520a Vlastimil Babka        2025-09-03  5997  	 * limit but that should be rare and harmless.
ec66e0d599520a Vlastimil Babka        2025-09-03  5998  	 */
ec66e0d599520a Vlastimil Babka        2025-09-03  5999  
ec66e0d599520a Vlastimil Babka        2025-09-03  6000  	if (data_race(barn->nr_full) < MAX_FULL_SHEAVES) {
ec66e0d599520a Vlastimil Babka        2025-09-03  6001  		stat(s, BARN_PUT);
ec66e0d599520a Vlastimil Babka        2025-09-03  6002  		barn_put_full_sheaf(barn, sheaf);
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  6003) 		local_unlock(&s->cpu_sheaves->lock);
ec66e0d599520a Vlastimil Babka        2025-09-03  6004  		return;
ec66e0d599520a Vlastimil Babka        2025-09-03  6005  	}
ec66e0d599520a Vlastimil Babka        2025-09-03  6006  
ec66e0d599520a Vlastimil Babka        2025-09-03  6007  	stat(s, BARN_PUT_FAIL);
ec66e0d599520a Vlastimil Babka        2025-09-03  6008  	sheaf_flush_unused(s, sheaf);
ec66e0d599520a Vlastimil Babka        2025-09-03  6009  
ec66e0d599520a Vlastimil Babka        2025-09-03  6010  empty:
fd6db58867924d Vlastimil Babka        2025-10-11  6011  	if (barn && data_race(barn->nr_empty) < MAX_EMPTY_SHEAVES) {
ec66e0d599520a Vlastimil Babka        2025-09-03  6012  		barn_put_empty_sheaf(barn, sheaf);
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  6013) 		local_unlock(&s->cpu_sheaves->lock);
ec66e0d599520a Vlastimil Babka        2025-09-03  6014  		return;
ec66e0d599520a Vlastimil Babka        2025-09-03  6015  	}
ec66e0d599520a Vlastimil Babka        2025-09-03  6016  
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  6017) 	local_unlock(&s->cpu_sheaves->lock);
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  6018) 	free_empty_sheaf(s, sheaf);
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  6019) 	return;
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  6020) 
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  6021) flush_unlocked:
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  6022) 	stat(s, BARN_PUT_FAIL);
cb8be1e8cd9f60 Harry Yoo (Oracle      2026-04-21  6023) 	sheaf_flush_unused(s, sheaf);
ec66e0d599520a Vlastimil Babka        2025-09-03  6024  	free_empty_sheaf(s, sheaf);
ec66e0d599520a Vlastimil Babka        2025-09-03  6025  }
ec66e0d599520a Vlastimil Babka        2025-09-03  6026  

:::::: The code at line 5985 was first introduced by commit
:::::: fd6db58867924d2bfbc4ece4b0092f697f9fc31c slab: fix barn NULL pointer dereference on memoryless nodes

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
