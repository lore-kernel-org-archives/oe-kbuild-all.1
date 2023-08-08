Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C68F12B6C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 14:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691506565; x=1723042565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5NxAIdVI3lDiu0ggs8jWS1+7mZ40MhyTYGECVn7ahPk=;
  b=its8CzQKETkVqzgaSGtd4WS/WoAPLXtc4bTtMjnDPBkwL+YOED0e/EkP
   w6EoFzpzpoTA2JmysNLTyMEkSAc28Mhu/pgNZeBhcUWeYo0jCKkefqlwN
   NOooEWR3HsT0G5IZ9pzTBr70quEvkwU+TbGx83Ly42/F0FOAm2Th7SLxS
   DuHSeUXCBjWzpxeBuNoV2loPgqXCKQdHowZse6pQ/jLX272DJDUrVFICK
   I5mndM5yga0Umq2n3Sww3djmUw7JajABGV03jnQdYUoauCVyBtir/mgqu
   iBFGDBcWfdsJ9hEbp5iiPsfi+u1LYI39TETTpioFj+TRV9Ota3RWrV623
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351148763"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="351148763"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 07:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681271628"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="681271628"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 07:56:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTO7u-0005PE-0x;
	Tue, 08 Aug 2023 14:56:02 +0000
Date: Tue, 8 Aug 2023 22:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slub-percpu-caches-v1 2/5] mm/slub.c:3568:26: error:
 implicit declaration of function 'alloc_from_pca'
Message-ID: <202308082248.9OaLeTUo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v1
head:   23793c9cd4b2fc31144dba68dd67554b8e4308e9
commit: 88f3fc9382220fb76fbd700a74cce623dadf8138 [2/5] mm, slub: add opt-in slub_percpu_array
config: loongarch-randconfig-r021-20230808 (https://download.01.org/0day-ci/archive/20230808/202308082248.9OaLeTUo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308082248.9OaLeTUo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308082248.9OaLeTUo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/slub.c: In function 'slab_alloc_node':
>> mm/slub.c:3568:26: error: implicit declaration of function 'alloc_from_pca' [-Werror=implicit-function-declaration]
    3568 |                 object = alloc_from_pca(s);
         |                          ^~~~~~~~~~~~~~
>> mm/slub.c:3568:24: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    3568 |                 object = alloc_from_pca(s);
         |                        ^
   cc1: some warnings being treated as errors


vim +/alloc_from_pca +3568 mm/slub.c

  3541	
  3542	/*
  3543	 * Inlined fastpath so that allocation functions (kmalloc, kmem_cache_alloc)
  3544	 * have the fastpath folded into their functions. So no function call
  3545	 * overhead for requests that can be satisfied on the fastpath.
  3546	 *
  3547	 * The fastpath works by first checking if the lockless freelist can be used.
  3548	 * If not then __slab_alloc is called for slow processing.
  3549	 *
  3550	 * Otherwise we can simply pick the next object from the lockless free list.
  3551	 */
  3552	static __fastpath_inline void *slab_alloc_node(struct kmem_cache *s, struct list_lru *lru,
  3553			gfp_t gfpflags, int node, unsigned long addr, size_t orig_size)
  3554	{
  3555		void *object;
  3556		struct obj_cgroup *objcg = NULL;
  3557		bool init = false;
  3558	
  3559		s = slab_pre_alloc_hook(s, lru, &objcg, 1, gfpflags);
  3560		if (!s)
  3561			return NULL;
  3562	
  3563		object = kfence_alloc(s, orig_size, gfpflags);
  3564		if (unlikely(object))
  3565			goto out;
  3566	
  3567		if (s->cpu_array)
> 3568			object = alloc_from_pca(s);
  3569	
  3570		if (!object)
  3571			object = __slab_alloc_node(s, gfpflags, node, addr, orig_size);
  3572	
  3573		maybe_wipe_obj_freeptr(s, object);
  3574		init = slab_want_init_on_alloc(gfpflags, s);
  3575	
  3576	out:
  3577		/*
  3578		 * When init equals 'true', like for kzalloc() family, only
  3579		 * @orig_size bytes might be zeroed instead of s->object_size
  3580		 */
  3581		slab_post_alloc_hook(s, objcg, gfpflags, 1, &object, init, orig_size);
  3582	
  3583		return object;
  3584	}
  3585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
