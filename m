Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5102A52
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 04:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694752719; x=1726288719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w5Iskgiuj4Gdw0ApMdnhfAX6dRYQie0bADuFFRgRp5U=;
  b=GUjwCp1GCwD7im6cQLSvW/KXKQSM+6hhxnzK0gGu0dav9uOCoU567deG
   pk6KuRPX/DkrlWvd/1fo0nOt2nIuus70CwUrQlbftI88DmDp9jrTbgUMh
   DOqnanmakBsuOxKXUn9Yn1TsQKTLo9Ye6Xf27C6cC83wl11OIZTWMCX57
   EvuKQgHPt79hz9TEf6Ay7t9A3pr+erd+rrxdEgV2PwLdjWonmHJzCUk8I
   iHWwngJ5YL4MrDbBzrMpWoDlWH1VU7CQ4+4Oz+F/V+dtRquZVMYddPT0V
   xZhtl3+8D4QqWAQxr2NQu6RcMlGXUwXhkriK65r3rV1lrLUt3PAIZZNzo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="443218053"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="443218053"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 21:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="1075659774"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="1075659774"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Sep 2023 21:33:36 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh0WK-0002R5-17;
	Fri, 15 Sep 2023 04:33:32 +0000
Date: Fri, 15 Sep 2023 12:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Thornber <ejt@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dm-devel@redhat.com,
	Mike Snitzer <snitzer@kernel.org>
Subject: [device-mapper-dm:for-next 2/4]
 drivers/md/persistent-data/dm-extent-allocator.c:88: warning: Function
 parameter or member 'n' not described in '__free_node'
Message-ID: <202309151251.TkVrLtEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
head:   805d736ee48c10d8770f998127887795ffb0106f
commit: 064fc5e0e09b49033693b07003c142d0be27a009 [2/4] dm persistent data: Introduce extent allocator
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230915/202309151251.TkVrLtEd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151251.TkVrLtEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309151251.TkVrLtEd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/persistent-data/dm-extent-allocator.c:88: warning: Function parameter or member 'n' not described in '__free_node'
>> drivers/md/persistent-data/dm-extent-allocator.c:88: warning: Excess function parameter 'node' description in '__free_node'
>> drivers/md/persistent-data/dm-extent-allocator.c:111: warning: Cannot understand  * @ea: Pointer to the extent allocator.
    on line 111 - I thought it was a doc line
>> drivers/md/persistent-data/dm-extent-allocator.c:217: warning: Function parameter or member 'flags' not described in '__prealloc_nodes'
>> drivers/md/persistent-data/dm-extent-allocator.c:313: warning: Function parameter or member 'n' not described in '__split_leaf'
>> drivers/md/persistent-data/dm-extent-allocator.c:313: warning: Excess function parameter 'node' description in '__split_leaf'


vim +88 drivers/md/persistent-data/dm-extent-allocator.c

    81	
    82	/**
    83	 * __free_node - Frees a node in the extent allocator.
    84	 * @ea: Pointer to the extent allocator.
    85	 * @node: Node to free.
    86	 */
    87	static inline void __free_node(struct dm_extent_allocator *ea, struct node *n)
  > 88	{
    89		struct list_head *l = (struct list_head *)n;
    90	
    91		list_add(l, &ea->free_nodes);
    92		ea->nr_free_nodes++;
    93	}
    94	
    95	/**
    96	 * __alloc_node - Allocates a node from the extent allocator.
    97	 * @ea: Pointer to the extent allocator.
    98	 */
    99	static inline struct node *__alloc_node(struct dm_extent_allocator *ea)
   100	{
   101		struct list_head *l;
   102	
   103		l = ea->free_nodes.next;
   104		list_del(l);
   105		ea->nr_free_nodes--;
   106	
   107		return (struct node *) l;
   108	}
   109	
   110	/**
 > 111	 * @ea: Pointer to the extent allocator.
   112	 * @node: Index of the node to query.
   113	 *
   114	 * Returns: The number of free blocks in the node.
   115	 */
   116	static inline uint64_t __nr_free_blocks(struct node *n)
   117	{
   118		if (!n)
   119			return 0;
   120	
   121		if (n->is_leaf)
   122			return n->end - n->begin;
   123		else
   124			return n->u.internal.nr_free;
   125	}
   126	
   127	/**
   128	 * __free_tree - Frees all nodes in a tree.
   129	 * @ea: Pointer to the extent allocator.
   130	 * @n: Pointer to the root node of the tree to free.
   131	 */
   132	static void __free_tree(struct dm_extent_allocator *ea, struct node *n)
   133	{
   134		if (!n)
   135			return;
   136	
   137		if (n->is_leaf)
   138			__free_node(ea, n);
   139		else {
   140			__free_tree(ea, n->u.internal.left);
   141			__free_tree(ea, n->u.internal.right);
   142		}
   143	}
   144	
   145	/**
   146	 * __setup_initial_root - Sets up the initial root node for the extent allocator.
   147	 * @ea: Pointer to the extent allocator.
   148	 *
   149	 * The root node is a leaf node that spans the entire device.
   150	 */
   151	static void __setup_initial_root(struct dm_extent_allocator *ea)
   152	{
   153		struct node *n;
   154		struct leaf *l;
   155	
   156		n = ea->root = __alloc_node(ea);
   157		n->is_left_child = true;
   158		n->is_leaf = true;
   159		n->nr_holders = 0;
   160		n->begin = 0;
   161		n->end = ea->nr_blocks;
   162		n->parent = NULL;
   163	
   164		l = &n->u.leaf;
   165		INIT_LIST_HEAD(&l->holders);
   166	}
   167	
   168	/**
   169	 * free_node_list - Frees a list of nodes.
   170	 * @l: Pointer to the list head of the nodes to free.
   171	 */
   172	static void free_node_list(struct list_head *l)
   173	{
   174		struct list_head *e, *tmp;
   175	
   176		list_for_each_safe(e, tmp, l) {
   177			list_del(e);
   178			kfree(e);
   179		}
   180	}
   181	
   182	/**
   183	 * alloc_node_list - Allocates a list of nodes.
   184	 * @nr: Number of nodes to allocate.
   185	 * @flags: Flags to pass to kmalloc.
   186	 * @result: Pointer to the list head to store the allocated nodes.
   187	 *
   188	 * Used to initialise the free list of nodes.
   189	 * Returns: 0 on success, or -ENOMEM if allocation failed.
   190	 */
   191	static int alloc_node_list(unsigned nr, int flags, struct list_head *result)
   192	{
   193		int i;
   194	
   195		INIT_LIST_HEAD(result);
   196	
   197		for (i = 0; i < nr; i++) {
   198			struct node *n = kmalloc(sizeof(*n), flags);
   199			struct list_head *l = (struct list_head *) n;
   200			if (!n) {
   201				free_node_list(result);
   202				return -ENOMEM;
   203			}
   204	
   205			list_add(l, result);
   206		}
   207	
   208		return 0;
   209	}
   210	
   211	/**
   212	 * __prealloc_nodes - Preallocates nodes for allocation contexts.
   213	 * @ea: Pointer to the extent allocator.
   214	 * @nr: Number of nodes to preallocate.
   215	 */
   216	static void __prealloc_nodes(struct dm_extent_allocator *ea, unsigned nr, int flags)
 > 217	{
   218		int r;
   219		struct list_head new_nodes;
   220	
   221		r = alloc_node_list(nr, flags, &new_nodes);
   222		if (!r) {
   223			struct list_head *e, *tmp;
   224			list_for_each_safe(e, tmp, &new_nodes) {
   225				list_del(e);
   226				__free_node(ea, (struct node *)e);
   227			}
   228			ea->nr_preallocated_nodes += nr;
   229		}
   230	}
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
