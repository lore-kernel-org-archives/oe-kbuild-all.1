Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B543E1DDCE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 17:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711907921; cv=none; b=TfO8fOdMltA8HrMY8T6iKTb1RyWhr4iQAdoWNWAAmbu9iaJibC6ADET5fwjX/f5+pG7rKavw5tqYx18GamGamN5RWA9RcFCoAFod03KG8qjYs3JkkLztCShX4ZM1D1bdsHzw0gtroqolSCk6Qj8UJ9thd/MFQrpiH8pgu/nYEvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711907921; c=relaxed/simple;
	bh=AwZ3YhLLOZV+6STbGEMHEH6lxJmpFgBerV+j/h9lfXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aRrnAmtI+HRcDp+hfU26KTuhNzknnvkeScWZoHoT9CEG3H++LpyYm3G28oWWvWfnqcemH2a9accrSW3Yj+jxlwc3n/2y0k95NTOPdCsHdXTMyXoarzCz6EnMga/Ai2/IpA+TfBdGArA7GnkvWy/7Ujt66xt1gmRBQatTks1TTY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWgkfEde; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWgkfEde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711907918; x=1743443918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AwZ3YhLLOZV+6STbGEMHEH6lxJmpFgBerV+j/h9lfXw=;
  b=EWgkfEdeFessGv49TK2fvq6uKF9DGCpxm46UrpZvDn4QTb0SK2ROgwnr
   LKgm2Ig8rrBym2wrX9zVVzVL4Ydbr6ONvTG9NwzSiuF++TKE5mefq9f7M
   1YUMFGpgWOGtDZuHbm2gkoIUkO5oRQVRPKwvJVml87JNSfKXL4WDtpXBO
   9lpofsWU67PvA9HE8XCI/RQ7vbzMG/i9QUbX0EeKwqOepaFt1ND4UIHeo
   nVi0kyEYFHQcLJKQAlleZLFoprwGK7MmLBpkjoeGkr9BOOjg0rNPWeRXG
   eMG75ypk0O6rYetKQ8Wks4C4VN/shaiGiOCWo1y1AoOtZZtxrk25vv08t
   w==;
X-CSE-ConnectionGUID: 291OozCUSi6C/SKMaQP0jw==
X-CSE-MsgGUID: WzqNm2VTSHGsLs581d2Jgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="24493714"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="24493714"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 10:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="22187750"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Mar 2024 10:58:36 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqzRw-0001Jm-29;
	Sun, 31 Mar 2024 17:58:32 +0000
Date: Mon, 1 Apr 2024 01:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [linux-next:master 2060/2532] mm/mempool.c:271: warning: Function
 parameter or struct member 'gfp_mask' not described in 'mempool_create_node'
Message-ID: <202404010132.6v0zt6oa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: 78fc586c9b009dd81a8137ff9694bbda81e23d32 [2060/2532] mempool: hook up to memory allocation profiling
config: x86_64-randconfig-r071-20240327 (https://download.01.org/0day-ci/archive/20240401/202404010132.6v0zt6oa-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404010132.6v0zt6oa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010132.6v0zt6oa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mempool.c:271: warning: Function parameter or struct member 'gfp_mask' not described in 'mempool_create_node'
>> mm/mempool.c:271: warning: Function parameter or struct member 'node_id' not described in 'mempool_create_node'
>> mm/mempool.c:383: warning: expecting prototype for mempool_alloc_noprof(). Prototype was for mempool_alloc() instead


vim +271 mm/mempool.c

c1a67fefd0546a Kent Overstreet   2015-05-04  251  
^1da177e4c3f41 Linus Torvalds    2005-04-16  252  /**
78fc586c9b009d Kent Overstreet   2024-03-21  253   * mempool_create_node - create a memory pool
^1da177e4c3f41 Linus Torvalds    2005-04-16  254   * @min_nr:    the minimum number of elements guaranteed to be
^1da177e4c3f41 Linus Torvalds    2005-04-16  255   *             allocated for this pool.
^1da177e4c3f41 Linus Torvalds    2005-04-16  256   * @alloc_fn:  user-defined element-allocation function.
^1da177e4c3f41 Linus Torvalds    2005-04-16  257   * @free_fn:   user-defined element-freeing function.
^1da177e4c3f41 Linus Torvalds    2005-04-16  258   * @pool_data: optional private data available to the user-defined functions.
^1da177e4c3f41 Linus Torvalds    2005-04-16  259   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  260   * this function creates and allocates a guaranteed size, preallocated
72fd4a35a82433 Robert P. J. Day  2007-02-10  261   * memory pool. The pool can be used from the mempool_alloc() and mempool_free()
^1da177e4c3f41 Linus Torvalds    2005-04-16  262   * functions. This function might sleep. Both the alloc_fn() and the free_fn()
72fd4a35a82433 Robert P. J. Day  2007-02-10  263   * functions might sleep - as long as the mempool_alloc() function is not called
^1da177e4c3f41 Linus Torvalds    2005-04-16  264   * from IRQ contexts.
a862f68a8b3600 Mike Rapoport     2019-03-05  265   *
a862f68a8b3600 Mike Rapoport     2019-03-05  266   * Return: pointer to the created memory pool object or %NULL on error.
^1da177e4c3f41 Linus Torvalds    2005-04-16  267   */
78fc586c9b009d Kent Overstreet   2024-03-21  268  mempool_t *mempool_create_node_noprof(int min_nr, mempool_alloc_t *alloc_fn,
a91a5ac6858fbf Tejun Heo         2012-06-04  269  				      mempool_free_t *free_fn, void *pool_data,
a91a5ac6858fbf Tejun Heo         2012-06-04  270  				      gfp_t gfp_mask, int node_id)
1946089a109251 Christoph Lameter 2005-06-23 @271  {
1946089a109251 Christoph Lameter 2005-06-23  272  	mempool_t *pool;
c1a67fefd0546a Kent Overstreet   2015-05-04  273  
7b5219db00d0af Joe Perches       2013-09-11  274  	pool = kzalloc_node(sizeof(*pool), gfp_mask, node_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  275  	if (!pool)
^1da177e4c3f41 Linus Torvalds    2005-04-16  276  		return NULL;
c1a67fefd0546a Kent Overstreet   2015-05-04  277  
c1a67fefd0546a Kent Overstreet   2015-05-04  278  	if (mempool_init_node(pool, min_nr, alloc_fn, free_fn, pool_data,
c1a67fefd0546a Kent Overstreet   2015-05-04  279  			      gfp_mask, node_id)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  280  		kfree(pool);
^1da177e4c3f41 Linus Torvalds    2005-04-16  281  		return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  282  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  283  
^1da177e4c3f41 Linus Torvalds    2005-04-16  284  	return pool;
^1da177e4c3f41 Linus Torvalds    2005-04-16  285  }
78fc586c9b009d Kent Overstreet   2024-03-21  286  EXPORT_SYMBOL(mempool_create_node_noprof);
^1da177e4c3f41 Linus Torvalds    2005-04-16  287  
^1da177e4c3f41 Linus Torvalds    2005-04-16  288  /**
^1da177e4c3f41 Linus Torvalds    2005-04-16  289   * mempool_resize - resize an existing memory pool
^1da177e4c3f41 Linus Torvalds    2005-04-16  290   * @pool:       pointer to the memory pool which was allocated via
^1da177e4c3f41 Linus Torvalds    2005-04-16  291   *              mempool_create().
^1da177e4c3f41 Linus Torvalds    2005-04-16  292   * @new_min_nr: the new minimum number of elements guaranteed to be
^1da177e4c3f41 Linus Torvalds    2005-04-16  293   *              allocated for this pool.
^1da177e4c3f41 Linus Torvalds    2005-04-16  294   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  295   * This function shrinks/grows the pool. In the case of growing,
^1da177e4c3f41 Linus Torvalds    2005-04-16  296   * it cannot be guaranteed that the pool will be grown to the new
^1da177e4c3f41 Linus Torvalds    2005-04-16  297   * size immediately, but new mempool_free() calls will refill it.
11d83360452ea2 David Rientjes    2015-04-14  298   * This function may sleep.
^1da177e4c3f41 Linus Torvalds    2005-04-16  299   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  300   * Note, the caller must guarantee that no mempool_destroy is called
^1da177e4c3f41 Linus Torvalds    2005-04-16  301   * while this function is running. mempool_alloc() & mempool_free()
^1da177e4c3f41 Linus Torvalds    2005-04-16  302   * might be called (eg. from IRQ contexts) while this function executes.
a862f68a8b3600 Mike Rapoport     2019-03-05  303   *
a862f68a8b3600 Mike Rapoport     2019-03-05  304   * Return: %0 on success, negative error code otherwise.
^1da177e4c3f41 Linus Torvalds    2005-04-16  305   */
11d83360452ea2 David Rientjes    2015-04-14  306  int mempool_resize(mempool_t *pool, int new_min_nr)
^1da177e4c3f41 Linus Torvalds    2005-04-16  307  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  308  	void *element;
^1da177e4c3f41 Linus Torvalds    2005-04-16  309  	void **new_elements;
^1da177e4c3f41 Linus Torvalds    2005-04-16  310  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds    2005-04-16  311  
^1da177e4c3f41 Linus Torvalds    2005-04-16  312  	BUG_ON(new_min_nr <= 0);
11d83360452ea2 David Rientjes    2015-04-14  313  	might_sleep();
^1da177e4c3f41 Linus Torvalds    2005-04-16  314  
^1da177e4c3f41 Linus Torvalds    2005-04-16  315  	spin_lock_irqsave(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  316  	if (new_min_nr <= pool->min_nr) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  317  		while (new_min_nr < pool->curr_nr) {
8cded8668e1f49 Jia-Ju Bai        2018-08-17  318  			element = remove_element(pool);
^1da177e4c3f41 Linus Torvalds    2005-04-16  319  			spin_unlock_irqrestore(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  320  			pool->free(element, pool->pool_data);
^1da177e4c3f41 Linus Torvalds    2005-04-16  321  			spin_lock_irqsave(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  322  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  323  		pool->min_nr = new_min_nr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  324  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  325  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  326  	spin_unlock_irqrestore(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  327  
^1da177e4c3f41 Linus Torvalds    2005-04-16  328  	/* Grow the pool */
11d83360452ea2 David Rientjes    2015-04-14  329  	new_elements = kmalloc_array(new_min_nr, sizeof(*new_elements),
11d83360452ea2 David Rientjes    2015-04-14  330  				     GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  331  	if (!new_elements)
^1da177e4c3f41 Linus Torvalds    2005-04-16  332  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  333  
^1da177e4c3f41 Linus Torvalds    2005-04-16  334  	spin_lock_irqsave(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  335  	if (unlikely(new_min_nr <= pool->min_nr)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  336  		/* Raced, other resize will do our work */
^1da177e4c3f41 Linus Torvalds    2005-04-16  337  		spin_unlock_irqrestore(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  338  		kfree(new_elements);
^1da177e4c3f41 Linus Torvalds    2005-04-16  339  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  340  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  341  	memcpy(new_elements, pool->elements,
^1da177e4c3f41 Linus Torvalds    2005-04-16  342  			pool->curr_nr * sizeof(*new_elements));
^1da177e4c3f41 Linus Torvalds    2005-04-16  343  	kfree(pool->elements);
^1da177e4c3f41 Linus Torvalds    2005-04-16  344  	pool->elements = new_elements;
^1da177e4c3f41 Linus Torvalds    2005-04-16  345  	pool->min_nr = new_min_nr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  346  
^1da177e4c3f41 Linus Torvalds    2005-04-16  347  	while (pool->curr_nr < pool->min_nr) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  348  		spin_unlock_irqrestore(&pool->lock, flags);
11d83360452ea2 David Rientjes    2015-04-14  349  		element = pool->alloc(GFP_KERNEL, pool->pool_data);
^1da177e4c3f41 Linus Torvalds    2005-04-16  350  		if (!element)
^1da177e4c3f41 Linus Torvalds    2005-04-16  351  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  352  		spin_lock_irqsave(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  353  		if (pool->curr_nr < pool->min_nr) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  354  			add_element(pool, element);
^1da177e4c3f41 Linus Torvalds    2005-04-16  355  		} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  356  			spin_unlock_irqrestore(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  357  			pool->free(element, pool->pool_data);	/* Raced */
^1da177e4c3f41 Linus Torvalds    2005-04-16  358  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  359  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  360  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  361  out_unlock:
^1da177e4c3f41 Linus Torvalds    2005-04-16  362  	spin_unlock_irqrestore(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  363  out:
^1da177e4c3f41 Linus Torvalds    2005-04-16  364  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  365  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  366  EXPORT_SYMBOL(mempool_resize);
^1da177e4c3f41 Linus Torvalds    2005-04-16  367  
^1da177e4c3f41 Linus Torvalds    2005-04-16  368  /**
78fc586c9b009d Kent Overstreet   2024-03-21  369   * mempool_alloc_noprof - allocate an element from a specific memory pool
^1da177e4c3f41 Linus Torvalds    2005-04-16  370   * @pool:      pointer to the memory pool which was allocated via
^1da177e4c3f41 Linus Torvalds    2005-04-16  371   *             mempool_create().
^1da177e4c3f41 Linus Torvalds    2005-04-16  372   * @gfp_mask:  the usual allocation bitmask.
^1da177e4c3f41 Linus Torvalds    2005-04-16  373   *
72fd4a35a82433 Robert P. J. Day  2007-02-10  374   * this function only sleeps if the alloc_fn() function sleeps or
^1da177e4c3f41 Linus Torvalds    2005-04-16  375   * returns NULL. Note that due to preallocation, this function
^1da177e4c3f41 Linus Torvalds    2005-04-16  376   * *never* fails when called from process contexts. (it might
^1da177e4c3f41 Linus Torvalds    2005-04-16  377   * fail if called from an IRQ context.)
4e390b2b2f34b8 Michal Hocko      2016-07-28  378   * Note: using __GFP_ZERO is not supported.
a862f68a8b3600 Mike Rapoport     2019-03-05  379   *
a862f68a8b3600 Mike Rapoport     2019-03-05  380   * Return: pointer to the allocated element or %NULL on error.
^1da177e4c3f41 Linus Torvalds    2005-04-16  381   */
78fc586c9b009d Kent Overstreet   2024-03-21  382  void *mempool_alloc_noprof(mempool_t *pool, gfp_t gfp_mask)
^1da177e4c3f41 Linus Torvalds    2005-04-16 @383  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  384  	void *element;
^1da177e4c3f41 Linus Torvalds    2005-04-16  385  	unsigned long flags;
ac6424b981bce1 Ingo Molnar       2017-06-20  386  	wait_queue_entry_t wait;
6daa0e28627abf Al Viro           2005-10-21  387  	gfp_t gfp_temp;
20a77776c24800 Nicholas Piggin   2005-05-01  388  
8bf8fcb07653fb Sebastian Ott     2014-06-04  389  	VM_WARN_ON_ONCE(gfp_mask & __GFP_ZERO);
21bfe8db0a4223 Daniel Vetter     2022-06-05  390  	might_alloc(gfp_mask);
b84a35be028522 Nicholas Piggin   2005-05-01  391  
4e390b2b2f34b8 Michal Hocko      2016-07-28  392  	gfp_mask |= __GFP_NOMEMALLOC;	/* don't allocate emergency reserves */
b84a35be028522 Nicholas Piggin   2005-05-01  393  	gfp_mask |= __GFP_NORETRY;	/* don't loop in __alloc_pages */
b84a35be028522 Nicholas Piggin   2005-05-01  394  	gfp_mask |= __GFP_NOWARN;	/* failures are OK */
^1da177e4c3f41 Linus Torvalds    2005-04-16  395  
d0164adc89f6bb Mel Gorman        2015-11-06  396  	gfp_temp = gfp_mask & ~(__GFP_DIRECT_RECLAIM|__GFP_IO);
20a77776c24800 Nicholas Piggin   2005-05-01  397  
^1da177e4c3f41 Linus Torvalds    2005-04-16  398  repeat_alloc:
^1da177e4c3f41 Linus Torvalds    2005-04-16  399  
20a77776c24800 Nicholas Piggin   2005-05-01  400  	element = pool->alloc(gfp_temp, pool->pool_data);
^1da177e4c3f41 Linus Torvalds    2005-04-16  401  	if (likely(element != NULL))
^1da177e4c3f41 Linus Torvalds    2005-04-16  402  		return element;
^1da177e4c3f41 Linus Torvalds    2005-04-16  403  
^1da177e4c3f41 Linus Torvalds    2005-04-16  404  	spin_lock_irqsave(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  405  	if (likely(pool->curr_nr)) {
8cded8668e1f49 Jia-Ju Bai        2018-08-17  406  		element = remove_element(pool);
^1da177e4c3f41 Linus Torvalds    2005-04-16  407  		spin_unlock_irqrestore(&pool->lock, flags);
5b990546e33477 Tejun Heo         2012-01-10  408  		/* paired with rmb in mempool_free(), read comment there */
5b990546e33477 Tejun Heo         2012-01-10  409  		smp_wmb();
174119628188b0 Catalin Marinas   2014-06-06  410  		/*
174119628188b0 Catalin Marinas   2014-06-06  411  		 * Update the allocation stack trace as this is more useful
174119628188b0 Catalin Marinas   2014-06-06  412  		 * for debugging.
174119628188b0 Catalin Marinas   2014-06-06  413  		 */
174119628188b0 Catalin Marinas   2014-06-06  414  		kmemleak_update_trace(element);
^1da177e4c3f41 Linus Torvalds    2005-04-16  415  		return element;
^1da177e4c3f41 Linus Torvalds    2005-04-16  416  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  417  
1ebb7044c9142c Tejun Heo         2012-01-10  418  	/*
d0164adc89f6bb Mel Gorman        2015-11-06  419  	 * We use gfp mask w/o direct reclaim or IO for the first round.  If
1ebb7044c9142c Tejun Heo         2012-01-10  420  	 * alloc failed with that and @pool was empty, retry immediately.
1ebb7044c9142c Tejun Heo         2012-01-10  421  	 */
4e390b2b2f34b8 Michal Hocko      2016-07-28  422  	if (gfp_temp != gfp_mask) {
1ebb7044c9142c Tejun Heo         2012-01-10  423  		spin_unlock_irqrestore(&pool->lock, flags);
1ebb7044c9142c Tejun Heo         2012-01-10  424  		gfp_temp = gfp_mask;
1ebb7044c9142c Tejun Heo         2012-01-10  425  		goto repeat_alloc;
1ebb7044c9142c Tejun Heo         2012-01-10  426  	}
1ebb7044c9142c Tejun Heo         2012-01-10  427  
d0164adc89f6bb Mel Gorman        2015-11-06  428  	/* We must not sleep if !__GFP_DIRECT_RECLAIM */
d0164adc89f6bb Mel Gorman        2015-11-06  429  	if (!(gfp_mask & __GFP_DIRECT_RECLAIM)) {
5b990546e33477 Tejun Heo         2012-01-10  430  		spin_unlock_irqrestore(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  431  		return NULL;
5b990546e33477 Tejun Heo         2012-01-10  432  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  433  
5b990546e33477 Tejun Heo         2012-01-10  434  	/* Let's wait for someone else to return an element to @pool */
01890a4c120f68 Benjamin LaHaise  2005-06-23  435  	init_wait(&wait);
^1da177e4c3f41 Linus Torvalds    2005-04-16  436  	prepare_to_wait(&pool->wait, &wait, TASK_UNINTERRUPTIBLE);
5b990546e33477 Tejun Heo         2012-01-10  437  
5b990546e33477 Tejun Heo         2012-01-10  438  	spin_unlock_irqrestore(&pool->lock, flags);
5b990546e33477 Tejun Heo         2012-01-10  439  
0b1d647a02c5a1 Pavel Mironchik   2006-08-31  440  	/*
5b990546e33477 Tejun Heo         2012-01-10  441  	 * FIXME: this should be io_schedule().  The timeout is there as a
5b990546e33477 Tejun Heo         2012-01-10  442  	 * workaround for some DM problems in 2.6.18.
0b1d647a02c5a1 Pavel Mironchik   2006-08-31  443  	 */
0b1d647a02c5a1 Pavel Mironchik   2006-08-31  444  	io_schedule_timeout(5*HZ);
^1da177e4c3f41 Linus Torvalds    2005-04-16  445  
5b990546e33477 Tejun Heo         2012-01-10  446  	finish_wait(&pool->wait, &wait);
^1da177e4c3f41 Linus Torvalds    2005-04-16  447  	goto repeat_alloc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  448  }
78fc586c9b009d Kent Overstreet   2024-03-21  449  EXPORT_SYMBOL(mempool_alloc_noprof);
^1da177e4c3f41 Linus Torvalds    2005-04-16  450  

:::::: The code at line 271 was first introduced by commit
:::::: 1946089a109251655c5438d92c539bd2930e71ea [PATCH] NUMA aware block device control structure allocation

:::::: TO: Christoph Lameter <christoph@lameter.com>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
