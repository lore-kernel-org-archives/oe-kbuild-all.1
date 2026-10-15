Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C801DED49
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 00:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024303; cv=none; b=upEIG9GmLQLDPWYGEZQCgfrlFA2WMcfKVYo6nSqIW4Z4x7hw8vASBQ6zWkyaAhZPiHFC/8GmcmJq4tPcWMv2HumqZWPxgLz/VPwZ/8zt8FtdnVZNes1XZybe0PG8q+Mzw4v1UlO7URKXAvZ0+ZL9cgOM08DIBc7E2eVaVedu1C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024303; c=relaxed/simple;
	bh=cVDXUQ/yvjX303svwhNdtXEzQDVw5D86N5mgJFbGwwY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TlFsi25NjGQhCUeyFGWfZScO54y7hDE46/F5UB9p9O5xaq1yJ6Wi7rtSEHZeuDjXNCNbImHWYWG3S2WKoxHS/VcYb6p5qU96ObC3QlUtXRAlB8JiwYskrdINI1auphp20z/mqoTnRg1G9WmQeI1OULYWHKOfMfPiyd9Uju6bRJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwdwfcsB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwdwfcsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792024302; x=1823560302;
  h=date:from:to:cc:subject:message-id;
  bh=cVDXUQ/yvjX303svwhNdtXEzQDVw5D86N5mgJFbGwwY=;
  b=cwdwfcsBWsFqP20gkfEe0cqcYvzewTAsjmGc62TqGHlyg4BUqLQFCV6C
   67vhF2HzqXwU98l/Xxft6Vaa21CMFMXYSFzzxVs9guNDHx8GRPQkIOgYV
   GMhRThdLjCS3UrcE6yRPyon+pfGGSzSuRVHxrgQgEipVuMOPWwYHoeYGl
   QuT4sv+/rAVu7OD6wfqrmyvm8DQdW371Mk3cV9aOkp35HbHn3Qpsy+HNo
   G2DmVxhz37PZujfePKWwDWth0wOfTWLpl14Hp6o3KCi4bsfFtR/JrGxvl
   Sdy1LRaiw1a18/5D2vi+jrfTLjkNTCkfFSppU9JdPFarhopvkBr1Pd02O
   A==;
X-CSE-ConnectionGUID: Tvy9MNaXTte3E4PCLmXpTQ==
X-CSE-MsgGUID: qyMtvWpuSBuu1PFhjQe7NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="683533"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="683533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 17:31:41 -0700
X-CSE-ConnectionGUID: KD1MfKfaRg6uIJ+kwJJg1w==
X-CSE-MsgGUID: bn8JSTVPSDev/6JHoFVaOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1992460"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 14 Oct 2026 17:31:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH9Ng-00000000BSp-3O6a;
	Thu, 15 Oct 2026 00:31:36 +0000
Date: Thu, 15 Oct 2026 02:31:36 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Paulo Alcantara <pc@manguebit.org>
Subject: [dhowells-fs:netfs-next-3 3/13] fs/netfs/bvecq.c:79:22:
 error: implicit declaration of function 'mempool_alloc'; did you mean
 'mm_alloc'?
Message-ID: <202610150254.N2Rwl67T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-3
head:   d43a7f2a38d9f9e2d1db0b79681d6b4bfe766738
commit: ed51ab8615099f876973a3d428f73ed881f47a52 [3/13] netfs: Add some tools for managing bvecq chains
config: microblaze-randconfig-r2107-20261015 (https://download.01.org/0day-ci/archive/20261015/202610150254.N2Rwl67T-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150254.N2Rwl67T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150254.N2Rwl67T-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/bvecq.c: In function 'bvecq_alloc_one':
>> fs/netfs/bvecq.c:79:22: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Wimplicit-function-declaration]
      79 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                      ^~~~~~~~~~~~~
         |                      mm_alloc
>> fs/netfs/bvecq.c:79:20: error: assignment to 'struct bvecq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      79 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                    ^
   fs/netfs/bvecq.c: In function 'bvecq_put':
>> fs/netfs/bvecq.c:275:25: error: implicit declaration of function 'mempool_free' [-Wimplicit-function-declaration]
     275 |                         mempool_free(bq, &netfs_bvecq_pool);
         |                         ^~~~~~~~~~~~


vim +79 fs/netfs/bvecq.c

    38	
    39	/**
    40	 * bvecq_alloc_one - Allocate a single bvecq node with unpopulated slots
    41	 * @nr_slots: Number of slots to allocate
    42	 * @gfp: The allocation constraints.
    43	 * @for_writeback: True if allocating for writeback
    44	 *
    45	 * Allocate a single bvecq node and initialise the header.  The allocation is
    46	 * rounded up to the size of the smallest slab granule that will accommodate it
    47	 * and all the remaining space is set as an inline slot array with max_slots
    48	 * set to the number of slots.  The slot array is not initialised.
    49	 *
    50	 * If @for_writeback is set, then the emergency mempool may be used for
    51	 * allocation.  If it does allocate from that pool, the maximum number of slots
    52	 * available will be BVECQ_POOL_SLOTS which may be less than requested.  Also,
    53	 * if @for_writeback is set, the function will not fail - though it may have to
    54	 * wait.
    55	 *
    56	 * Return: The node pointer or NULL on allocation failure.
    57	 */
    58	struct bvecq *bvecq_alloc_one(size_t nr_slots, gfp_t gfp, bool for_writeback)
    59	{
    60		struct bvecq *bq;
    61		const size_t pool_size = struct_size_t(struct bvecq, __bv, BVECQ_POOL_SLOTS);
    62		size_t size;
    63		bool from_pool = false;
    64	
    65		size = kmalloc_size_roundup(struct_size(bq, __bv, nr_slots));
    66		gfp &= ~(GFP_ZONEMASK | __GFP_THISNODE);
    67	
    68		if (for_writeback) {
    69			if (size != pool_size) {
    70				gfp_t gfp_temp = gfp;
    71	
    72				gfp_temp |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN;
    73				gfp_temp &= ~(__GFP_DIRECT_RECLAIM | __GFP_IO);
    74				bq = kmalloc(size, gfp_temp);
    75				if (bq)
    76					goto success;
    77			}
    78	
  > 79			bq = mempool_alloc(&netfs_bvecq_pool, gfp);
    80			if (!bq)
    81				return bq;
    82			from_pool = true;
    83			size = pool_size;
    84		} else {
    85			bq = kmalloc(size, gfp);
    86			if (!bq)
    87				return bq;
    88		}
    89	
    90	success:
    91		*bq = (struct bvecq) {
    92			.ref		= REFCOUNT_INIT(1),
    93			.bv		= bq->__bv,
    94			.inline_bv	= true,
    95			.max_slots	= (size - sizeof(*bq)) / sizeof(bq->__bv[0]),
    96			.from_pool	= from_pool,
    97		};
    98		netfs_stat(&netfs_n_bvecq);
    99		return bq;
   100	}
   101	EXPORT_SYMBOL(bvecq_alloc_one);
   102	
   103	/**
   104	 * bvecq_alloc_chain - Allocate an unpopulated bvecq chain
   105	 * @nr_slots: Number of slots to allocate
   106	 * @gfp: The allocation constraints.
   107	 * @for_writeback: True if allocating for writeback
   108	 *
   109	 * Allocate a chain of bvecq nodes providing at least the requested cumulative
   110	 * number of slots.  Each node is a maximum of 4KiB in size.
   111	 *
   112	 * Return: The first node pointer or NULL on allocation failure.
   113	 */
   114	struct bvecq *bvecq_alloc_chain(size_t nr_slots, gfp_t gfp, bool for_writeback)
   115	{
   116		struct bvecq *head = NULL, *tail = NULL;
   117	
   118		_enter("%zu", nr_slots);
   119	
   120		for (;;) {
   121			struct bvecq *bq;
   122	
   123			bq = bvecq_alloc_one(min(nr_slots, BVECQ_4KB_SLOTS), gfp, for_writeback);
   124			if (!bq)
   125				goto oom;
   126	
   127			if (tail)
   128				bvecq_append(tail, bq);
   129			else
   130				head = bq;
   131			tail = bq;
   132			if (tail->max_slots >= nr_slots)
   133				break;
   134			nr_slots -= tail->max_slots;
   135		}
   136	
   137		return head;
   138	oom:
   139		bvecq_put(head);
   140		return NULL;
   141	}
   142	EXPORT_SYMBOL(bvecq_alloc_chain);
   143	
   144	/**
   145	 * bvecq_alloc_buffer2 - Allocate a bvecq chain and populate with buffers
   146	 * @size: Target size of the buffer (can be 0 for an empty buffer)
   147	 * @pre_slots: Number of preamble slots to set aside
   148	 * @gfp: The allocation constraints.
   149	 * @for_writeback: True if allocating for writeback
   150	 *
   151	 * Allocate a chain of bvecq nodes and populate the slots with sufficient pages
   152	 * to provide at least the requested amount of space, leaving the first
   153	 * @pre_slots slots unset.  The pre-slots must all fit into the the first
   154	 * bvecq.
   155	 *
   156	 * The pages allocated may be compound pages larger than PAGE_SIZE and thus
   157	 * occupy fewer slots.  The pages have their refcounts set to 1 and can be
   158	 * passed to MSG_SPLICE_PAGES.
   159	 *
   160	 * Return: The first node pointer or NULL on allocation failure.
   161	 */
   162	struct bvecq *bvecq_alloc_buffer2(size_t size, unsigned int pre_slots, gfp_t gfp,
   163					  bool for_writeback)
   164	{
   165		struct bvecq *head = NULL, *p = NULL;
   166		size_t nr_per_bq = BVECQ_POOL_SLOTS;
   167		size_t count = pre_slots + DIV_ROUND_UP(size, PAGE_SIZE);
   168	
   169		_enter("%zx,%zx,%u", size, count, pre_slots);
   170	
   171		if (WARN_ON_ONCE(pre_slots > nr_per_bq))
   172			return NULL;
   173	
   174		head = bvecq_alloc_chain(count, gfp, for_writeback);
   175		if (!head)
   176			return NULL;
   177	
   178		p = head;
   179		do {
   180			struct page **pages;
   181			size_t unused, want, got, slot;
   182	
   183			if (!count)
   184				break;
   185			if (WARN_ON_ONCE(!p))
   186				goto oom;
   187	
   188			if (p->nr_slots == 0) {
   189				/* Need to clear pre slots and pages[], so just clear all. */
   190				memset(p->bv, 0, p->max_slots * sizeof(p->bv[0]));
   191				p->mem_type = BVECQ_MEM_ALLOCED;
   192				p->nr_slots = pre_slots;
   193				count -= pre_slots;
   194				pre_slots = 0;
   195				if (!count)
   196					break;
   197			}
   198	
   199			if (p->nr_slots >= p->max_slots) {
   200				p = p->next;
   201				continue;
   202			}
   203			unused = p->max_slots - p->nr_slots;
   204	
   205			pages = (struct page **)&p->bv[p->max_slots];
   206			pages -= unused;
   207	
   208			want = min(count, unused);
   209			got = alloc_pages_bulk(gfp, want, pages);
   210			if (!got)
   211				goto oom;
   212	
   213			slot = p->nr_slots;
   214			for (int i = 0; i < got; i++)
   215				bvec_set_page(&p->bv[slot++], pages[i], PAGE_SIZE, 0);
   216	
   217			bvecq_filled_to(p, slot);
   218			count -= got;
   219		} while (count > 0);
   220	
   221		return head;
   222	oom:
   223		bvecq_put(head);
   224		return NULL;
   225	}
   226	EXPORT_SYMBOL(bvecq_alloc_buffer2);
   227	
   228	/*
   229	 * Free the page pointed to by a slot as necessary.
   230	 */
   231	static void bvecq_free_slot(struct bvecq *bq, unsigned int slot)
   232	{
   233		struct page *page = bq->bv[slot].bv_page;
   234	
   235		if (!page)
   236			return;
   237	
   238		switch (bq->mem_type) {
   239		case BVECQ_MEM_EXTERNAL:
   240			break;
   241		case BVECQ_MEM_PAGECACHE:
   242			put_page(page);
   243			break;
   244		case BVECQ_MEM_GUP:
   245			unpin_user_page(page);
   246			break;
   247		case BVECQ_MEM_ALLOCED:
   248			__free_pages(page, compound_order(page));
   249			break;
   250		default:
   251			WARN_ON_ONCE(1);
   252			break;
   253		}
   254	}
   255	
   256	/**
   257	 * bvecq_put - Put a ref on a bvec queue
   258	 * @bq: The start of the folio queue to free
   259	 *
   260	 * Put the ref(s) on the nodes in a bvec queue, freeing up the node and the
   261	 * page fragments it points to as the refcounts become zero.
   262	 */
   263	void bvecq_put(struct bvecq *bq)
   264	{
   265		struct bvecq *next;
   266	
   267		for (; bq; bq = next) {
   268			if (!refcount_dec_and_test(&bq->ref))
   269				break;
   270			for (int slot = 0; slot < bq->nr_slots; slot++)
   271				bvecq_free_slot(bq, slot);
   272			next = bq->next;
   273			netfs_stat_d(&netfs_n_bvecq);
   274			if (bq->from_pool)
 > 275				mempool_free(bq, &netfs_bvecq_pool);
   276			else
   277				kfree(bq);
   278		}
   279	}
   280	EXPORT_SYMBOL(bvecq_put);
   281	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
