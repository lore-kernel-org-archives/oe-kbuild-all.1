Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE09810F4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 01:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706404693; cv=none; b=lk8G3pPmXzEI7vq6P7q4B62x/bKcqxutNujwxOVtdxE1fKYbDcHzhtTFnrg2ovd6BJb3neImZMSrUpDFJ5j47JPpPUWU9OYGFJ/eprxdHo45gtg85Y+dXnWLEgZYyxkJouQ3iQ9GD7jRGWwLbQVUCYWRW6pulEE6ZhxO4hxUB4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706404693; c=relaxed/simple;
	bh=AsMpja4UBuJ3vmNlu//6lYdcBME0cexFGKQJ+frcKuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3gVRjnIsYvYvG905yLen4gB7UPpNAtfppSa99ysW4P9fDy3tSLKdtsmrB69jgZWF4+1Rw2RAP2UdUY6QKJlHBqzcmrZXaJUPJ1Hn5uJXyL/R6tV1+EHB3zbbGVpZU5gr/R8CEYi96IjjyJmvYcwh08pYdfPDqcBpuSm9zsbYzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKLcC1M1; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKLcC1M1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706404691; x=1737940691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AsMpja4UBuJ3vmNlu//6lYdcBME0cexFGKQJ+frcKuE=;
  b=QKLcC1M1xUKTOMvZRoauHrrt++MW6tAbjyINd4qh7XBMWc/9U4yIaVvR
   DWW8bKZEgcSHgdrRWlxzfhfYP3zJ1EgTtyGqLB5OEMgVPknZ0mq0WXnd+
   eAuvWiL5ELv6BshjHtxxHeMfI9pKZJ3ljtKqTxUal6/rquA4oO5Xh6Qin
   NMU6Ea/12PiFNKoZuZ/l59a2Hn8d5Yuwk/lxB8LbV3lPYwlHYJKph1BKy
   SVqw1U8IULJ3Kv0GkdusXtDaWEFvITiMDT6ikaMjccHG+4HuzSqpMSdjC
   Xx1ajOMNr70i4d7UzB95GNFCD+CrtyxmlILnSC43D2PAQF8c39N4tKEbv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="401595042"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="401595042"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 17:18:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="821504857"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="821504857"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Jan 2024 17:18:09 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTtoF-0002wI-0H;
	Sun, 28 Jan 2024 01:18:07 +0000
Date: Sun, 28 Jan 2024 09:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:uptr_v3 4/8] kernel/bpf/arena.c:122:8: error: implicit
 declaration of function 'ptep_get' is invalid in C99
Message-ID: <202401280913.c0eArvKD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git uptr_v3
head:   4c66f0e52ab0db474cdbd5591d0569874551b2f9
commit: ed21c8550606f50c81489835db05770cc199bf16 [4/8] bpf: Introduce bpf arena.
config: arm-randconfig-r063-20240127 (https://download.01.org/0day-ci/archive/20240128/202401280913.c0eArvKD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280913.c0eArvKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280913.c0eArvKD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/bpf/arena.c:98:24: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 4295032832 to 65536 [-Wconstant-conversion]
           kern_vm = get_vm_area(KERN_VM_SZ, VM_ALLOC);
                     ~~~~~~~~~~~ ^~~~~~~~~~
   kernel/bpf/arena.c:41:33: note: expanded from macro 'KERN_VM_SZ'
   #define KERN_VM_SZ (1ull << 32) + GUARD_SZ
                      ~~~~~~~~~~~~~^~~~~~~~~~
>> kernel/bpf/arena.c:122:8: error: implicit declaration of function 'ptep_get' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           pte = ptep_get(ptep);
                 ^
>> kernel/bpf/arena.c:123:7: error: implicit declaration of function 'pte_present' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!pte_present(pte))
                ^
>> kernel/bpf/arena.c:125:9: error: implicit declaration of function 'pte_page' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           page = pte_page(pte);
                  ^
   kernel/bpf/arena.c:125:9: note: did you mean 'put_page'?
   include/linux/mm.h:1553:20: note: 'put_page' declared here
   static inline void put_page(struct page *page)
                      ^
>> kernel/bpf/arena.c:125:7: warning: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
           page = pte_page(pte);
                ^ ~~~~~~~~~~~~~
   kernel/bpf/arena.c:157:21: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 4295000064 to 32768 [-Wconstant-conversion]
                                        KERN_VM_SZ - GUARD_SZ / 2, for_each_pte, NULL);
                                        ~~~~~~~~~~~^~~~~~~~~~~~~~
>> kernel/bpf/arena.c:243:8: error: implicit declaration of function 'vmap_pages_range' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ret = vmap_pages_range(kaddr, kaddr + PAGE_SIZE, PAGE_KERNEL, &page, PAGE_SHIFT);
                 ^
   kernel/bpf/arena.c:270:34: warning: result of comparison of constant 4294967296 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
           if (vma->vm_end - vma->vm_start > 1ull << 32)
               ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/arena.c:339:8: error: implicit declaration of function 'vmap_pages_range' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ret = vmap_pages_range(kaddr, kaddr + PAGE_SIZE * page_cnt, PAGE_KERNEL,
                 ^
>> kernel/bpf/arena.c:375:2: error: implicit declaration of function 'vunmap_range' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           vunmap_range(kaddr, kaddr + PAGE_SIZE);
           ^
   kernel/bpf/arena.c:364:8: warning: variable 'entry' set but not used [-Wunused-but-set-variable]
           void *entry;
                 ^
   5 warnings and 6 errors generated.


vim +/ptep_get +122 kernel/bpf/arena.c

   116	
   117	static int for_each_pte(pte_t *ptep, unsigned long addr, void *data)
   118	{
   119		struct page *page;
   120		pte_t pte;
   121	
 > 122		pte = ptep_get(ptep);
 > 123		if (!pte_present(pte))
   124			return 0;
 > 125		page = pte_page(pte);
   126		/*
   127		 * We do not update pte here:
   128		 * 1. Nobody should be accessing bpf_arena's range outside of a kernel bug
   129		 * 2. TLB flushing is batched or deferred. Even if we clear pte,
   130		 * the TLB entries can stick around and continue to permit access to
   131		 * the freed page. So it all relies on 1.
   132		 */
   133		__free_page(page);
   134		return 0;
   135	}
   136	
   137	static void arena_map_free(struct bpf_map *map)
   138	{
   139		struct bpf_arena *arena = container_of(map, struct bpf_arena, map);
   140	
   141		/*
   142		 * Check that user vma-s are not around when bpf map is freed.
   143		 * mmap() holds vm_file which holds bpf_map refcnt.
   144		 * munmap() must have happened on vma followed by arena_vm_close()
   145		 * which would clear arena->vma_list.
   146		 */
   147		if (WARN_ON_ONCE(!list_empty(&arena->vma_list)))
   148			return;
   149	
   150		/*
   151		 * free_vm_area() calls remove_vm_area() that calls free_unmap_vmap_area().
   152		 * It unmaps everything from vmalloc area and clears pgtables.
   153		 * Call apply_to_existing_page_range() first to find populated ptes and
   154		 * free those pages.
   155		 */
   156		apply_to_existing_page_range(&init_mm, bpf_arena_get_kern_vm_start(arena),
   157					     KERN_VM_SZ - GUARD_SZ / 2, for_each_pte, NULL);
   158		free_vm_area(arena->kern_vm);
   159		__mt_destroy(&arena->mt);
   160		bpf_map_area_free(arena);
   161	}
   162	
   163	static void *arena_map_lookup_elem(struct bpf_map *map, void *key)
   164	{
   165		return ERR_PTR(-EINVAL);
   166	}
   167	
   168	static long arena_map_update_elem(struct bpf_map *map, void *key,
   169					  void *value, u64 flags)
   170	{
   171		return -EOPNOTSUPP;
   172	}
   173	
   174	static int arena_map_check_btf(const struct bpf_map *map, const struct btf *btf,
   175				       const struct btf_type *key_type, const struct btf_type *value_type)
   176	{
   177		return 0;
   178	}
   179	
   180	static u64 arena_map_mem_usage(const struct bpf_map *map)
   181	{
   182		return 0;
   183	}
   184	
   185	struct vma_list {
   186		struct vm_area_struct *vma;
   187		struct list_head head;
   188	};
   189	
   190	static int remember_vma(struct bpf_arena *arena, struct vm_area_struct *vma)
   191	{
   192		struct vma_list *vml;
   193	
   194		vml = kmalloc(sizeof(*vml), GFP_KERNEL);
   195		if (!vml)
   196			return -ENOMEM;
   197		vma->vm_private_data = vml;
   198		vml->vma = vma;
   199		list_add(&vml->head, &arena->vma_list);
   200		return 0;
   201	}
   202	
   203	static void arena_vm_close(struct vm_area_struct *vma)
   204	{
   205		struct vma_list *vml;
   206	
   207		vml = vma->vm_private_data;
   208		list_del(&vml->head);
   209		vma->vm_private_data = NULL;
   210		kfree(vml);
   211	}
   212	
   213	static vm_fault_t arena_vm_fault(struct vm_fault *vmf)
   214	{
   215		struct bpf_map *map = vmf->vma->vm_file->private_data;
   216		struct bpf_arena *arena = container_of(map, struct bpf_arena, map);
   217		struct page *page;
   218		long kbase, kaddr;
   219		int ret;
   220	
   221		kbase = bpf_arena_get_kern_vm_start(arena);
   222		kaddr = kbase + (u32)(vmf->address & PAGE_MASK);
   223	
   224	again:
   225		page = vmalloc_to_page((void *)kaddr);
   226		if (IS_ENABLED(CONFIG_DEBUG_VM))
   227			printk("arena_vm_fault: pgoff %lx addr %lx kaddr %lx page %px\n",
   228			       vmf->pgoff, vmf->address, kaddr, page);
   229		if (page)
   230			/* already have a page vmap-ed */
   231			goto out;
   232	
   233		ret = mtree_insert(&arena->mt, vmf->pgoff, arena, GFP_KERNEL);
   234		if (ret == -EEXIST)
   235			goto again;
   236		if (ret)
   237			return VM_FAULT_SIGSEGV;
   238	
   239		page = alloc_page(GFP_KERNEL);
   240		if (!page)
   241			return VM_FAULT_SIGSEGV;
   242	
 > 243		ret = vmap_pages_range(kaddr, kaddr + PAGE_SIZE, PAGE_KERNEL, &page, PAGE_SHIFT);
   244		if (ret) {
   245			__free_page(page);
   246			return VM_FAULT_SIGSEGV;
   247		}
   248	out:
   249		page_ref_add(page, 1);
   250		vmf->page = page;
   251		return 0;
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
