Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B4A151CF4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708465364; cv=none; b=WSpmTehOAIxLX+bI3DX/V95zrU+D++17rUVhcLlhkoSn0UGplij1+qTb3Gc5bN1oxb7On23i6sWQZB28MHz/ps6TrHGXQjv053b9TejWlimW8/KIr0aq6XHL4Z+2thdS9Cr/YVhcyetf34HHpJ2is9jq0lEaRjr4GHFSTiQ+zAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708465364; c=relaxed/simple;
	bh=W2jJfN4EgGJTzsfztNQR1KquPDMXr6GOrG/8MVimYUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GyavvdKmqLSxqxVVSOkzg+jigAGS0CVV3TkD3J0Ii5O41OcYzMiGcVePj5f4SQPWjGBEwZkv4l1FdKg9fL7OT18hQ97oQ+tEX9OKRvHnV1lwOonB1hqxmkmbxvuqmxqNUiEF9vDgUOirABZhgBXJorcesDGayd5w1CWUorSzI2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FS2tcm5p; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FS2tcm5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708465362; x=1740001362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W2jJfN4EgGJTzsfztNQR1KquPDMXr6GOrG/8MVimYUo=;
  b=FS2tcm5punGSjY2dlyWMTJeuAYOfvm4HpO8XSd1OTZ/uijtjv/ofEs1p
   GCNC1vnKmNq+HhVURJKVV460U9F0Q1LWU1NJPfn6SMYZYnhnhD6UAEeAt
   /BNsZfrBZ5cLPlNRyNRDfQ0W5sTlFrOLYMMMv603E0JWgSVZxtRRg6e3I
   4jQfl4kTmlRJmkg2/nfHZYg4v9Jd908MfCySPWJSI7MmFgRYw6v9OAKpS
   zTI+qAYbvF/FSUUMMAYVs+CG2gthgxcmnjZbF+D+bnwmKB2X0FYPhjayR
   z1AjtRJAvdEb8ssqhm7VO4kRU4D2DV+PTUTAcjlKC8e8DMtz/BvLN00sm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2462102"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2462102"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 13:42:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4937787"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2024 13:42:40 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcXsr-0004qG-0K;
	Tue, 20 Feb 2024 21:42:37 +0000
Date: Wed, 21 Feb 2024 05:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Suren Baghdasaryan <surenb@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [surenbaghdasaryan:memalloc_prof_v4 28/36] mm/z3fold.c:923:25:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202402210511.ByC178AG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
head:   ce0668442c846ef25854d37e252ccbfec2a35241
commit: 0ea8081a7fd7a604cad1195c80f82b015381aa0d [28/36] mm: percpu: enable per-cpu allocation tagging
config: x86_64-randconfig-123-20240220 (https://download.01.org/0day-ci/archive/20240221/202402210511.ByC178AG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402210511.ByC178AG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402210511.ByC178AG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/z3fold.c:796:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct list_head * @@
   mm/z3fold.c:796:21: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/z3fold.c:796:21: sparse:     got struct list_head *
   mm/z3fold.c:851:37: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct list_head * @@
   mm/z3fold.c:851:37: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/z3fold.c:851:37: sparse:     got struct list_head *
>> mm/z3fold.c:923:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct list_head *unbuddied @@     got void [noderef] __percpu *_res @@
   mm/z3fold.c:923:25: sparse:     expected struct list_head *unbuddied
   mm/z3fold.c:923:25: sparse:     got void [noderef] __percpu *_res
   mm/z3fold.c:929:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct list_head * @@
   mm/z3fold.c:929:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/z3fold.c:929:33: sparse:     got struct list_head *
   mm/z3fold.c:948:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct list_head *unbuddied @@
   mm/z3fold.c:948:25: sparse:     expected void [noderef] __percpu *__pdata
   mm/z3fold.c:948:25: sparse:     got struct list_head *unbuddied
   mm/z3fold.c:978:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct list_head *unbuddied @@
   mm/z3fold.c:978:25: sparse:     expected void [noderef] __percpu *__pdata
   mm/z3fold.c:978:25: sparse:     got struct list_head *unbuddied
   mm/z3fold.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/z3fold.c:449:35: sparse: sparse: context imbalance in '__release_z3fold_page' - unexpected unlock
   mm/z3fold.c:463:9: sparse: sparse: context imbalance in 'release_z3fold_page_locked' - wrong count at exit
   mm/z3fold.c:477:9: sparse: sparse: context imbalance in 'release_z3fold_page_locked_list' - wrong count at exit
   mm/z3fold.c:547:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct list_head * @@
   mm/z3fold.c:547:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/z3fold.c:547:29: sparse:     got struct list_head *
   mm/z3fold.c:547:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct list_head * @@
   mm/z3fold.c:547:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/z3fold.c:547:29: sparse:     got struct list_head *
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/z3fold.c:678:33: sparse: sparse: context imbalance in 'compact_single_buddy' - unexpected unlock
   mm/z3fold.c:547:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct list_head * @@
   mm/z3fold.c:547:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/z3fold.c:547:29: sparse:     got struct list_head *
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/z3fold.c:744:13: sparse: sparse: context imbalance in 'do_compact_page' - different lock contexts for basic block
   mm/z3fold.c:796:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct list_head * @@
   mm/z3fold.c:796:21: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/z3fold.c:796:21: sparse:     got struct list_head *
   mm/z3fold.c:851:37: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct list_head * @@
   mm/z3fold.c:851:37: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/z3fold.c:851:37: sparse:     got struct list_head *
   mm/z3fold.c:547:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct list_head * @@
   mm/z3fold.c:547:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/z3fold.c:547:29: sparse:     got struct list_head *
   mm/z3fold.c:547:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct list_head * @@
   mm/z3fold.c:547:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/z3fold.c:547:29: sparse:     got struct list_head *
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/z3fold.c:1077:35: sparse: sparse: context imbalance in 'z3fold_alloc' - unexpected unlock
   mm/z3fold.c:276:35: sparse: sparse: context imbalance in 'z3fold_free' - unexpected unlock
   mm/z3fold.c:276:35: sparse: sparse: context imbalance in 'z3fold_map' - unexpected unlock
   mm/z3fold.c:276:35: sparse: sparse: context imbalance in 'z3fold_unmap' - unexpected unlock
   mm/z3fold.c:547:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct list_head * @@
   mm/z3fold.c:547:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/z3fold.c:547:29: sparse:     got struct list_head *
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/z3fold.c:1344:13: sparse: sparse: context imbalance in 'z3fold_page_putback' - wrong count at exit
--
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:302:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] vld_tid @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:302:22: sparse:     expected unsigned int [usertype] vld_tid
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:302:22: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:305:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] pgsz_tag_clr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:305:27: sparse:     expected unsigned int [usertype] pgsz_tag_clr
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:305:27: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:306:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] max_offset @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:306:25: sparse:     expected unsigned int [usertype] max_offset
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:306:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:307:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] page_offset @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:307:26: sparse:     expected unsigned int [usertype] page_offset
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:307:26: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:368:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cxgbi_ppm_pool *pools @@     got void [noderef] __percpu *_res @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:368:15: sparse:     expected struct cxgbi_ppm_pool *pools
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:368:15: sparse:     got void [noderef] __percpu *_res
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:374:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct cxgbi_ppm_pool * @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:374:48: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:374:48: sparse:     got struct cxgbi_ppm_pool *
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:484:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cxgbi_ppm_pool [noderef] __percpu *pool @@     got struct cxgbi_ppm_pool *[assigned] pool @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:484:19: sparse:     expected struct cxgbi_ppm_pool [noderef] __percpu *pool
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:484:19: sparse:     got struct cxgbi_ppm_pool *[assigned] pool
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:511:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct cxgbi_ppm_pool *[assigned] pool @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:511:21: sparse:     expected void [noderef] __percpu *__pdata
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:511:21: sparse:     got struct cxgbi_ppm_pool *[assigned] pool

vim +923 mm/z3fold.c

d30561c56f4114 Vitaly Wool     2017-09-06  895  
d30561c56f4114 Vitaly Wool     2017-09-06  896  /*
d30561c56f4114 Vitaly Wool     2017-09-06  897   * API Functions
d30561c56f4114 Vitaly Wool     2017-09-06  898   */
d30561c56f4114 Vitaly Wool     2017-09-06  899  
d30561c56f4114 Vitaly Wool     2017-09-06  900  /**
d30561c56f4114 Vitaly Wool     2017-09-06  901   * z3fold_create_pool() - create a new z3fold pool
d30561c56f4114 Vitaly Wool     2017-09-06  902   * @name:	pool name
d30561c56f4114 Vitaly Wool     2017-09-06  903   * @gfp:	gfp flags when allocating the z3fold pool structure
d30561c56f4114 Vitaly Wool     2017-09-06  904   *
d30561c56f4114 Vitaly Wool     2017-09-06  905   * Return: pointer to the new z3fold pool or NULL if the metadata allocation
d30561c56f4114 Vitaly Wool     2017-09-06  906   * failed.
d30561c56f4114 Vitaly Wool     2017-09-06  907   */
6a05aa30109d5c Johannes Weiner 2022-11-28  908  static struct z3fold_pool *z3fold_create_pool(const char *name, gfp_t gfp)
d30561c56f4114 Vitaly Wool     2017-09-06  909  {
d30561c56f4114 Vitaly Wool     2017-09-06  910  	struct z3fold_pool *pool = NULL;
d30561c56f4114 Vitaly Wool     2017-09-06  911  	int i, cpu;
d30561c56f4114 Vitaly Wool     2017-09-06  912  
d30561c56f4114 Vitaly Wool     2017-09-06  913  	pool = kzalloc(sizeof(struct z3fold_pool), gfp);
d30561c56f4114 Vitaly Wool     2017-09-06  914  	if (!pool)
d30561c56f4114 Vitaly Wool     2017-09-06  915  		goto out;
7c2b8baa61fe57 Vitaly Wool     2019-05-13  916  	pool->c_handle = kmem_cache_create("z3fold_handle",
7c2b8baa61fe57 Vitaly Wool     2019-05-13  917  				sizeof(struct z3fold_buddy_slots),
7c2b8baa61fe57 Vitaly Wool     2019-05-13  918  				SLOTS_ALIGN, 0, NULL);
7c2b8baa61fe57 Vitaly Wool     2019-05-13  919  	if (!pool->c_handle)
7c2b8baa61fe57 Vitaly Wool     2019-05-13  920  		goto out_c;
d30561c56f4114 Vitaly Wool     2017-09-06  921  	spin_lock_init(&pool->lock);
d30561c56f4114 Vitaly Wool     2017-09-06  922  	spin_lock_init(&pool->stale_lock);
e891f60e28c3e9 Miaohe Lin      2021-06-30 @923  	pool->unbuddied = __alloc_percpu(sizeof(struct list_head) * NCHUNKS,
e891f60e28c3e9 Miaohe Lin      2021-06-30  924  					 __alignof__(struct list_head));
1ec6995d1290bf Xidong Wang     2018-04-10  925  	if (!pool->unbuddied)
1ec6995d1290bf Xidong Wang     2018-04-10  926  		goto out_pool;
d30561c56f4114 Vitaly Wool     2017-09-06  927  	for_each_possible_cpu(cpu) {
d30561c56f4114 Vitaly Wool     2017-09-06  928  		struct list_head *unbuddied =
d30561c56f4114 Vitaly Wool     2017-09-06  929  				per_cpu_ptr(pool->unbuddied, cpu);
d30561c56f4114 Vitaly Wool     2017-09-06  930  		for_each_unbuddied_list(i, 0)
d30561c56f4114 Vitaly Wool     2017-09-06  931  			INIT_LIST_HEAD(&unbuddied[i]);
d30561c56f4114 Vitaly Wool     2017-09-06  932  	}
d30561c56f4114 Vitaly Wool     2017-09-06  933  	INIT_LIST_HEAD(&pool->stale);
d30561c56f4114 Vitaly Wool     2017-09-06  934  	atomic64_set(&pool->pages_nr, 0);
d30561c56f4114 Vitaly Wool     2017-09-06  935  	pool->name = name;
d30561c56f4114 Vitaly Wool     2017-09-06  936  	pool->compact_wq = create_singlethread_workqueue(pool->name);
d30561c56f4114 Vitaly Wool     2017-09-06  937  	if (!pool->compact_wq)
1ec6995d1290bf Xidong Wang     2018-04-10  938  		goto out_unbuddied;
d30561c56f4114 Vitaly Wool     2017-09-06  939  	pool->release_wq = create_singlethread_workqueue(pool->name);
d30561c56f4114 Vitaly Wool     2017-09-06  940  	if (!pool->release_wq)
d30561c56f4114 Vitaly Wool     2017-09-06  941  		goto out_wq;
d30561c56f4114 Vitaly Wool     2017-09-06  942  	INIT_WORK(&pool->work, free_pages_work);
d30561c56f4114 Vitaly Wool     2017-09-06  943  	return pool;
d30561c56f4114 Vitaly Wool     2017-09-06  944  
d30561c56f4114 Vitaly Wool     2017-09-06  945  out_wq:
d30561c56f4114 Vitaly Wool     2017-09-06  946  	destroy_workqueue(pool->compact_wq);
1ec6995d1290bf Xidong Wang     2018-04-10  947  out_unbuddied:
1ec6995d1290bf Xidong Wang     2018-04-10  948  	free_percpu(pool->unbuddied);
1ec6995d1290bf Xidong Wang     2018-04-10  949  out_pool:
7c2b8baa61fe57 Vitaly Wool     2019-05-13  950  	kmem_cache_destroy(pool->c_handle);
7c2b8baa61fe57 Vitaly Wool     2019-05-13  951  out_c:
d30561c56f4114 Vitaly Wool     2017-09-06  952  	kfree(pool);
1ec6995d1290bf Xidong Wang     2018-04-10  953  out:
d30561c56f4114 Vitaly Wool     2017-09-06  954  	return NULL;
d30561c56f4114 Vitaly Wool     2017-09-06  955  }
d30561c56f4114 Vitaly Wool     2017-09-06  956  

:::::: The code at line 923 was first introduced by commit
:::::: e891f60e28c3e90e2589a7d2147ae192dca11245 mm/z3fold: remove magic number in z3fold_create_pool()

:::::: TO: Miaohe Lin <linmiaohe@huawei.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
