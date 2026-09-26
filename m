Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE8E383323
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 17:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790445574; cv=none; b=NI2KMIRo8ICpobOko/NFVSO3LFyJtcknx8aeWdCQJCwAnLuMdRgJw/AbsuAkW+lO2bwE1nRIkeGGMt+paPySi0r8NPxONPTqP1M9cHhA1Wmaf46qxArcKfDHorU1xh/Vi+cIo84qxZpMuSDdouLgzCmaRqlB2jANkkVDFt71Yag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790445574; c=relaxed/simple;
	bh=JnbQibAaYwfiVYWxLHm4d1jkAHpKfKYErcYMQL53NH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iRnHVP4ar2wT9cA+/Z4k9tCaq3CFywBjkg4Sg4OpP2WT4kB4WvJhkAdIbXPF3cV0Xel16SXnfzfvbcJBIVCf/Wnw4YfRnUzDQLJNshVhkym08U5xJWmCEOds70isp2YISpcmN+aXDIF3FPZSYuHIFN9HeOcQebEBQnwyoU+dmQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5R+cEpT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5R+cEpT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790445573; x=1821981573;
  h=date:from:to:cc:subject:message-id;
  bh=JnbQibAaYwfiVYWxLHm4d1jkAHpKfKYErcYMQL53NH0=;
  b=f5R+cEpTSNpLGQTzlGs79xM9L6xANkzMWPljISQKsDXQ7zg0IFDjy7DC
   h8mRg6YlxRwwtp1QKvVDuv89U8KHAgrKyYt9SHlTrpW9hCfL+b+irREDJ
   4HvxNlKxhSXV4VNkYUzrvPAQ0R5ySg2Y7FvWJ26XXgfRAbi1WVbpPYwEd
   vY4y4PjkIc7kLBl19ov7YzKH6LGxLmaWBY3JdasqwejETnEybgFpwefO9
   MAPjDwSQClWE3fVzo0Nn56c82F4mcGxYNuOv+0qbSoPluXjSzDZOGtXli
   baQYBftlV8dwXEC8u+MYOnjXN6x2LbB5HtQs+Zo9NsIhOa2/HkIhiiOjJ
   g==;
X-CSE-ConnectionGUID: rTSFJTS5Q+WMrt0f31lY0A==
X-CSE-MsgGUID: u0hDLwJRSV6NeVSaNnwXRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="101728181"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="101728181"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 10:59:31 -0700
X-CSE-ConnectionGUID: VLrCvYANQ+W9DNrMATfTSw==
X-CSE-MsgGUID: WUrEC0c2SjKji58Q6u8Prw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="273246127"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Sep 2026 10:59:30 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAWgJ-00000000M5F-1exq;
	Sat, 26 Sep 2026 17:59:27 +0000
Date: Sun, 27 Sep 2026 01:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next-3 13/26] fs/netfs/bvecq.c:79:22:
 error: implicit declaration of function 'mempool_alloc_noreserve'
Message-ID: <202609270101.Fe684goD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-3
head:   65d1ffcb408ea16b3a4a497269da871c62b7faa3
commit: 217cce19dbecd925c96842bf3b15c0b45e19a930 [13/26] netfs: Add some tools for managing bvecq chains
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260927/202609270101.Fe684goD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270101.Fe684goD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270101.Fe684goD-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/bvecq.c: In function 'bvecq_alloc_one':
>> fs/netfs/bvecq.c:79:22: error: implicit declaration of function 'mempool_alloc_noreserve' [-Wimplicit-function-declaration]
      79 |                 bq = mempool_alloc_noreserve(&netfs_bvecq_pool, gfp);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/bvecq.c:79:20: error: assignment to 'struct bvecq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      79 |                 bq = mempool_alloc_noreserve(&netfs_bvecq_pool, gfp);
         |                    ^
   fs/netfs/bvecq.c: In function 'bvecq_put':
>> fs/netfs/bvecq.c:277:25: error: implicit declaration of function 'mempool_free' [-Wimplicit-function-declaration]
     277 |                         mempool_free(bq, &netfs_bvecq_pool);
         |                         ^~~~~~~~~~~~


vim +/mempool_alloc_noreserve +79 fs/netfs/bvecq.c

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
  > 79			bq = mempool_alloc_noreserve(&netfs_bvecq_pool, gfp);
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
   214			for (int i = 0; i < got; i++) {
   215				set_page_count(pages[i], 1);
   216				bvec_set_page(&p->bv[slot++], pages[i], PAGE_SIZE, 0);
   217			}
   218	
   219			bvecq_filled_to(p, slot);
   220			count -= got;
   221		} while (count > 0);
   222	
   223		return head;
   224	oom:
   225		bvecq_put(head);
   226		return NULL;
   227	}
   228	EXPORT_SYMBOL(bvecq_alloc_buffer2);
   229	
   230	/*
   231	 * Free the page pointed to by a slot as necessary.
   232	 */
   233	static void bvecq_free_slot(struct bvecq *bq, unsigned int slot)
   234	{
   235		struct page *page = bq->bv[slot].bv_page;
   236	
   237		if (!page)
   238			return;
   239	
   240		switch (bq->mem_type) {
   241		case BVECQ_MEM_EXTERNAL:
   242			break;
   243		case BVECQ_MEM_PAGECACHE:
   244			put_page(page);
   245			break;
   246		case BVECQ_MEM_GUP:
   247			unpin_user_page(page);
   248			break;
   249		case BVECQ_MEM_ALLOCED:
   250			__free_pages(page, compound_order(page));
   251			break;
   252		default:
   253			WARN_ON_ONCE(1);
   254			break;
   255		}
   256	}
   257	
   258	/**
   259	 * bvecq_put - Put a ref on a bvec queue
   260	 * @bq: The start of the folio queue to free
   261	 *
   262	 * Put the ref(s) on the nodes in a bvec queue, freeing up the node and the
   263	 * page fragments it points to as the refcounts become zero.
   264	 */
   265	void bvecq_put(struct bvecq *bq)
   266	{
   267		struct bvecq *next;
   268	
   269		for (; bq; bq = next) {
   270			if (!refcount_dec_and_test(&bq->ref))
   271				break;
   272			for (int slot = 0; slot < bq->nr_slots; slot++)
   273				bvecq_free_slot(bq, slot);
   274			next = bq->next;
   275			netfs_stat_d(&netfs_n_bvecq);
   276			if (bq->from_pool)
 > 277				mempool_free(bq, &netfs_bvecq_pool);
   278			else
   279				kfree(bq);
   280		}
   281	}
   282	EXPORT_SYMBOL(bvecq_put);
   283	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
