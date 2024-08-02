Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4D01DF693
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Aug 2024 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722606741; cv=none; b=Mmlwgsey7aFAAmYt/1n7TGAcm6ADUSfHCaW4ICSeEAH+HGC2jG6IlkkGu4ev5fJc2MyNH7kKG5hlQtdm1UTl6l7f/Yjgr+8ZuMp7VSd9VnlV6X8ZkgrTqDmqtgH7qwjDdgPD8L5TfwMMLqffceBecgXhI6j9zCFfvS8UYNIUXSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722606741; c=relaxed/simple;
	bh=fFIeuPljd8ms1K4PYwU31YPnm3Jdf6gxenAi794DHvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rJGZVdaVfyXEAIhx85wZyMzXwG1rJ6PET3VASSl+hgdA7ulA8807uOCNx90703+YXWW9cePmYamQduLcIkYaDbcS++IkMX1af+GOaF6a+VWcq2BhOi0dqNMWaHahrLhMfVWRWltNxbtvAfy+LpapqAwOxEZ3Y5GQNXiaHCtfE+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xob3ayRx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xob3ayRx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722606739; x=1754142739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fFIeuPljd8ms1K4PYwU31YPnm3Jdf6gxenAi794DHvA=;
  b=Xob3ayRx33TxE2Cev7Rqcz860jTNj33ZmkswigPIfYGBHl6IsdQ4BeKb
   w/2fQjmcr/pyT9DfoWR/gFM7e8xqdyReRkTTlfSDdsiC1sY/wFM++Zuho
   hH+Yr5UlEt2LjtjSDwTLTQn20ZcnQpkmXpcPhQ59RR1AdbaVTMyNLd5vJ
   sQLP7S7cEZHjnOXm7liCwDum4JxjfoDoC9fIeOKmcYIzYP0/hU06RkcR0
   1uKCC9l7YpqrMmgdfB9qGFIs5NE0HgripbJm/3KavFHUPnEK1quXPRdol
   mpLlqrg1u8iPMQiR8Gg+AENYinGAgMjPriSstcLRQGYQ8C3QmEcB5cSKt
   A==;
X-CSE-ConnectionGUID: 4xLLSJXZTKeP6KDb9F9uSA==
X-CSE-MsgGUID: KeH2IYNiSOWjYy65vA0NUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20441069"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="20441069"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 06:52:17 -0700
X-CSE-ConnectionGUID: /2k7PpjAQiCPMY4/yMRSPQ==
X-CSE-MsgGUID: 8+sOlDRWQvWDi6ccvwk0lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="55080306"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Aug 2024 06:52:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZshY-000wqC-1k;
	Fri, 02 Aug 2024 13:52:12 +0000
Date: Fri, 2 Aug 2024 21:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <v-songbaohua@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-next:master 2441/2655] mm/util.c:670:17: sparse: sparse: cast
 from restricted gfp_t
Message-ID: <202408022151.f3Mg7jo1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f524a5e4dfb75b277c9a5ad819ca5f035f490f14
commit: f9f65ece370dcadeff00675aaec7899501005f1d [2441/2655] mm: BUG_ON to avoid NULL deference while __GFP_NOFAIL fails
config: mips-randconfig-r111-20240802 (https://download.01.org/0day-ci/archive/20240802/202408022151.f3Mg7jo1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 430b90f04533b099d788db2668176038be38c53b)
reproduce: (https://download.01.org/0day-ci/archive/20240802/202408022151.f3Mg7jo1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408022151.f3Mg7jo1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/util.c:129:6: sparse: sparse: multiple definitions for function 'kmemdup_noprof'
   mm/util.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   include/linux/fortify-string.h:744:23: sparse:  the previous one is here
>> mm/util.c:670:17: sparse: sparse: cast from restricted gfp_t
--
>> mm/page_alloc.c:4677:17: sparse: sparse: cast from restricted gfp_t
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c:2599:6: sparse: sparse: context imbalance in 'free_unref_page' - wrong count at exit
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/spinlock.h:391:9: sparse: sparse: context imbalance in 'free_unref_folios' - unexpected unlock
   mm/page_alloc.c:2975:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - wrong count at exit
   mm/page_alloc.c:4642:9: sparse: sparse: context imbalance in 'alloc_pages_bulk_noprof' - different lock contexts for basic block
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
--
   kernel/bpf/core.c:242:49: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2010:43: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2015:48: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2283:77: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/xdp.h, ...):
   include/trace/events/xdp.h:321:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:348:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:382:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/bpf/core.c: note: in included file (through include/linux/fs.h, arch/mips/include/asm/elf.h, include/linux/elf.h, ...):
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
--
   kernel/bpf/hashtab.c:1052:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __percpu *[assigned] pptr @@     got void * @@
   kernel/bpf/hashtab.c:1052:30: sparse:     expected void [noderef] __percpu *[assigned] pptr
   kernel/bpf/hashtab.c:1052:30: sparse:     got void *
   kernel/bpf/hashtab.c:1058:44: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *ptr_to_pptr @@     got void [noderef] __percpu *[assigned] pptr @@
   kernel/bpf/hashtab.c:1058:44: sparse:     expected void *ptr_to_pptr
   kernel/bpf/hashtab.c:1058:44: sparse:     got void [noderef] __percpu *[assigned] pptr
   kernel/bpf/hashtab.c:1059:34: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/bpf/hashtab.c:1059:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __percpu *[assigned] pptr @@     got void * @@
   kernel/bpf/hashtab.c:1059:30: sparse:     expected void [noderef] __percpu *[assigned] pptr
   kernel/bpf/hashtab.c:1059:30: sparse:     got void *
   kernel/bpf/hashtab.c:178:9: sparse: sparse: context imbalance in 'htab_map_delete_elem' - unexpected unlock
   kernel/bpf/hashtab.c:178:9: sparse: sparse: context imbalance in 'htab_lru_map_delete_elem' - unexpected unlock
   kernel/bpf/hashtab.c:178:9: sparse: sparse: context imbalance in '__htab_map_lookup_and_delete_elem' - unexpected unlock
   kernel/bpf/hashtab.c: note: in included file (through include/linux/fs.h, arch/mips/include/asm/elf.h, include/linux/elf.h, ...):
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
   kernel/bpf/hashtab.c: note: in included file (through include/linux/workqueue.h, include/linux/bpf.h):
   include/linux/rcupdate.h:870:9: sparse: sparse: context imbalance in '__htab_map_lookup_and_delete_batch' - unexpected unlock
   kernel/bpf/hashtab.c:2020:17: sparse: sparse: context imbalance in 'bpf_hash_map_seq_find_next' - unexpected unlock
   include/linux/rcupdate.h:870:9: sparse: sparse: context imbalance in 'bpf_hash_map_seq_stop' - unexpected unlock
--
   kernel/bpf/verifier.c:20572:38: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/verifier.c: note: in included file (through include/linux/fs.h, arch/mips/include/asm/elf.h, include/linux/elf.h, ...):
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
   kernel/bpf/verifier.c: note: in included file (through include/linux/bpf.h, include/linux/bpf-cgroup.h):
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
   kernel/bpf/verifier.c: note: in included file (through include/linux/fs.h, arch/mips/include/asm/elf.h, include/linux/elf.h, ...):
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
   kernel/bpf/verifier.c: note: in included file (through include/linux/bpf.h, include/linux/bpf-cgroup.h):
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
   kernel/bpf/verifier.c:19410:44: sparse: sparse: cast truncates bits from constant value (c000000001040000 becomes 1040000)
   kernel/bpf/verifier.c: note: in included file (through include/linux/fs.h, arch/mips/include/asm/elf.h, include/linux/elf.h, ...):
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
   kernel/bpf/verifier.c: note: in included file (through include/linux/bpf.h, include/linux/bpf-cgroup.h):
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
--
   kernel/bpf/arena.c: note: in included file (through include/linux/fs.h, arch/mips/include/asm/elf.h, include/linux/elf.h, ...):
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
--
   kernel/bpf/bpf_local_storage.c: note: in included file (through include/linux/fs.h, arch/mips/include/asm/elf.h, include/linux/elf.h, ...):
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
--
   tools/lib/bpf/btf_relocate.c: note: in included file (through include/linux/fs.h, arch/mips/include/asm/elf.h, include/linux/elf.h, ...):
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
--
   kernel/bpf/btf.c: note: in included file (through include/linux/mm.h, include/linux/pid_namespace.h, include/linux/ptrace.h, ...):
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
>> include/linux/slab.h:831:17: sparse: sparse: cast from restricted gfp_t
   kernel/bpf/btf.c: note: in included file (through include/linux/bpf.h, include/linux/bpf_verifier.h):
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar

vim +670 mm/util.c

   632	
   633	/**
   634	 * __kvmalloc_node - attempt to allocate physically contiguous memory, but upon
   635	 * failure, fall back to non-contiguous (vmalloc) allocation.
   636	 * @size: size of the request.
   637	 * @b: which set of kmalloc buckets to allocate from.
   638	 * @flags: gfp mask for the allocation - must be compatible (superset) with GFP_KERNEL.
   639	 * @node: numa node to allocate from
   640	 *
   641	 * Uses kmalloc to get the memory but if the allocation fails then falls back
   642	 * to the vmalloc allocator. Use kvfree for freeing the memory.
   643	 *
   644	 * GFP_NOWAIT and GFP_ATOMIC are not supported, neither is the __GFP_NORETRY modifier.
   645	 * __GFP_RETRY_MAYFAIL is supported, and it should be used only if kmalloc is
   646	 * preferable to the vmalloc fallback, due to visible performance drawbacks.
   647	 *
   648	 * Return: pointer to the allocated memory of %NULL in case of failure
   649	 */
   650	void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
   651	{
   652		void *ret;
   653	
   654		/*
   655		 * It doesn't really make sense to fallback to vmalloc for sub page
   656		 * requests
   657		 */
   658		ret = __kmalloc_node_noprof(PASS_BUCKET_PARAMS(size, b),
   659					    kmalloc_gfp_adjust(flags, size),
   660					    node);
   661		if (ret || size <= PAGE_SIZE)
   662			return ret;
   663	
   664		/* non-sleeping allocations are not supported by vmalloc */
   665		if (!gfpflags_allow_blocking(flags))
   666			return NULL;
   667	
   668		/* Don't even allow crazy sizes */
   669		if (unlikely(size > INT_MAX)) {
 > 670			BUG_ON(flags & __GFP_NOFAIL);
   671			WARN_ON_ONCE(!(flags & __GFP_NOWARN));
   672			return NULL;
   673		}
   674	
   675		/*
   676		 * kvmalloc() can always use VM_ALLOW_HUGE_VMAP,
   677		 * since the callers already cannot assume anything
   678		 * about the resulting pointer, and cannot play
   679		 * protection games.
   680		 */
   681		return __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
   682				flags, PAGE_KERNEL, VM_ALLOW_HUGE_VMAP,
   683				node, __builtin_return_address(0));
   684	}
   685	EXPORT_SYMBOL(__kvmalloc_node_noprof);
   686	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
