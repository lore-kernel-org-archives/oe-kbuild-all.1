Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30EA1E32D6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 06:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786773778; cv=none; b=uAkgptzoLrYau01g3AL/brzfjkCOSPfXSX0zIcVSJfmxLJKZ7EMvFG5eftHQr4EuXo9yhzC07NRyGUvScXgbHc/6XPQi0WTJVrJUIl2ytusfZvGwYQdzwXn4yN02u4yyOxUlXfZKxmlgy+EfjIpo+PpU22sA6PfUAzBS8dq9EJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786773778; c=relaxed/simple;
	bh=Hfs3LMxKLwpySXM6qMb5RjcIoxTjghPF/M9tCn5fk6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aeS36fGF7eRl+7VCxcTgVMRIyRCuhEi7RMsM1pSLoEqfUEChm6/tfyBFnEOYRhLpxZOPF3GqbJEsBcOuL7f8+Xb5V9VCcje+JVUoMMpCfcAcWlRvsZWLFtbs39HsGxi+w1n36RXBT7BZJTSEJo6G/JCUJf6AwOr4TAHGOW5J8nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdG8oc2D; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdG8oc2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786773777; x=1818309777;
  h=date:from:to:cc:subject:message-id;
  bh=Hfs3LMxKLwpySXM6qMb5RjcIoxTjghPF/M9tCn5fk6U=;
  b=PdG8oc2DsKhkLA6xGX3d92BAz2oRR4aeIx5yipognDcD7evvVyvbAZx9
   NRIBk2jIvzJoPHKWvNywOSQRNoG1KjaPZdcTG6g9iPfyfi6ICO6kOUGHo
   BmUixPZpHcFvfYuSjbdH14dkYHWBQR8x9zGzrxf8wZ0WY3Hm7RIepucgc
   TvRQ832IZf32F5i46tmntOpodBDTOC8cvWMJ2EKDqdKYMaTHYKfmivQw0
   zJH1bFWxu+fSZj71r6HCfhl2z/fCpZKOfiHSiJd1iCoXpYvH9G2DAmk94
   f2gl4rMNYoBdcXtmSYP8qHFXM+FkuvJyBwgdCAyf54k+NIsGK7kRdWyih
   A==;
X-CSE-ConnectionGUID: rsUdl9dIS02zWqI3PDNNww==
X-CSE-MsgGUID: +gEJmOMkQ52db8DEWmD5FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87364215"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="87364215"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 23:02:57 -0700
X-CSE-ConnectionGUID: gajGGOIgRoCNyQPZ6SRKoQ==
X-CSE-MsgGUID: uLdsOrSOQva7/DQTY5XqsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="264450689"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Aug 2026 23:02:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv7To-00000000bGj-1yf6;
	Sat, 15 Aug 2026 06:02:52 +0000
Date: Sat, 15 Aug 2026 14:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: include/linux/genalloc.h:173: undefined reference to
 `gen_pool_free_owner'
Message-ID: <202608151315.tvN3X0Oq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f1baf1fc8929e6c48370be543ad028ac7ad4131
commit: 9eca087deb0b35f3170109a9630a6c5c06c2e222 sched_ext: Sub-allocator over kernel-claimed BPF arena pages
date:   3 months ago
config: parisc-randconfig-001-20260815 (https://download.01.org/0day-ci/archive/20260815/202608151315.tvN3X0Oq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608151315.tvN3X0Oq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9eca087deb0b ("sched_ext: Sub-allocator over kernel-claimed BPF arena pages")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151315.tvN3X0Oq-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/sched/build_policy.o: in function `scx_arena_scan_prog':
   kernel/sched/ext.c:7937: undefined reference to `bpf_prog_arena'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `gen_pool_free':
>> include/linux/genalloc.h:173: undefined reference to `gen_pool_free_owner'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `scx_arena_pool_init':
   kernel/sched/ext_arena.c:29: undefined reference to `gen_pool_create'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `scx_arena_pool_destroy':
   kernel/sched/ext_arena.c:57: undefined reference to `gen_pool_for_each_chunk'
   hppa-linux-ld: kernel/sched/ext_arena.c:58: undefined reference to `gen_pool_destroy'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `gen_pool_alloc_algo':
>> include/linux/genalloc.h:139: undefined reference to `gen_pool_alloc_algo_owner'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `gen_pool_free':
>> include/linux/genalloc.h:173: undefined reference to `gen_pool_free_owner'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `scx_arena_pool_init':
   kernel/sched/ext_arena.c:29: undefined reference to `gen_pool_create'


vim +173 include/linux/genalloc.h

795ee30648c7085 Dan Williams   2019-06-13  135  
795ee30648c7085 Dan Williams   2019-06-13  136  static inline unsigned long gen_pool_alloc_algo(struct gen_pool *pool,
795ee30648c7085 Dan Williams   2019-06-13  137  		size_t size, genpool_algo_t algo, void *data)
795ee30648c7085 Dan Williams   2019-06-13  138  {
795ee30648c7085 Dan Williams   2019-06-13 @139  	return gen_pool_alloc_algo_owner(pool, size, algo, data, NULL);
795ee30648c7085 Dan Williams   2019-06-13  140  }
795ee30648c7085 Dan Williams   2019-06-13  141  
795ee30648c7085 Dan Williams   2019-06-13  142  /**
795ee30648c7085 Dan Williams   2019-06-13  143   * gen_pool_alloc - allocate special memory from the pool
795ee30648c7085 Dan Williams   2019-06-13  144   * @pool: pool to allocate from
795ee30648c7085 Dan Williams   2019-06-13  145   * @size: number of bytes to allocate from the pool
795ee30648c7085 Dan Williams   2019-06-13  146   *
795ee30648c7085 Dan Williams   2019-06-13  147   * Allocate the requested number of bytes from the specified pool.
795ee30648c7085 Dan Williams   2019-06-13  148   * Uses the pool allocation function (with first-fit algorithm by default).
795ee30648c7085 Dan Williams   2019-06-13  149   * Can not be used in NMI handler on architectures without
795ee30648c7085 Dan Williams   2019-06-13  150   * NMI-safe cmpxchg implementation.
795ee30648c7085 Dan Williams   2019-06-13  151   */
795ee30648c7085 Dan Williams   2019-06-13  152  static inline unsigned long gen_pool_alloc(struct gen_pool *pool, size_t size)
795ee30648c7085 Dan Williams   2019-06-13  153  {
795ee30648c7085 Dan Williams   2019-06-13  154  	return gen_pool_alloc_algo(pool, size, pool->algo, pool->data);
795ee30648c7085 Dan Williams   2019-06-13  155  }
795ee30648c7085 Dan Williams   2019-06-13  156  
684f0d3d14f2744 Nicolin Chen   2013-11-12  157  extern void *gen_pool_dma_alloc(struct gen_pool *pool, size_t size,
684f0d3d14f2744 Nicolin Chen   2013-11-12  158  		dma_addr_t *dma);
cf394fc5f7155c2 Fredrik Noring 2019-06-25  159  extern void *gen_pool_dma_alloc_algo(struct gen_pool *pool, size_t size,
cf394fc5f7155c2 Fredrik Noring 2019-06-25  160  		dma_addr_t *dma, genpool_algo_t algo, void *data);
cf394fc5f7155c2 Fredrik Noring 2019-06-25  161  extern void *gen_pool_dma_alloc_align(struct gen_pool *pool, size_t size,
cf394fc5f7155c2 Fredrik Noring 2019-06-25  162  		dma_addr_t *dma, int align);
cf394fc5f7155c2 Fredrik Noring 2019-06-25  163  extern void *gen_pool_dma_zalloc(struct gen_pool *pool, size_t size, dma_addr_t *dma);
cf394fc5f7155c2 Fredrik Noring 2019-06-25  164  extern void *gen_pool_dma_zalloc_algo(struct gen_pool *pool, size_t size,
cf394fc5f7155c2 Fredrik Noring 2019-06-25  165  		dma_addr_t *dma, genpool_algo_t algo, void *data);
cf394fc5f7155c2 Fredrik Noring 2019-06-25  166  extern void *gen_pool_dma_zalloc_align(struct gen_pool *pool, size_t size,
cf394fc5f7155c2 Fredrik Noring 2019-06-25  167  		dma_addr_t *dma, int align);
795ee30648c7085 Dan Williams   2019-06-13  168  extern void gen_pool_free_owner(struct gen_pool *pool, unsigned long addr,
795ee30648c7085 Dan Williams   2019-06-13  169  		size_t size, void **owner);
795ee30648c7085 Dan Williams   2019-06-13  170  static inline void gen_pool_free(struct gen_pool *pool, unsigned long addr,
795ee30648c7085 Dan Williams   2019-06-13  171                  size_t size)
795ee30648c7085 Dan Williams   2019-06-13  172  {
795ee30648c7085 Dan Williams   2019-06-13 @173  	gen_pool_free_owner(pool, addr, size, NULL);
795ee30648c7085 Dan Williams   2019-06-13  174  }
795ee30648c7085 Dan Williams   2019-06-13  175  

:::::: The code at line 173 was first introduced by commit
:::::: 795ee30648c708502da9df637f83c33361d68dcc lib/genalloc: introduce chunk owners

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
