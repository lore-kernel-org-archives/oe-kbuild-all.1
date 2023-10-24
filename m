Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07242749D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 23:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdVn4ODl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698191085; x=1729727085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ggkP5Rk3ljg+Cg0K7tYhtLgzeyhkr75Py/jrjHxeXrQ=;
  b=FdVn4ODlhQ2IznVUMVJVPbdoC7ngQlD14kgfFAmY9ZRE1Qgj1/CccZo4
   6vmTsQ/bnxQ63mQrB/RQT1nuK163LVBS2gzU/sd5S5cCbvIm2Oaw0oFsq
   ylSo6svywSOby1Rk/HozJ68rXX4bHJhqkQ/jkde02rxSR0nE+BvfjPxF2
   iU99sGcmY0paDmx+knYI2Mk4VNU1NIhgNEW32W6QP+4qLth84ycgOZ2g8
   y6KzgPxH08368vp45lS1yINn8zSyF9FnZLca7bLBvDOCikJNsk6GeO+o7
   rE1STRScng/1y0TZT3F0lseJiKS/TxwbT1gJXMi9aWmrEfMDgjxw/7l+K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="453670199"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="453670199"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 16:44:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="787948978"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="787948978"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Oct 2023 16:44:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvR4b-0008PP-0M;
	Tue, 24 Oct 2023 23:44:33 +0000
Date: Wed, 25 Oct 2023 07:43:55 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com, corbet@lwn.net,
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
	ldufour@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com,
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, dennis@kernel.org,
	tj@kernel.org
Subject: Re: [PATCH v2 26/39] mempool: Hook up to memory allocation profiling
Message-ID: <202310250742.PXITCRR8-lkp@intel.com>
References: <20231024134637.3120277-27-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024134637.3120277-27-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vbabka-slab/for-next]
[also build test WARNING on kees/for-next/hardening linus/master v6.6-rc7]
[cannot apply to akpm-mm/mm-everything next-20231024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20231024-215116
base:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-next
patch link:    https://lore.kernel.org/r/20231024134637.3120277-27-surenb%40google.com
patch subject: [PATCH v2 26/39] mempool: Hook up to memory allocation profiling
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231025/202310250742.PXITCRR8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250742.PXITCRR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250742.PXITCRR8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mempool.c:235: warning: expecting prototype for mempool_init(). Prototype was for mempool_init_noprof() instead
>> mm/mempool.c:261: warning: Function parameter or member 'gfp_mask' not described in 'mempool_create_node_noprof'
>> mm/mempool.c:261: warning: Function parameter or member 'node_id' not described in 'mempool_create_node_noprof'
>> mm/mempool.c:261: warning: expecting prototype for mempool_create_node(). Prototype was for mempool_create_node_noprof() instead
>> mm/mempool.c:373: warning: expecting prototype for mempool_alloc(). Prototype was for mempool_alloc_noprof() instead


vim +235 mm/mempool.c

c1a67fefd0546a Kent Overstreet   2015-05-04  218  
c1a67fefd0546a Kent Overstreet   2015-05-04  219  /**
c1a67fefd0546a Kent Overstreet   2015-05-04  220   * mempool_init - initialize a memory pool
a3bf6ce3664960 Mike Rapoport     2018-08-21  221   * @pool:      pointer to the memory pool that should be initialized
c1a67fefd0546a Kent Overstreet   2015-05-04  222   * @min_nr:    the minimum number of elements guaranteed to be
c1a67fefd0546a Kent Overstreet   2015-05-04  223   *             allocated for this pool.
c1a67fefd0546a Kent Overstreet   2015-05-04  224   * @alloc_fn:  user-defined element-allocation function.
c1a67fefd0546a Kent Overstreet   2015-05-04  225   * @free_fn:   user-defined element-freeing function.
c1a67fefd0546a Kent Overstreet   2015-05-04  226   * @pool_data: optional private data available to the user-defined functions.
c1a67fefd0546a Kent Overstreet   2015-05-04  227   *
c1a67fefd0546a Kent Overstreet   2015-05-04  228   * Like mempool_create(), but initializes the pool in (i.e. embedded in another
c1a67fefd0546a Kent Overstreet   2015-05-04  229   * structure).
a862f68a8b3600 Mike Rapoport     2019-03-05  230   *
a862f68a8b3600 Mike Rapoport     2019-03-05  231   * Return: %0 on success, negative error code otherwise.
c1a67fefd0546a Kent Overstreet   2015-05-04  232   */
0bd30b9796272a Kent Overstreet   2023-10-24  233  int mempool_init_noprof(mempool_t *pool, int min_nr, mempool_alloc_t *alloc_fn,
c1a67fefd0546a Kent Overstreet   2015-05-04  234  			mempool_free_t *free_fn, void *pool_data)
c1a67fefd0546a Kent Overstreet   2015-05-04 @235  {
c1a67fefd0546a Kent Overstreet   2015-05-04  236  	return mempool_init_node(pool, min_nr, alloc_fn, free_fn,
c1a67fefd0546a Kent Overstreet   2015-05-04  237  				 pool_data, GFP_KERNEL, NUMA_NO_NODE);
c1a67fefd0546a Kent Overstreet   2015-05-04  238  
c1a67fefd0546a Kent Overstreet   2015-05-04  239  }
0bd30b9796272a Kent Overstreet   2023-10-24  240  EXPORT_SYMBOL(mempool_init_noprof);
c1a67fefd0546a Kent Overstreet   2015-05-04  241  
^1da177e4c3f41 Linus Torvalds    2005-04-16  242  /**
0bd30b9796272a Kent Overstreet   2023-10-24  243   * mempool_create_node - create a memory pool
^1da177e4c3f41 Linus Torvalds    2005-04-16  244   * @min_nr:    the minimum number of elements guaranteed to be
^1da177e4c3f41 Linus Torvalds    2005-04-16  245   *             allocated for this pool.
^1da177e4c3f41 Linus Torvalds    2005-04-16  246   * @alloc_fn:  user-defined element-allocation function.
^1da177e4c3f41 Linus Torvalds    2005-04-16  247   * @free_fn:   user-defined element-freeing function.
^1da177e4c3f41 Linus Torvalds    2005-04-16  248   * @pool_data: optional private data available to the user-defined functions.
^1da177e4c3f41 Linus Torvalds    2005-04-16  249   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  250   * this function creates and allocates a guaranteed size, preallocated
72fd4a35a82433 Robert P. J. Day  2007-02-10  251   * memory pool. The pool can be used from the mempool_alloc() and mempool_free()
^1da177e4c3f41 Linus Torvalds    2005-04-16  252   * functions. This function might sleep. Both the alloc_fn() and the free_fn()
72fd4a35a82433 Robert P. J. Day  2007-02-10  253   * functions might sleep - as long as the mempool_alloc() function is not called
^1da177e4c3f41 Linus Torvalds    2005-04-16  254   * from IRQ contexts.
a862f68a8b3600 Mike Rapoport     2019-03-05  255   *
a862f68a8b3600 Mike Rapoport     2019-03-05  256   * Return: pointer to the created memory pool object or %NULL on error.
^1da177e4c3f41 Linus Torvalds    2005-04-16  257   */
0bd30b9796272a Kent Overstreet   2023-10-24  258  mempool_t *mempool_create_node_noprof(int min_nr, mempool_alloc_t *alloc_fn,
a91a5ac6858fbf Tejun Heo         2012-06-04  259  				      mempool_free_t *free_fn, void *pool_data,
a91a5ac6858fbf Tejun Heo         2012-06-04  260  				      gfp_t gfp_mask, int node_id)
1946089a109251 Christoph Lameter 2005-06-23 @261  {
1946089a109251 Christoph Lameter 2005-06-23  262  	mempool_t *pool;
c1a67fefd0546a Kent Overstreet   2015-05-04  263  
7b5219db00d0af Joe Perches       2013-09-11  264  	pool = kzalloc_node(sizeof(*pool), gfp_mask, node_id);
^1da177e4c3f41 Linus Torvalds    2005-04-16  265  	if (!pool)
^1da177e4c3f41 Linus Torvalds    2005-04-16  266  		return NULL;
c1a67fefd0546a Kent Overstreet   2015-05-04  267  
c1a67fefd0546a Kent Overstreet   2015-05-04  268  	if (mempool_init_node(pool, min_nr, alloc_fn, free_fn, pool_data,
c1a67fefd0546a Kent Overstreet   2015-05-04  269  			      gfp_mask, node_id)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  270  		kfree(pool);
^1da177e4c3f41 Linus Torvalds    2005-04-16  271  		return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  272  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  273  
^1da177e4c3f41 Linus Torvalds    2005-04-16  274  	return pool;
^1da177e4c3f41 Linus Torvalds    2005-04-16  275  }
0bd30b9796272a Kent Overstreet   2023-10-24  276  EXPORT_SYMBOL(mempool_create_node_noprof);
^1da177e4c3f41 Linus Torvalds    2005-04-16  277  
^1da177e4c3f41 Linus Torvalds    2005-04-16  278  /**
^1da177e4c3f41 Linus Torvalds    2005-04-16  279   * mempool_resize - resize an existing memory pool
^1da177e4c3f41 Linus Torvalds    2005-04-16  280   * @pool:       pointer to the memory pool which was allocated via
^1da177e4c3f41 Linus Torvalds    2005-04-16  281   *              mempool_create().
^1da177e4c3f41 Linus Torvalds    2005-04-16  282   * @new_min_nr: the new minimum number of elements guaranteed to be
^1da177e4c3f41 Linus Torvalds    2005-04-16  283   *              allocated for this pool.
^1da177e4c3f41 Linus Torvalds    2005-04-16  284   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  285   * This function shrinks/grows the pool. In the case of growing,
^1da177e4c3f41 Linus Torvalds    2005-04-16  286   * it cannot be guaranteed that the pool will be grown to the new
^1da177e4c3f41 Linus Torvalds    2005-04-16  287   * size immediately, but new mempool_free() calls will refill it.
11d83360452ea2 David Rientjes    2015-04-14  288   * This function may sleep.
^1da177e4c3f41 Linus Torvalds    2005-04-16  289   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  290   * Note, the caller must guarantee that no mempool_destroy is called
^1da177e4c3f41 Linus Torvalds    2005-04-16  291   * while this function is running. mempool_alloc() & mempool_free()
^1da177e4c3f41 Linus Torvalds    2005-04-16  292   * might be called (eg. from IRQ contexts) while this function executes.
a862f68a8b3600 Mike Rapoport     2019-03-05  293   *
a862f68a8b3600 Mike Rapoport     2019-03-05  294   * Return: %0 on success, negative error code otherwise.
^1da177e4c3f41 Linus Torvalds    2005-04-16  295   */
11d83360452ea2 David Rientjes    2015-04-14  296  int mempool_resize(mempool_t *pool, int new_min_nr)
^1da177e4c3f41 Linus Torvalds    2005-04-16  297  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  298  	void *element;
^1da177e4c3f41 Linus Torvalds    2005-04-16  299  	void **new_elements;
^1da177e4c3f41 Linus Torvalds    2005-04-16  300  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds    2005-04-16  301  
^1da177e4c3f41 Linus Torvalds    2005-04-16  302  	BUG_ON(new_min_nr <= 0);
11d83360452ea2 David Rientjes    2015-04-14  303  	might_sleep();
^1da177e4c3f41 Linus Torvalds    2005-04-16  304  
^1da177e4c3f41 Linus Torvalds    2005-04-16  305  	spin_lock_irqsave(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  306  	if (new_min_nr <= pool->min_nr) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  307  		while (new_min_nr < pool->curr_nr) {
8cded8668e1f49 Jia-Ju Bai        2018-08-17  308  			element = remove_element(pool);
^1da177e4c3f41 Linus Torvalds    2005-04-16  309  			spin_unlock_irqrestore(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  310  			pool->free(element, pool->pool_data);
^1da177e4c3f41 Linus Torvalds    2005-04-16  311  			spin_lock_irqsave(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  312  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  313  		pool->min_nr = new_min_nr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  314  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  315  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  316  	spin_unlock_irqrestore(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  317  
^1da177e4c3f41 Linus Torvalds    2005-04-16  318  	/* Grow the pool */
11d83360452ea2 David Rientjes    2015-04-14  319  	new_elements = kmalloc_array(new_min_nr, sizeof(*new_elements),
11d83360452ea2 David Rientjes    2015-04-14  320  				     GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  321  	if (!new_elements)
^1da177e4c3f41 Linus Torvalds    2005-04-16  322  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  323  
^1da177e4c3f41 Linus Torvalds    2005-04-16  324  	spin_lock_irqsave(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  325  	if (unlikely(new_min_nr <= pool->min_nr)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  326  		/* Raced, other resize will do our work */
^1da177e4c3f41 Linus Torvalds    2005-04-16  327  		spin_unlock_irqrestore(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  328  		kfree(new_elements);
^1da177e4c3f41 Linus Torvalds    2005-04-16  329  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  330  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  331  	memcpy(new_elements, pool->elements,
^1da177e4c3f41 Linus Torvalds    2005-04-16  332  			pool->curr_nr * sizeof(*new_elements));
^1da177e4c3f41 Linus Torvalds    2005-04-16  333  	kfree(pool->elements);
^1da177e4c3f41 Linus Torvalds    2005-04-16  334  	pool->elements = new_elements;
^1da177e4c3f41 Linus Torvalds    2005-04-16  335  	pool->min_nr = new_min_nr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  336  
^1da177e4c3f41 Linus Torvalds    2005-04-16  337  	while (pool->curr_nr < pool->min_nr) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  338  		spin_unlock_irqrestore(&pool->lock, flags);
11d83360452ea2 David Rientjes    2015-04-14  339  		element = pool->alloc(GFP_KERNEL, pool->pool_data);
^1da177e4c3f41 Linus Torvalds    2005-04-16  340  		if (!element)
^1da177e4c3f41 Linus Torvalds    2005-04-16  341  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  342  		spin_lock_irqsave(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  343  		if (pool->curr_nr < pool->min_nr) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  344  			add_element(pool, element);
^1da177e4c3f41 Linus Torvalds    2005-04-16  345  		} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  346  			spin_unlock_irqrestore(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  347  			pool->free(element, pool->pool_data);	/* Raced */
^1da177e4c3f41 Linus Torvalds    2005-04-16  348  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  349  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  350  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  351  out_unlock:
^1da177e4c3f41 Linus Torvalds    2005-04-16  352  	spin_unlock_irqrestore(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  353  out:
^1da177e4c3f41 Linus Torvalds    2005-04-16  354  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  355  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  356  EXPORT_SYMBOL(mempool_resize);
^1da177e4c3f41 Linus Torvalds    2005-04-16  357  
^1da177e4c3f41 Linus Torvalds    2005-04-16  358  /**
^1da177e4c3f41 Linus Torvalds    2005-04-16  359   * mempool_alloc - allocate an element from a specific memory pool
^1da177e4c3f41 Linus Torvalds    2005-04-16  360   * @pool:      pointer to the memory pool which was allocated via
^1da177e4c3f41 Linus Torvalds    2005-04-16  361   *             mempool_create().
^1da177e4c3f41 Linus Torvalds    2005-04-16  362   * @gfp_mask:  the usual allocation bitmask.
^1da177e4c3f41 Linus Torvalds    2005-04-16  363   *
72fd4a35a82433 Robert P. J. Day  2007-02-10  364   * this function only sleeps if the alloc_fn() function sleeps or
^1da177e4c3f41 Linus Torvalds    2005-04-16  365   * returns NULL. Note that due to preallocation, this function
^1da177e4c3f41 Linus Torvalds    2005-04-16  366   * *never* fails when called from process contexts. (it might
^1da177e4c3f41 Linus Torvalds    2005-04-16  367   * fail if called from an IRQ context.)
4e390b2b2f34b8 Michal Hocko      2016-07-28  368   * Note: using __GFP_ZERO is not supported.
a862f68a8b3600 Mike Rapoport     2019-03-05  369   *
a862f68a8b3600 Mike Rapoport     2019-03-05  370   * Return: pointer to the allocated element or %NULL on error.
^1da177e4c3f41 Linus Torvalds    2005-04-16  371   */
0bd30b9796272a Kent Overstreet   2023-10-24  372  void *mempool_alloc_noprof(mempool_t *pool, gfp_t gfp_mask)
^1da177e4c3f41 Linus Torvalds    2005-04-16 @373  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  374  	void *element;
^1da177e4c3f41 Linus Torvalds    2005-04-16  375  	unsigned long flags;
ac6424b981bce1 Ingo Molnar       2017-06-20  376  	wait_queue_entry_t wait;
6daa0e28627abf Al Viro           2005-10-21  377  	gfp_t gfp_temp;
20a77776c24800 Nicholas Piggin   2005-05-01  378  
8bf8fcb07653fb Sebastian Ott     2014-06-04  379  	VM_WARN_ON_ONCE(gfp_mask & __GFP_ZERO);
21bfe8db0a4223 Daniel Vetter     2022-06-05  380  	might_alloc(gfp_mask);
b84a35be028522 Nicholas Piggin   2005-05-01  381  
4e390b2b2f34b8 Michal Hocko      2016-07-28  382  	gfp_mask |= __GFP_NOMEMALLOC;	/* don't allocate emergency reserves */
b84a35be028522 Nicholas Piggin   2005-05-01  383  	gfp_mask |= __GFP_NORETRY;	/* don't loop in __alloc_pages */
b84a35be028522 Nicholas Piggin   2005-05-01  384  	gfp_mask |= __GFP_NOWARN;	/* failures are OK */
^1da177e4c3f41 Linus Torvalds    2005-04-16  385  
d0164adc89f6bb Mel Gorman        2015-11-06  386  	gfp_temp = gfp_mask & ~(__GFP_DIRECT_RECLAIM|__GFP_IO);
20a77776c24800 Nicholas Piggin   2005-05-01  387  
^1da177e4c3f41 Linus Torvalds    2005-04-16  388  repeat_alloc:
^1da177e4c3f41 Linus Torvalds    2005-04-16  389  
20a77776c24800 Nicholas Piggin   2005-05-01  390  	element = pool->alloc(gfp_temp, pool->pool_data);
^1da177e4c3f41 Linus Torvalds    2005-04-16  391  	if (likely(element != NULL))
^1da177e4c3f41 Linus Torvalds    2005-04-16  392  		return element;
^1da177e4c3f41 Linus Torvalds    2005-04-16  393  
^1da177e4c3f41 Linus Torvalds    2005-04-16  394  	spin_lock_irqsave(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  395  	if (likely(pool->curr_nr)) {
8cded8668e1f49 Jia-Ju Bai        2018-08-17  396  		element = remove_element(pool);
^1da177e4c3f41 Linus Torvalds    2005-04-16  397  		spin_unlock_irqrestore(&pool->lock, flags);
5b990546e33477 Tejun Heo         2012-01-10  398  		/* paired with rmb in mempool_free(), read comment there */
5b990546e33477 Tejun Heo         2012-01-10  399  		smp_wmb();
174119628188b0 Catalin Marinas   2014-06-06  400  		/*
174119628188b0 Catalin Marinas   2014-06-06  401  		 * Update the allocation stack trace as this is more useful
174119628188b0 Catalin Marinas   2014-06-06  402  		 * for debugging.
174119628188b0 Catalin Marinas   2014-06-06  403  		 */
174119628188b0 Catalin Marinas   2014-06-06  404  		kmemleak_update_trace(element);
^1da177e4c3f41 Linus Torvalds    2005-04-16  405  		return element;
^1da177e4c3f41 Linus Torvalds    2005-04-16  406  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  407  
1ebb7044c9142c Tejun Heo         2012-01-10  408  	/*
d0164adc89f6bb Mel Gorman        2015-11-06  409  	 * We use gfp mask w/o direct reclaim or IO for the first round.  If
1ebb7044c9142c Tejun Heo         2012-01-10  410  	 * alloc failed with that and @pool was empty, retry immediately.
1ebb7044c9142c Tejun Heo         2012-01-10  411  	 */
4e390b2b2f34b8 Michal Hocko      2016-07-28  412  	if (gfp_temp != gfp_mask) {
1ebb7044c9142c Tejun Heo         2012-01-10  413  		spin_unlock_irqrestore(&pool->lock, flags);
1ebb7044c9142c Tejun Heo         2012-01-10  414  		gfp_temp = gfp_mask;
1ebb7044c9142c Tejun Heo         2012-01-10  415  		goto repeat_alloc;
1ebb7044c9142c Tejun Heo         2012-01-10  416  	}
1ebb7044c9142c Tejun Heo         2012-01-10  417  
d0164adc89f6bb Mel Gorman        2015-11-06  418  	/* We must not sleep if !__GFP_DIRECT_RECLAIM */
d0164adc89f6bb Mel Gorman        2015-11-06  419  	if (!(gfp_mask & __GFP_DIRECT_RECLAIM)) {
5b990546e33477 Tejun Heo         2012-01-10  420  		spin_unlock_irqrestore(&pool->lock, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  421  		return NULL;
5b990546e33477 Tejun Heo         2012-01-10  422  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  423  
5b990546e33477 Tejun Heo         2012-01-10  424  	/* Let's wait for someone else to return an element to @pool */
01890a4c120f68 Benjamin LaHaise  2005-06-23  425  	init_wait(&wait);
^1da177e4c3f41 Linus Torvalds    2005-04-16  426  	prepare_to_wait(&pool->wait, &wait, TASK_UNINTERRUPTIBLE);
5b990546e33477 Tejun Heo         2012-01-10  427  
5b990546e33477 Tejun Heo         2012-01-10  428  	spin_unlock_irqrestore(&pool->lock, flags);
5b990546e33477 Tejun Heo         2012-01-10  429  
0b1d647a02c5a1 Pavel Mironchik   2006-08-31  430  	/*
5b990546e33477 Tejun Heo         2012-01-10  431  	 * FIXME: this should be io_schedule().  The timeout is there as a
5b990546e33477 Tejun Heo         2012-01-10  432  	 * workaround for some DM problems in 2.6.18.
0b1d647a02c5a1 Pavel Mironchik   2006-08-31  433  	 */
0b1d647a02c5a1 Pavel Mironchik   2006-08-31  434  	io_schedule_timeout(5*HZ);
^1da177e4c3f41 Linus Torvalds    2005-04-16  435  
5b990546e33477 Tejun Heo         2012-01-10  436  	finish_wait(&pool->wait, &wait);
^1da177e4c3f41 Linus Torvalds    2005-04-16  437  	goto repeat_alloc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  438  }
0bd30b9796272a Kent Overstreet   2023-10-24  439  EXPORT_SYMBOL(mempool_alloc_noprof);
^1da177e4c3f41 Linus Torvalds    2005-04-16  440  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
