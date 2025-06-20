Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F7228A1FC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425623; cv=none; b=Gip/1wsiY+Nu/V/FfZA4ozkrCQ/8OwZu0uz2RsL6FdsD43/j5ickVh2GjJzy9TtrVHDtjiCcjB3zT1kQarW/zEZvztX6b+m+94EXsTrNKP0ZsUnka78AD9gYGpE99ET/4+wjHTDc4TrZIgKkdXW1XHj4OtaMyrxh2MAJtQvHqZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425623; c=relaxed/simple;
	bh=1yxkkhY1dumooVcojFKsqWK8YltM+lDGeYphh1FNf8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pvitqncgGRMeLF8t1zAJb5+iGYQz74K64Dq34doXeS5JSfNCPe7YDVtNxn32RzoGG9k17o2DkBKiuzk4Wr7n/UDuCEpJkeOOGpGktsI9Dca77xzVZSupqZOdYW5qvnxK0WV6x53/xF6rfXrmao3ks3IHED/Y1lBUJthc4hbOKy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1JcYRiQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1JcYRiQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750425622; x=1781961622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1yxkkhY1dumooVcojFKsqWK8YltM+lDGeYphh1FNf8A=;
  b=j1JcYRiQGoUGOlD22j4HJfptjsheIF7HiboExu12TDtH9Bw8IUmXsMgu
   gqzo1jgH3neErrWDUYInSsIlQnBeVwXC8aYkl301uY13+eeIrcfrHcNcz
   BQLoqpycsrSdW5Ew9dQktV4P6zU3SvFgXx40jyPyV59ANTUmHKVEwog7b
   3YQHr4FtTKNRWwBoVPaO1kz0Vq+R5UAJCNRJl+ldDfkI2vgdPGBNMexSZ
   VkMYrMr1wVz5VJ3sEn6GXX7+7Jni29N2R9IyfAI7CgFpZBe8snw7tS7Mi
   EByim8SKabvvj0AjXkSrmtQtp4cCt4Kq/giqlaIxaO3oQmbUB0r92XoyS
   A==;
X-CSE-ConnectionGUID: elnCLg32QlakKUIdU1zdIQ==
X-CSE-MsgGUID: YhwzDJu8T7eqXPgaTUMCmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="78095456"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="78095456"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 06:20:21 -0700
X-CSE-ConnectionGUID: 5E/Ted0iQGqnkH6EnrUSeQ==
X-CSE-MsgGUID: pGYkVvVPQOiz0W1yjkidxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="150337303"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Jun 2025 06:20:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSbfE-000Ln5-21;
	Fri, 20 Jun 2025 13:20:16 +0000
Date: Fri, 20 Jun 2025 21:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Vlastimil Babka <vbabka@suse.cz>
Subject: [akpm-mm:mm-new 59/87] mm/slub.c:6168:23: error: invalid use of
 undefined type 'struct node_notify'
Message-ID: <202506202144.dGkFxasv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   647b5532fd070b0a20f01c5bad726fac7f490a53
commit: d0b0b62aa0d6d93098331467596c34b252bfad11 [59/87] mm,slub: use node-notifier instead of memory-notifier
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250620/202506202144.dGkFxasv-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506202144.dGkFxasv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506202144.dGkFxasv-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'slab_mem_going_online_callback':
>> mm/slub.c:6168:23: error: invalid use of undefined type 'struct node_notify'
    6168 |         int nid = narg->nid;
         |                       ^~
   mm/slub.c: In function 'slab_memory_callback':
>> mm/slub.c:6220:14: error: 'NODE_ADDING_FIRST_MEMORY' undeclared (first use in this function)
    6220 |         case NODE_ADDING_FIRST_MEMORY:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:6220:14: note: each undeclared identifier is reported only once for each function it appears in
>> mm/slub.c:6223:14: error: 'NODE_REMOVING_LAST_MEMORY' undeclared (first use in this function)
    6223 |         case NODE_REMOVING_LAST_MEMORY:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c: In function 'kmem_cache_init':
>> mm/slub.c:6300:9: error: implicit declaration of function 'hotplug_node_notifier'; did you mean 'hotplug_memory_notifier'? [-Wimplicit-function-declaration]
    6300 |         hotplug_node_notifier(slab_memory_callback, SLAB_CALLBACK_PRI);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         hotplug_memory_notifier


vim +6168 mm/slub.c

  6162	
  6163	static int slab_mem_going_online_callback(void *arg)
  6164	{
  6165		struct kmem_cache_node *n;
  6166		struct kmem_cache *s;
  6167		struct node_notify *narg = arg;
> 6168		int nid = narg->nid;
  6169		int ret = 0;
  6170	
  6171		/*
  6172		 * If the node's memory is already available, then kmem_cache_node is
  6173		 * already created. Nothing to do.
  6174		 */
  6175		if (nid < 0)
  6176			return 0;
  6177	
  6178		/*
  6179		 * We are bringing a node online. No memory is available yet. We must
  6180		 * allocate a kmem_cache_node structure in order to bring the node
  6181		 * online.
  6182		 */
  6183		mutex_lock(&slab_mutex);
  6184		list_for_each_entry(s, &slab_caches, list) {
  6185			/*
  6186			 * The structure may already exist if the node was previously
  6187			 * onlined and offlined.
  6188			 */
  6189			if (get_node(s, nid))
  6190				continue;
  6191			/*
  6192			 * XXX: kmem_cache_alloc_node will fallback to other nodes
  6193			 *      since memory is not yet available from the node that
  6194			 *      is brought up.
  6195			 */
  6196			n = kmem_cache_alloc(kmem_cache_node, GFP_KERNEL);
  6197			if (!n) {
  6198				ret = -ENOMEM;
  6199				goto out;
  6200			}
  6201			init_kmem_cache_node(n);
  6202			s->node[nid] = n;
  6203		}
  6204		/*
  6205		 * Any cache created after this point will also have kmem_cache_node
  6206		 * initialized for the new node.
  6207		 */
  6208		node_set(nid, slab_nodes);
  6209	out:
  6210		mutex_unlock(&slab_mutex);
  6211		return ret;
  6212	}
  6213	
  6214	static int slab_memory_callback(struct notifier_block *self,
  6215					unsigned long action, void *arg)
  6216	{
  6217		int ret = 0;
  6218	
  6219		switch (action) {
> 6220		case NODE_ADDING_FIRST_MEMORY:
  6221			ret = slab_mem_going_online_callback(arg);
  6222			break;
> 6223		case NODE_REMOVING_LAST_MEMORY:
  6224			ret = slab_mem_going_offline_callback(arg);
  6225			break;
  6226		}
  6227		if (ret)
  6228			ret = notifier_from_errno(ret);
  6229		else
  6230			ret = NOTIFY_OK;
  6231		return ret;
  6232	}
  6233	
  6234	/********************************************************************
  6235	 *			Basic setup of slabs
  6236	 *******************************************************************/
  6237	
  6238	/*
  6239	 * Used for early kmem_cache structures that were allocated using
  6240	 * the page allocator. Allocate them properly then fix up the pointers
  6241	 * that may be pointing to the wrong kmem_cache structure.
  6242	 */
  6243	
  6244	static struct kmem_cache * __init bootstrap(struct kmem_cache *static_cache)
  6245	{
  6246		int node;
  6247		struct kmem_cache *s = kmem_cache_zalloc(kmem_cache, GFP_NOWAIT);
  6248		struct kmem_cache_node *n;
  6249	
  6250		memcpy(s, static_cache, kmem_cache->object_size);
  6251	
  6252		/*
  6253		 * This runs very early, and only the boot processor is supposed to be
  6254		 * up.  Even if it weren't true, IRQs are not up so we couldn't fire
  6255		 * IPIs around.
  6256		 */
  6257		__flush_cpu_slab(s, smp_processor_id());
  6258		for_each_kmem_cache_node(s, node, n) {
  6259			struct slab *p;
  6260	
  6261			list_for_each_entry(p, &n->partial, slab_list)
  6262				p->slab_cache = s;
  6263	
  6264	#ifdef CONFIG_SLUB_DEBUG
  6265			list_for_each_entry(p, &n->full, slab_list)
  6266				p->slab_cache = s;
  6267	#endif
  6268		}
  6269		list_add(&s->list, &slab_caches);
  6270		return s;
  6271	}
  6272	
  6273	void __init kmem_cache_init(void)
  6274	{
  6275		static __initdata struct kmem_cache boot_kmem_cache,
  6276			boot_kmem_cache_node;
  6277		int node;
  6278	
  6279		if (debug_guardpage_minorder())
  6280			slub_max_order = 0;
  6281	
  6282		/* Print slub debugging pointers without hashing */
  6283		if (__slub_debug_enabled())
  6284			no_hash_pointers_enable(NULL);
  6285	
  6286		kmem_cache_node = &boot_kmem_cache_node;
  6287		kmem_cache = &boot_kmem_cache;
  6288	
  6289		/*
  6290		 * Initialize the nodemask for which we will allocate per node
  6291		 * structures. Here we don't need taking slab_mutex yet.
  6292		 */
  6293		for_each_node_state(node, N_MEMORY)
  6294			node_set(node, slab_nodes);
  6295	
  6296		create_boot_cache(kmem_cache_node, "kmem_cache_node",
  6297				sizeof(struct kmem_cache_node),
  6298				SLAB_HWCACHE_ALIGN | SLAB_NO_OBJ_EXT, 0, 0);
  6299	
> 6300		hotplug_node_notifier(slab_memory_callback, SLAB_CALLBACK_PRI);
  6301	
  6302		/* Able to allocate the per node structures */
  6303		slab_state = PARTIAL;
  6304	
  6305		create_boot_cache(kmem_cache, "kmem_cache",
  6306				offsetof(struct kmem_cache, node) +
  6307					nr_node_ids * sizeof(struct kmem_cache_node *),
  6308				SLAB_HWCACHE_ALIGN | SLAB_NO_OBJ_EXT, 0, 0);
  6309	
  6310		kmem_cache = bootstrap(&boot_kmem_cache);
  6311		kmem_cache_node = bootstrap(&boot_kmem_cache_node);
  6312	
  6313		/* Now we can use the kmem_cache to allocate kmalloc slabs */
  6314		setup_kmalloc_cache_index_table();
  6315		create_kmalloc_caches();
  6316	
  6317		/* Setup random freelists for each cache */
  6318		init_freelist_randomization();
  6319	
  6320		cpuhp_setup_state_nocalls(CPUHP_SLUB_DEAD, "slub:dead", NULL,
  6321					  slub_cpu_dead);
  6322	
  6323		pr_info("SLUB: HWalign=%d, Order=%u-%u, MinObjects=%u, CPUs=%u, Nodes=%u\n",
  6324			cache_line_size(),
  6325			slub_min_order, slub_max_order, slub_min_objects,
  6326			nr_cpu_ids, nr_node_ids);
  6327	}
  6328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
