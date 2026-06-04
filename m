Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A1039EF3D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780601106; cv=none; b=QFtqC5214Elh9zA3eMVwOxU3HAZ+6UF4qSAMiCFPSQ+gJIU79WCrhmRFN5aqW3JffgREGGgH0Vlwsu1UkUApb4rdXowPIIDIg9nQVOmEwrehQzOkI7GBX/fTyIOxuznizc1YsWMsnsK9fr315nZjb7/zM/Qub1bLT22D/+8eQ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780601106; c=relaxed/simple;
	bh=7nb4B6vYyXl0L2teTazw//mTzO1pgotGyc7IndvXP1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e1vyPN9zkgu9TURIJNzaNwntFIz64pzj14SMIjjL3eXKrmVc80M9/hZ1SVf3bJ51rm4eSyoTiMd4zK8IXvNV4nXyis6+EWchSx3HMXY4IoFYqybUvurO3+YP+M7hXHnkn3MwpcVdczeqtbCoLjy+rD97ZR2NFerFlpDS7MAk6l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJ+KRfKa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJ+KRfKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780601104; x=1812137104;
  h=date:from:to:cc:subject:message-id;
  bh=7nb4B6vYyXl0L2teTazw//mTzO1pgotGyc7IndvXP1I=;
  b=iJ+KRfKaUfc1dY00ir0r9l9gYtDADKl6Oko3sNZ3/vDV1fd6nwlwfX27
   myDy+/uSgmtDvIIufnPJsMHI159CQ+WpU07Y4wTTkBVGVTv0qNd4+GEa0
   ZRf0HUairo3xWH6yIefoIeWn8lKBM6QJxPR0yn7FLxfyZyLAcurxyNiSD
   KQHJjZoS8puQzftrkpnLwm9BeevcM9SkRetinyRIyZA+5qICYXVeb3W2k
   hLn97b5lbIrNh/IeXsDjn9PZKwqPbCuyE0dpFhUGkl2/ee4YErv9JeInM
   W5fj94h7STql+HjonCrUBQXRuCn5AmUHnKTTiisynfgtQOqzh8rXu2MOQ
   g==;
X-CSE-ConnectionGUID: 2CU1DGYdRdOc3GV3Z/YQ5Q==
X-CSE-MsgGUID: HfMEnYBmTlWdyd8gKSqe5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92919035"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="92919035"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 12:25:04 -0700
X-CSE-ConnectionGUID: IE1U2MXwTM2p1dibqNwEig==
X-CSE-MsgGUID: Jeg8Kt0qTXSsfjFZQ/vDWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="274883391"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Jun 2026 12:25:03 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVDga-000000002NV-37Pn;
	Thu, 04 Jun 2026 19:25:00 +0000
Date: Thu, 04 Jun 2026 21:24:28 +0200
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:slab-trylock-v1r1-wip 2/2] mm/slub.c:6384:17: error:
 too few arguments to function '__slab_free'
Message-ID: <202606042149.MdN0PCUH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git slab-trylock-v1r1-wip
head:   43fa1e1afc2aeac6536e9d5366305ba3bde13c33
commit: 43fa1e1afc2aeac6536e9d5366305ba3bde13c33 [2/2] mm/slab: handle !allow_spin in __slab_free()
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20260604/202606042149.MdN0PCUH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606042149.MdN0PCUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606042149.MdN0PCUH-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'slab_free_after_rcu_debug':
>> mm/slub.c:6384:17: error: too few arguments to function '__slab_free'
    6384 |                 __slab_free(s, slab, object, object, 1, _THIS_IP_);
         |                 ^~~~~~~~~~~
   mm/slub.c:5563:13: note: declared here
    5563 | static bool __slab_free(struct kmem_cache *s, struct slab *slab,
         |             ^~~~~~~~~~~


vim +/__slab_free +6384 mm/slub.c

80a9201a5965f4 Alexander Potapenko 2016-07-28  6360  
b8c8ba73c68bb3 Jann Horn           2024-08-09  6361  #ifdef CONFIG_SLUB_RCU_DEBUG
b8c8ba73c68bb3 Jann Horn           2024-08-09  6362  static void slab_free_after_rcu_debug(struct rcu_head *rcu_head)
b8c8ba73c68bb3 Jann Horn           2024-08-09  6363  {
b8c8ba73c68bb3 Jann Horn           2024-08-09  6364  	struct rcu_delayed_free *delayed_free =
b8c8ba73c68bb3 Jann Horn           2024-08-09  6365  			container_of(rcu_head, struct rcu_delayed_free, head);
b8c8ba73c68bb3 Jann Horn           2024-08-09  6366  	void *object = delayed_free->object;
b8c8ba73c68bb3 Jann Horn           2024-08-09  6367  	struct slab *slab = virt_to_slab(object);
b8c8ba73c68bb3 Jann Horn           2024-08-09  6368  	struct kmem_cache *s;
b8c8ba73c68bb3 Jann Horn           2024-08-09  6369  
b8c8ba73c68bb3 Jann Horn           2024-08-09  6370  	kfree(delayed_free);
b8c8ba73c68bb3 Jann Horn           2024-08-09  6371  
b8c8ba73c68bb3 Jann Horn           2024-08-09  6372  	if (WARN_ON(is_kfence_address(object)))
b8c8ba73c68bb3 Jann Horn           2024-08-09  6373  		return;
b8c8ba73c68bb3 Jann Horn           2024-08-09  6374  
b8c8ba73c68bb3 Jann Horn           2024-08-09  6375  	/* find the object and the cache again */
b8c8ba73c68bb3 Jann Horn           2024-08-09  6376  	if (WARN_ON(!slab))
b8c8ba73c68bb3 Jann Horn           2024-08-09  6377  		return;
b8c8ba73c68bb3 Jann Horn           2024-08-09  6378  	s = slab->slab_cache;
b8c8ba73c68bb3 Jann Horn           2024-08-09  6379  	if (WARN_ON(!(s->flags & SLAB_TYPESAFE_BY_RCU)))
b8c8ba73c68bb3 Jann Horn           2024-08-09  6380  		return;
b8c8ba73c68bb3 Jann Horn           2024-08-09  6381  
b8c8ba73c68bb3 Jann Horn           2024-08-09  6382  	/* resume freeing */
6f1912181ddfcf Vlastimil Babka     2026-01-23  6383  	if (slab_free_hook(s, object, slab_want_init_on_free(s), true)) {
bdc9282f780967 Vlastimil Babka     2026-01-23 @6384  		__slab_free(s, slab, object, object, 1, _THIS_IP_);
6f1912181ddfcf Vlastimil Babka     2026-01-23  6385  		stat(s, FREE_SLOWPATH);
6f1912181ddfcf Vlastimil Babka     2026-01-23  6386  	}
b8c8ba73c68bb3 Jann Horn           2024-08-09  6387  }
b8c8ba73c68bb3 Jann Horn           2024-08-09  6388  #endif /* CONFIG_SLUB_RCU_DEBUG */
b8c8ba73c68bb3 Jann Horn           2024-08-09  6389  

:::::: The code at line 6384 was first introduced by commit
:::::: bdc9282f7809678db34e3d7e094b267a6bdd9dac slab: remove the do_slab_free() fastpath

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
