Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C9E345750
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786782183; cv=none; b=qgcAo/SOOA8ja57+hwPUSBP/Y0NUxWY7+kj0J8TOUMu1VLbxHpas0KJMzgDSuOx6b0Q4hUNu4nI8n2F+f0yTMtDArePGH9TqAiHZfIUTY47DAqNRZ3L1n38Sy7Vhe6UIWpMj0XJYhfQXUH7Uk30ce3SmKJNpzkmuERJUtOtepOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786782183; c=relaxed/simple;
	bh=i6D+wq+YfmozUySDUD2GUwY55c/seBF4pyC8kbPLCpg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SVDtMKVqc5GNpewVV364Duzy0kEUHxBdHMPweF7YntY9RYd6SQhv0KK5NXVXVpPmZ9qUhJxncNsvDwC/jgUaC9MSMSzKc4aDKNQo57ngL8S+LM9ZPTpDOTNz99i0QXuUM6agtX0fB6uizeAN1SKSmsuhofSsyCjDbjdxppeDspw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luXYvuFm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luXYvuFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786782182; x=1818318182;
  h=date:from:to:cc:subject:message-id;
  bh=i6D+wq+YfmozUySDUD2GUwY55c/seBF4pyC8kbPLCpg=;
  b=luXYvuFmC/XcUyD42uvvxUcx3Gav4l0O94nmC69Bfd4/w/hPG0IHc2vy
   P5eSckgARPyE/fTy4ycJQotytalCJmUAvQRzt7s4c13Eii54ej2Z8obFe
   1FUfSTxgrHyK1t1dHkJWHsgkyWnJ3hoXkRkC/bLBictL3LEJLT0iW9VAf
   2MhkZgoXxMu/IWhIFdVL4aVcKFDGZ3v5XuhdKeDu60nE5JTctH1jHKbOK
   Z/uy4LUtgsboTLaY11YlStSzt27uaaNwH6kkNYy07nMLDg1ylooSqj7gS
   sgCHa2sOBlehyksf2twTMe71XIPkQr5fd5jsMvgkhjzqtfawf9xmYdN2/
   A==;
X-CSE-ConnectionGUID: WTFj4w4yQBuF7TTZDAnZFQ==
X-CSE-MsgGUID: kBeVLqU7TGm5R3K6sHSEZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="104726598"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="104726598"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 01:23:01 -0700
X-CSE-ConnectionGUID: du09v63XSECy619Yp3nvyg==
X-CSE-MsgGUID: mODSzsNdSSidVs5AXh8FOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="264467787"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Aug 2026 01:23:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv9fN-00000000bYo-1JPu;
	Sat, 15 Aug 2026 08:22:57 +0000
Date: Sat, 15 Aug 2026 16:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext/arena.c:29: undefined reference to
 `gen_pool_create'
Message-ID: <202608151632.3p91bTQj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tejun,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f1baf1fc8929e6c48370be543ad028ac7ad4131
commit: bba2c3615bd6cfee7456d1130f2e6b01b3f4e9ba sched_ext: Move sources under kernel/sched/ext/
date:   8 weeks ago
config: parisc-randconfig-001-20260815 (https://download.01.org/0day-ci/archive/20260815/202608151632.3p91bTQj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608151632.3p91bTQj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bba2c3615bd6 ("sched_ext: Move sources under kernel/sched/ext/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151632.3p91bTQj-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/sched/build_policy.o: in function `gen_pool_free':
   include/linux/genalloc.h:173: undefined reference to `gen_pool_free_owner'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `scx_arena_pool_init':
>> kernel/sched/ext/arena.c:29: undefined reference to `gen_pool_create'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `scx_arena_pool_destroy':
>> kernel/sched/ext/arena.c:57: undefined reference to `gen_pool_for_each_chunk'
>> hppa-linux-ld: kernel/sched/ext/arena.c:58: undefined reference to `gen_pool_destroy'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `gen_pool_free':
   include/linux/genalloc.h:173: undefined reference to `gen_pool_free_owner'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `gen_pool_alloc_algo':
   include/linux/genalloc.h:139: undefined reference to `gen_pool_alloc_algo_owner'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `gen_pool_free':
   include/linux/genalloc.h:173: undefined reference to `gen_pool_free_owner'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `scx_arena_pool_init':
>> kernel/sched/ext/arena.c:29: undefined reference to `gen_pool_create'


vim +29 kernel/sched/ext/arena.c

9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  23  
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  24  s32 scx_arena_pool_init(struct scx_sched *sch)
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  25  {
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  26  	if (!sch->arena_map)
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  27  		return 0;
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  28  
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22 @29  	sch->arena_pool = gen_pool_create(SCX_ARENA_MIN_ORDER, NUMA_NO_NODE);
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  30  	if (!sch->arena_pool)
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  31  		return -ENOMEM;
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  32  	return 0;
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  33  }
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  34  
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  35  static void scx_arena_clear_chunk(struct gen_pool *pool, struct gen_pool_chunk *chunk,
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  36  				  void *data)
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  37  {
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  38  	int order = pool->min_alloc_order;
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  39  	size_t chunk_sz = chunk->end_addr - chunk->start_addr + 1;
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  40  	unsigned long end_bit = chunk_sz >> order;
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  41  	unsigned long b, e;
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  42  
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  43  	for_each_set_bitrange(b, e, chunk->bits, end_bit)
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  44  		gen_pool_free(pool, chunk->start_addr + (b << order),
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  45  			      (e - b) << order);
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  46  }
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  47  
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  48  /*
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  49   * Tear down the pool. Outstanding gen_pool allocations are freed via
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  50   * scx_arena_clear_chunk() so gen_pool_destroy() doesn't BUG. The underlying
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  51   * arena pages are released when the arena map itself is torn down.
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  52   */
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  53  void scx_arena_pool_destroy(struct scx_sched *sch)
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  54  {
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  55  	if (!sch->arena_pool)
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  56  		return;
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22 @57  	gen_pool_for_each_chunk(sch->arena_pool, scx_arena_clear_chunk, NULL);
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22 @58  	gen_pool_destroy(sch->arena_pool);
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  59  	sch->arena_pool = NULL;
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  60  }
9eca087deb0b35 kernel/sched/ext_arena.c Tejun Heo 2026-05-22  61  

:::::: The code at line 29 was first introduced by commit
:::::: 9eca087deb0b35f3170109a9630a6c5c06c2e222 sched_ext: Sub-allocator over kernel-claimed BPF arena pages

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
