Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793940853;
	b=uAS0BnKua530OY/BWyEwUAifSB+E0Vac0E7iaD8OGeHWZUwk/Y5kA3adTzaDGd55C4ZY
	 oulGjtw+H+Bi2172fTarDIZj24HIRezLk8R+6ZHOVfOEycCX+5cnZ6jtcCR3WbGo0c76f
	 ZaIZKGdWwGc9F47SuVX61YrYB23EJ1+l1U+4JSOK5X/mGw/UW+Yc03EcLDg5hqulGdsQw
	 aPJHl1ze7JU0h/og3sbvAaDnTFsYntxhbNNF7eNJgDL/JtF3sbN5y0Ynhx4FYOC4404Jg
	 1c2iBYqVHsmCBwu/MKZHpu1B9LD3FLmYwPTaFG1DQ7lGrf6WFBlVtvnQ6tCU7rhESOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793940853;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rK6tjlSL2JI5uNMtnUlD1zP///OrAq2bnotPzRP/5z8=;
	b=glSBmGl4MgiM2iAwKEpN/0MieZsYjsxycsrColxPhTuFtIP25jMC5809+/0Vtiu0mtMj
	 u8H2TzyaX7TUocKTQ5oyfHcSZUBkK7JYyXANarjePlI0vMJQxF3vRCcgcTKD6onMbqSO5
	 tuX3xBh6/94569RV0qYUfcYUgLcLl9R8LrHBMazjNgkH/WppiQWM4soB7It50fmqjjnAW
	 ndcKacQVkxiCWoMNCf214B101Q2yB2xJ7zkvGbPMPAbtjaYso69fD5SJnSb5BDF0QkWMc
	 tlI8x2xZeacuEtJmbVkc1OrVR2AQbt76bXe3Zk/3BFJSiyfU8P69pjNlpz4F12hR9Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bv08YMrz;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A6606A32D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 04:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 905A6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bv08YMrz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793940851; x=1825476851;
  h=date:from:to:cc:subject:message-id;
  bh=h+1iGc5RGYFC6SAx/vnGEtxq1esfFyF10ja1lWzV49g=;
  b=bv08YMrzoRNw18flLj994Rr3VC0NT1niPoun9X9PO/mqogPRFdDaU2BO
   YZyuopTv8QQgym3PLRNOh5m9+Jg9jHfO5fvntxX+phgoORfhr1bsiC/cs
   hV8o6MfhWOyWVNGkAjqyDfapJzpzWYJUdtMRW0J+6ZkiIbgSqu6+uHSl7
   d4RWnUG3epWmnSCYV2wZLsrAgeQCFUjyXo7joeXIPAsomio/TKvKvPdvQ
   doDnuHFUAY0ZvqmKjD4q+ZswXTvlZvbIrA0/edm21p2YN5iJQP7AA1hUk
   ys14ntk+6wI4XM/GYnGhlknSVaQLby6i6rJtkZVpqLikj/NMnJD0bAmOD
   A==;
X-CSE-ConnectionGUID: w7xoJYuqRwqb7uXExpA4Dg==
X-CSE-MsgGUID: O0u/ykzaRMahGXAEinuyIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2788714"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2788714"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 20:54:11 -0800
X-CSE-ConnectionGUID: zD2ajM+lSmKfNUg4APS85Q==
X-CSE-MsgGUID: ySQwU3LfRKqq61TMT3C0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8941820"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 05 Nov 2026 20:54:10 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPBxn-00000000A23-1SNW;
	Fri, 06 Nov 2026 04:54:07 +0000
Date: Fri, 06 Nov 2026 05:53:18 +0100
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Paulo Alcantara <pc@manguebit.org>
Subject: [dhowells-fs:netfs-next-3 3/12] fs/netfs/bvecq.c:74:8:
 error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202611060545.VS2yQDN1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-3
head:   79a2d44fadd22d5c8b7cabe33bbb2c1f2afab99f
commit: cfdbc54a9af55a6a95a731f973444672f50b4ada [3/12] netfs: Add some tools for managing bvecq chains
config: i386-randconfig-2105-20261106 (https://download.01.org/0day-ci/archive/20261106/202611060545.VS2yQDN1-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060545.VS2yQDN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060545.VS2yQDN1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/bvecq.c:74:8: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      74 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                      ^
>> fs/netfs/bvecq.c:74:6: error: incompatible integer to pointer conversion assigning to 'struct bvecq *' from 'int' [-Wint-conversion]
      74 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/bvecq.c:270:4: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     270 |                         mempool_free(bq, &netfs_bvecq_pool);
         |                         ^
   3 errors generated.


vim +/mempool_alloc +74 fs/netfs/bvecq.c

    33	
    34	/**
    35	 * bvecq_alloc_one - Allocate a single bvecq node with unpopulated slots
    36	 * @nr_slots: Number of slots to allocate
    37	 * @gfp: The allocation constraints.
    38	 * @for_writeback: True if allocating for writeback
    39	 *
    40	 * Allocate a single bvecq node and initialise the header.  The allocation is
    41	 * rounded up to the size of the smallest slab granule that will accommodate it
    42	 * and all the remaining space is set as an inline slot array with max_slots
    43	 * set to the number of slots.  The slot array is not initialised.
    44	 *
    45	 * If @for_writeback is set, then the emergency mempool may be used for
    46	 * allocation.  If it does allocate from that pool, the maximum number of slots
    47	 * available will be BVECQ_POOL_SLOTS which may be less than requested.  Also,
    48	 * if @for_writeback is set, the function will not fail - though it may have to
    49	 * wait.
    50	 *
    51	 * Return: The node pointer or NULL on allocation failure.
    52	 */
    53	struct bvecq *bvecq_alloc_one(size_t nr_slots, gfp_t gfp, bool for_writeback)
    54	{
    55		struct bvecq *bq;
    56		const size_t pool_size = struct_size_t(struct bvecq, __bv, BVECQ_POOL_SLOTS);
    57		size_t size;
    58		bool from_pool = false;
    59	
    60		size = kmalloc_size_roundup(struct_size(bq, __bv, nr_slots));
    61		gfp &= ~(GFP_ZONEMASK | __GFP_THISNODE);
    62	
    63		if (for_writeback) {
    64			if (size != pool_size) {
    65				gfp_t gfp_temp = gfp;
    66	
    67				gfp_temp |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN;
    68				gfp_temp &= ~(__GFP_DIRECT_RECLAIM | __GFP_IO);
    69				bq = kmalloc(size, gfp_temp);
    70				if (bq)
    71					goto success;
    72			}
    73	
  > 74			bq = mempool_alloc(&netfs_bvecq_pool, gfp);
    75			if (!bq)
    76				return bq;
    77			from_pool = true;
    78			size = pool_size;
    79		} else {
    80			bq = kmalloc(size, gfp);
    81			if (!bq)
    82				return bq;
    83		}
    84	
    85	success:
    86		*bq = (struct bvecq) {
    87			.ref		= REFCOUNT_INIT(1),
    88			.bv		= bq->__bv,
    89			.inline_bv	= true,
    90			.max_slots	= (size - sizeof(*bq)) / sizeof(bq->__bv[0]),
    91			.from_pool	= from_pool,
    92		};
    93		netfs_stat(&netfs_n_bvecq);
    94		return bq;
    95	}
    96	EXPORT_SYMBOL(bvecq_alloc_one);
    97	
    98	/**
    99	 * bvecq_alloc_chain - Allocate an unpopulated bvecq chain
   100	 * @nr_slots: Number of slots to allocate
   101	 * @gfp: The allocation constraints.
   102	 * @for_writeback: True if allocating for writeback
   103	 *
   104	 * Allocate a chain of bvecq nodes providing at least the requested cumulative
   105	 * number of slots.  Each node is a maximum of 4KiB in size.
   106	 *
   107	 * Return: The first node pointer or NULL on allocation failure.
   108	 */
   109	struct bvecq *bvecq_alloc_chain(size_t nr_slots, gfp_t gfp, bool for_writeback)
   110	{
   111		struct bvecq *head = NULL, *tail = NULL;
   112	
   113		_enter("%zu", nr_slots);
   114	
   115		for (;;) {
   116			struct bvecq *bq;
   117	
   118			bq = bvecq_alloc_one(min(nr_slots, BVECQ_4KB_SLOTS), gfp, for_writeback);
   119			if (!bq)
   120				goto oom;
   121	
   122			if (tail)
   123				bvecq_append(tail, bq);
   124			else
   125				head = bq;
   126			tail = bq;
   127			if (tail->max_slots >= nr_slots)
   128				break;
   129			nr_slots -= tail->max_slots;
   130		}
   131	
   132		return head;
   133	oom:
   134		bvecq_put(head);
   135		return NULL;
   136	}
   137	EXPORT_SYMBOL(bvecq_alloc_chain);
   138	
   139	/**
   140	 * bvecq_alloc_buffer2 - Allocate a bvecq chain and populate with buffers
   141	 * @size: Target size of the buffer (can be 0 for an empty buffer)
   142	 * @pre_slots: Number of preamble slots to set aside
   143	 * @gfp: The allocation constraints.
   144	 * @for_writeback: True if allocating for writeback
   145	 *
   146	 * Allocate a chain of bvecq nodes and populate the slots with sufficient pages
   147	 * to provide at least the requested amount of space, leaving the first
   148	 * @pre_slots slots unset.  The pre-slots must all fit into the the first
   149	 * bvecq.
   150	 *
   151	 * The pages allocated may be compound pages larger than PAGE_SIZE and thus
   152	 * occupy fewer slots.  The pages have their refcounts set to 1 and can be
   153	 * passed to MSG_SPLICE_PAGES.
   154	 *
   155	 * Return: The first node pointer or NULL on allocation failure.
   156	 */
   157	struct bvecq *bvecq_alloc_buffer2(size_t size, unsigned int pre_slots, gfp_t gfp,
   158					  bool for_writeback)
   159	{
   160		struct bvecq *head = NULL, *p = NULL;
   161		size_t nr_per_bq = BVECQ_POOL_SLOTS;
   162		size_t count = pre_slots + DIV_ROUND_UP(size, PAGE_SIZE);
   163	
   164		_enter("%zx,%zx,%u", size, count, pre_slots);
   165	
   166		if (WARN_ON_ONCE(pre_slots > nr_per_bq))
   167			return NULL;
   168	
   169		head = bvecq_alloc_chain(count, gfp, for_writeback);
   170		if (!head)
   171			return NULL;
   172	
   173		p = head;
   174		do {
   175			struct page **pages;
   176			size_t unused, want, got, slot;
   177	
   178			if (!count)
   179				break;
   180			if (WARN_ON_ONCE(!p))
   181				goto oom;
   182	
   183			if (p->nr_slots == 0) {
   184				/* Need to clear pre slots and pages[], so just clear all. */
   185				memset(p->bv, 0, p->max_slots * sizeof(p->bv[0]));
   186				p->mem_type = BVECQ_MEM_ALLOCED;
   187				p->nr_slots = pre_slots;
   188				count -= pre_slots;
   189				pre_slots = 0;
   190				if (!count)
   191					break;
   192			}
   193	
   194			if (p->nr_slots >= p->max_slots) {
   195				p = p->next;
   196				continue;
   197			}
   198			unused = p->max_slots - p->nr_slots;
   199	
   200			pages = (struct page **)&p->bv[p->max_slots];
   201			pages -= unused;
   202	
   203			want = min(count, unused);
   204			got = alloc_pages_bulk(gfp, want, pages);
   205			if (!got)
   206				goto oom;
   207	
   208			slot = p->nr_slots;
   209			for (int i = 0; i < got; i++)
   210				bvec_set_page(&p->bv[slot++], pages[i], PAGE_SIZE, 0);
   211	
   212			bvecq_filled_to(p, slot);
   213			count -= got;
   214		} while (count > 0);
   215	
   216		return head;
   217	oom:
   218		bvecq_put(head);
   219		return NULL;
   220	}
   221	EXPORT_SYMBOL(bvecq_alloc_buffer2);
   222	
   223	/*
   224	 * Free the page pointed to by a slot as necessary.
   225	 */
   226	static void bvecq_free_slot(struct bvecq *bq, unsigned int slot)
   227	{
   228		struct page *page = bq->bv[slot].bv_page;
   229	
   230		if (!page)
   231			return;
   232	
   233		switch (bq->mem_type) {
   234		case BVECQ_MEM_EXTERNAL:
   235			break;
   236		case BVECQ_MEM_PAGECACHE:
   237			put_page(page);
   238			break;
   239		case BVECQ_MEM_GUP:
   240			unpin_user_page(page);
   241			break;
   242		case BVECQ_MEM_ALLOCED:
   243			__free_pages(page, compound_order(page));
   244			break;
   245		default:
   246			WARN_ON_ONCE(1);
   247			break;
   248		}
   249	}
   250	
   251	/**
   252	 * bvecq_put - Put a ref on a bvec queue
   253	 * @bq: The start of the folio queue to free
   254	 *
   255	 * Put the ref(s) on the nodes in a bvec queue, freeing up the node and the
   256	 * page fragments it points to as the refcounts become zero.
   257	 */
   258	void bvecq_put(struct bvecq *bq)
   259	{
   260		struct bvecq *next;
   261	
   262		for (; bq; bq = next) {
   263			if (!refcount_dec_and_test(&bq->ref))
   264				break;
   265			for (int slot = 0; slot < bq->nr_slots; slot++)
   266				bvecq_free_slot(bq, slot);
   267			next = bq->next;
   268			netfs_stat_d(&netfs_n_bvecq);
   269			if (bq->from_pool)
 > 270				mempool_free(bq, &netfs_bvecq_pool);
   271			else
   272				kfree(bq);
   273		}
   274	}
   275	EXPORT_SYMBOL(bvecq_put);
   276	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
