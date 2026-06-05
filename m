Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4192192FA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 00:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780620120; cv=none; b=O70qA4Sy4OFADuld1hz9uvFAV7avn4UAdYjp1MnXRCaZZToQXTJn49dIkKNRm0zp84qM8EbuL5y11QyOSKxsa40pIym27Z3dXYPzI6hB/j6L/1lRZkmdu0KylOxSRZ8UozGBGxS/ZA+XSmLKgAKcgnkUCgUhIkZGMrsMEDCVviU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780620120; c=relaxed/simple;
	bh=oACoO8jeBLz2jjf7cv+NzPvF2PkXMjEq2qPw/cx3gYc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R5LeJxsAP8/XSfOgw54dw07bR96zCr58sdgkOvz8qf50Ntn9I7ckg+LUJz67zfzyHyQihevwaUlXiSlobq26McuOR6TH55PT8K+Oib+JbAclI6MI7ZwsYmrlShosdkZ3BlUyrJ5KpjY0BwcMgHxI4g7Yw3fh2KhGEtOxyOu9qIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRErGEfu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRErGEfu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780620120; x=1812156120;
  h=date:from:to:cc:subject:message-id;
  bh=oACoO8jeBLz2jjf7cv+NzPvF2PkXMjEq2qPw/cx3gYc=;
  b=lRErGEfuL5k5q8OL5RIOTQFi538DKlMskFbiq6UZaKSzZOBY+aNbZOqe
   5UrmBysee/NlBpltEWT9Qs/9lG9QeMbm/rwaG1n568XTOFrqk3X5eHPzo
   vEuyqte7QwpySreTVVLqn7Q8SqTd57lvXR9nWu12fvNHQ4VtDjAzwuYic
   +fjfs7Dh22/4+6o2dMShYxOwZz50cSTtuZk6twmuNwSAY1ReitJapx5gw
   eHzGc+SHW0tE3fj2AFPQdMvY6h1L5kMMveIb20brnGSZsI81SLb/51epr
   qSDlXUnnICM0bisaP1HJ2IK10dURDIzv+ygo5v9ekc71cKbGMYgp/jbjR
   w==;
X-CSE-ConnectionGUID: dtZm17xZRGecZux4lW10dg==
X-CSE-MsgGUID: Ccuo6Kq/RKehOoXKxaY3KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81454166"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81454166"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 17:41:59 -0700
X-CSE-ConnectionGUID: WhqkRBcUQ+WBg436M9ElKA==
X-CSE-MsgGUID: mC2LlGmWRs+lVqd9uNmUuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="243615995"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jun 2026 17:41:58 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVIdG-00000000FNI-3thH;
	Fri, 05 Jun 2026 00:41:54 +0000
Date: Fri, 05 Jun 2026 08:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:slab-trylock-v1r1-wip 2/2] mm/slub.c:6384:17: error:
 too few arguments to function '__slab_free'; expected 7, have 6
Message-ID: <202606050825.21JVkNpd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git slab-trylock-v1r1-wip
head:   43fa1e1afc2aeac6536e9d5366305ba3bde13c33
commit: 43fa1e1afc2aeac6536e9d5366305ba3bde13c33 [2/2] mm/slab: handle !allow_spin in __slab_free()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260605/202606050825.21JVkNpd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050825.21JVkNpd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050825.21JVkNpd-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'slab_free_after_rcu_debug':
>> mm/slub.c:6384:17: error: too few arguments to function '__slab_free'; expected 7, have 6
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
