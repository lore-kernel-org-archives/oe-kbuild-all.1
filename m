Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC313DDDA0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 05:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786599017; cv=none; b=ZMardhsN2tpzhiUeXOLs47CKJUm/LxNU4Wgj8nwvtbzVTMsiGNmi7n5OGlZ/u1csjOXRBQxBSt7xXYOQ4hGGXkwNJLt2aCHxDfPHNUDVJBjHwMKkQKW3ZXDZ4SW9aEqftHjwuoCkPK3n5eA1gwcucC1HWGE2nWy/wSO430XZl4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786599017; c=relaxed/simple;
	bh=QGoSrfEYPTVNMNFJ7SOXBHkSepVBUUxl0tTTB2goZw8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X6oATkoM6sp3edP6FU/Ddfr1tr0g9Z8yRhTz238GnACVjWMauztMF0wf7M2xRX9cVwlpuCCfmsfwNtPaWekz1vi+T72BIZa5fmfPDGD3EIKveoOpn2DN2difwEmriCM7InCgKQJ6F5SY24h7v7+AbRARmUIKK/yHmtjdkNU1Ztc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2LJqReG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2LJqReG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786599013; x=1818135013;
  h=date:from:to:cc:subject:message-id;
  bh=QGoSrfEYPTVNMNFJ7SOXBHkSepVBUUxl0tTTB2goZw8=;
  b=g2LJqReGM9QeXcHr2l0xbSySxAndsOnwNS9x+zwCJQqLksEdsKSzIdCZ
   lU/28CvI4DLvL/03UzMpGx4TdMuOV7exjp+lXkGp83ybzIpg6fNL9lvF9
   fT46GZ+YD3KG2GMsW2LYqDxhknAglDpFGDYUB3fH8ln6c7yPpBHexxtZG
   4yJQtX+yT8H6qbG67gv7wSzkHJ7FtiWthxmlgwIEatm2u7IQRPK5+HjwE
   KoXR0aRDOu5rKoPrKdeCEj1EKsocDfgdaEpGHGm+6rFR1qjBjMpmSJAgM
   +SFGcHwKxOPLKrmEaGOh1vx7TCOPQGrpwfWPrS0PoVFoMwDdjIPcnzm56
   Q==;
X-CSE-ConnectionGUID: cDZsili/SrqMGeqO7yJrfw==
X-CSE-MsgGUID: v2jQVzbzRae/NvretDplaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86284444"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="86284444"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 22:30:08 -0700
X-CSE-ConnectionGUID: e8UHNG1jTTKMUT72Re8qrA==
X-CSE-MsgGUID: NAeTB6S3QXaQFIEyf4UcWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="260549575"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2026 22:30:06 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuO0y-00000000Svi-06pI;
	Thu, 13 Aug 2026 05:30:04 +0000
Date: Thu, 13 Aug 2026 13:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 8/26] fs/netfs/bvecq.c:77:8: error:
 call to undeclared function 'mempool_alloc'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202608131352.jwqz8U0a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   a220dcb80a5e634e3ab906edfe8eb2c86c389663
commit: e9662089ae850a40b2583805f60a54d970c27d5f [8/26] netfs: Make mempool available for bvecq
config: i386-randconfig-051-20260812 (https://download.01.org/0day-ci/archive/20260813/202608131352.jwqz8U0a-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131352.jwqz8U0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131352.jwqz8U0a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/bvecq.c:77:8: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      77 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                      ^
>> fs/netfs/bvecq.c:77:6: error: incompatible integer to pointer conversion assigning to 'struct bvecq *' from 'int' [-Wint-conversion]
      77 |                 bq = mempool_alloc(&netfs_bvecq_pool, gfp);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/bvecq.c:275:4: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     275 |                         mempool_free(bq, &netfs_bvecq_pool);
         |                         ^
   3 errors generated.


vim +/mempool_alloc +77 fs/netfs/bvecq.c

    40	
    41	/**
    42	 * bvecq_alloc_one - Allocate a single bvecq node with unpopulated slots
    43	 * @nr_slots: Number of slots to allocate
    44	 * @gfp: The allocation constraints.
    45	 * @for_writeback: True if allocating for writeback
    46	 *
    47	 * Allocate a single bvecq node and initialise the header.  A number of inline
    48	 * slots are also allocated, rounded up to fit after the header in a power-of-2
    49	 * slab object of up to 512 bytes (up to 29 slots on a 64-bit cpu).  The caller
    50	 * should be aware that the number of slots allocated may be more or less than
    51	 * the number requested.  The slot array is not initialised.
    52	 *
    53	 * Return: The node pointer or NULL on allocation failure.
    54	 */
    55	struct bvecq *bvecq_alloc_one(size_t nr_slots, gfp_t gfp, bool for_writeback)
    56	{
    57		struct bvecq *bq;
    58		const size_t max_size = 512;
    59		const size_t max_slots = (max_size - sizeof(*bq)) / sizeof(bq->__bv[0]);
    60		size_t part = umin(nr_slots, max_slots);
    61		size_t size = roundup_pow_of_two(struct_size(bq, __bv, part));
    62		bool from_pool = false;
    63	
    64		gfp &= ~GFP_ZONEMASK;
    65	
    66		if (for_writeback) {
    67			if (size != BVECQ_STD_SIZE) {
    68				gfp_t gfp_temp = gfp;
    69	
    70				gfp_temp |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN;
    71				gfp_temp &= ~(__GFP_DIRECT_RECLAIM | __GFP_IO);
    72				bq = kmalloc(size, gfp_temp);
    73				if (bq)
    74					goto success;
    75			}
    76	
  > 77			bq = mempool_alloc(&netfs_bvecq_pool, gfp);
    78			if (!bq)
    79				return bq;
    80			from_pool = true;
    81			size = BVECQ_STD_SIZE;
    82		} else {
    83			bq = kmalloc(size, gfp);
    84			if (!bq)
    85				return bq;
    86		}
    87	
    88	success:
    89		*bq = (struct bvecq) {
    90			.ref		= REFCOUNT_INIT(1),
    91			.bv		= bq->__bv,
    92			.inline_bv	= true,
    93			.max_slots	= (size - sizeof(*bq)) / sizeof(bq->__bv[0]),
    94			.from_pool	= from_pool,
    95		};
    96		netfs_stat(&netfs_n_bvecq);
    97		return bq;
    98	}
    99	EXPORT_SYMBOL(bvecq_alloc_one);
   100	
   101	/**
   102	 * bvecq_alloc_chain - Allocate an unpopulated bvecq chain
   103	 * @nr_slots: Number of slots to allocate
   104	 * @gfp: The allocation constraints.
   105	 * @for_writeback: True if allocating for writeback
   106	 *
   107	 * Allocate a chain of bvecq nodes providing at least the requested cumulative
   108	 * number of slots.
   109	 *
   110	 * Return: The first node pointer or NULL on allocation failure.
   111	 */
   112	struct bvecq *bvecq_alloc_chain(size_t nr_slots, gfp_t gfp, bool for_writeback)
   113	{
   114		struct bvecq *head = NULL, *tail = NULL;
   115	
   116		_enter("%zu", nr_slots);
   117	
   118		for (;;) {
   119			struct bvecq *bq;
   120	
   121			bq = bvecq_alloc_one(nr_slots, gfp, for_writeback);
   122			if (!bq)
   123				goto oom;
   124	
   125			if (tail)
   126				bvecq_append(tail, bq);
   127			else
   128				head = bq;
   129			tail = bq;
   130			if (tail->max_slots >= nr_slots)
   131				break;
   132			nr_slots -= tail->max_slots;
   133		}
   134	
   135		return head;
   136	oom:
   137		bvecq_put(head);
   138		return NULL;
   139	}
   140	EXPORT_SYMBOL(bvecq_alloc_chain);
   141	
   142	/**
   143	 * bvecq_alloc_buffer2 - Allocate a bvecq chain and populate with buffers
   144	 * @size: Target size of the buffer (can be 0 for an empty buffer)
   145	 * @pre_slots: Number of preamble slots to set aside
   146	 * @gfp: The allocation constraints.
   147	 * @for_writeback: True if allocating for writeback
   148	 *
   149	 * Allocate a chain of bvecq nodes and populate the slots with sufficient pages
   150	 * to provide at least the requested amount of space, leaving the first
   151	 * @pre_slots slots unset.  The pre-slots must all fit into the the first
   152	 * bvecq.
   153	 *
   154	 * The pages allocated may be compound pages larger than PAGE_SIZE and thus
   155	 * occupy fewer slots.  The pages have their refcounts set to 1 and can be
   156	 * passed to MSG_SPLICE_PAGES.
   157	 *
   158	 * Return: The first node pointer or NULL on allocation failure.
   159	 */
   160	struct bvecq *bvecq_alloc_buffer2(size_t size, unsigned int pre_slots, gfp_t gfp,
   161					  bool for_writeback)
   162	{
   163		struct bvecq *head = NULL, *p = NULL;
   164		size_t nr_per_bq = BVECQ_STD_SLOTS;
   165		size_t count = pre_slots + DIV_ROUND_UP(size, PAGE_SIZE);
   166	
   167		_enter("%zx,%zx,%u", size, count, pre_slots);
   168	
   169		if (WARN_ON_ONCE(pre_slots > nr_per_bq))
   170			return NULL;
   171	
   172		head = bvecq_alloc_chain(count, gfp, for_writeback);
   173		if (!head)
   174			return NULL;
   175	
   176		p = head;
   177		do {
   178			struct page **pages;
   179			size_t unused, want, got, slot;
   180	
   181			if (!count)
   182				break;
   183			if (WARN_ON_ONCE(!p))
   184				goto oom;
   185	
   186			if (p->nr_slots == 0) {
   187				/* Need to clear pre slots and pages[], so just clear all. */
   188				memset(p->bv, 0, p->max_slots * sizeof(p->bv[0]));
   189				p->mem_type = BVECQ_MEM_ALLOCED;
   190				p->nr_slots = pre_slots;
   191				count -= pre_slots;
   192				pre_slots = 0;
   193				if (!count)
   194					break;
   195			}
   196	
   197			if (p->nr_slots >= p->max_slots) {
   198				p = p->next;
   199				continue;
   200			}
   201			unused = p->max_slots - p->nr_slots;
   202	
   203			pages = (struct page **)&p->bv[p->max_slots];
   204			pages -= unused;
   205	
   206			want = min(count, unused);
   207			got = alloc_pages_bulk(gfp, want, pages);
   208			if (!got)
   209				goto oom;
   210	
   211			slot = p->nr_slots;
   212			for (int i = 0; i < got; i++) {
   213				set_page_count(pages[i], 1);
   214				bvec_set_page(&p->bv[slot++], pages[i], PAGE_SIZE, 0);
   215			}
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
