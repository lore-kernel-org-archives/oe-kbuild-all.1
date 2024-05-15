Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E04175A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 06:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715756313; cv=none; b=OxSKaXw2lbosPi8Ye5fmjmLhgQ0L8eEQ/3ij9VXrKz7TRZ+AaWJyADYoYFjHWYkoTU8n40lu/SII0iYa45ZzQahDeAb6/ydapQfYF6DLP/3kjMG+/QtAwf3xHIWy93MfP/H358tCDBeSiOGb9jXnsH07AWw9X0FFHIZ6rEcHBSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715756313; c=relaxed/simple;
	bh=3rLfRCfoWw0BNpNtyJ32tMD5xGFKhlNZ58KLbOQN8WA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+woYlwyria1Cbs+/Olw6psjkIHffxJCurVh9/jyYlnN/xg2v0rhjoSS9bhoyZbjFEDpQ85RljFhYlGwyzVOX7eYhPQAze300a0OpK2BW6folFf08pvqpe0ZWb3qJ5E1Fba+QEzgtaHOVMYvuoDvGSvqHIKW/CtzAOrhAVvywD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuKfQvSY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuKfQvSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715756311; x=1747292311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3rLfRCfoWw0BNpNtyJ32tMD5xGFKhlNZ58KLbOQN8WA=;
  b=PuKfQvSY7aACTaZQ9W3FKKkh0q9Jhq3eQ5Y38vOBZNElu2FIFi7yzw5f
   7aJ5/f6NE1pudmlLyUAupxnyUfwbBZwzcQuh34wpJ0Mq6GXMTA/VtOuES
   iruMszbrtFqUpj0JprpkozEk5QSSqGPpZ1fafCWjx767QWZl3e+/XItYG
   Nal7NS7jf9tYEIdO5kjnu9uR+RTsgY4y8LBXjouPqKMKWzVcwgUaE/ayJ
   xHzZHIzLH4NWvQmHvCkq9Pm/V9LQ6hrn+jRfxUhmR9doesqr0IdHMTlwY
   74xxVFXhAVVHLR5WDCnt3aG9aptDQkQjTFEf1iU27GzevKerr800ddZ4a
   Q==;
X-CSE-ConnectionGUID: 92AtZUiRT/apY9RUhXJeBg==
X-CSE-MsgGUID: F0625hOiRWq2ElTOqNWVTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="37159655"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="37159655"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 23:58:30 -0700
X-CSE-ConnectionGUID: RaKIof+wRUyHxW1pIy5ZRw==
X-CSE-MsgGUID: o5STSYcRQOuT82E4ZIUlWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="31367942"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2024 23:58:29 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s78ap-000CXv-05;
	Wed, 15 May 2024 06:58:27 +0000
Date: Wed, 15 May 2024 14:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 10/27] io_uring/zc_rx.c:85:18: warning: variable
 'nr_pages' is uninitialized when used here
Message-ID: <202405151454.iFf5xfqH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   8f99f44fc1fabf943cf0d1989f0afdff15e064e8
commit: 0ce40e0dbed2309622ada5e3c5128f22338602c4 [10/27] io_uring/zcrx: get rid of registered buffers + region format
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240515/202405151454.iFf5xfqH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405151454.iFf5xfqH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405151454.iFf5xfqH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/zc_rx.c:5:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> io_uring/zc_rx.c:85:18: warning: variable 'nr_pages' is uninitialized when used here [-Wuninitialized]
      85 |         pool->nr_bufs = nr_pages;
         |                         ^~~~~~~~
   io_uring/zc_rx.c:64:22: note: initialize the variable 'nr_pages' to silence this warning
      64 |         int i, ret, nr_pages;
         |                             ^
         |                              = 0
   2 warnings generated.


vim +/nr_pages +85 io_uring/zc_rx.c

    57	
    58	static int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
    59					struct io_zc_rx_ifq *ifq,
    60					struct io_zc_rx_pool **res,
    61					struct io_uring_zc_rx_region_reg *region)
    62	{
    63		struct io_zc_rx_pool *pool;
    64		int i, ret, nr_pages;
    65		struct iovec iov;
    66	
    67		if (region->flags || region->region_id)
    68			return -EINVAL;
    69		if (region->resv2[0] || region->resv2[1] || region->resv2[2])
    70			return -EINVAL;
    71		if (region->addr & ~PAGE_MASK || region->len & ~PAGE_MASK)
    72			return -EINVAL;
    73	
    74		iov.iov_base = u64_to_user_ptr(region->addr);
    75		iov.iov_len = region->len;
    76		ret = io_buffer_validate(&iov);
    77		if (ret)
    78			return ret;
    79	
    80		ret = -ENOMEM;
    81		pool = kmalloc(sizeof(*pool), GFP_KERNEL);
    82		if (!pool)
    83			goto err;
    84	
  > 85		pool->nr_bufs = nr_pages;
    86		pool->pages = io_pin_pages((unsigned long)region->addr, region->len,
    87					   &nr_pages);
    88		if (!pool->pages)
    89			goto err;
    90	
    91		pool->bufs = kvmalloc_array(nr_pages, sizeof(pool->bufs[0]), GFP_KERNEL);
    92		if (!pool->bufs)
    93			goto err;
    94	
    95		pool->freelist = kvmalloc_array(nr_pages, sizeof(pool->freelist[0]),
    96						GFP_KERNEL);
    97		if (!pool->freelist)
    98			goto err;
    99	
   100		for (i = 0; i < nr_pages; i++) {
   101			struct net_iov *niov = &pool->bufs[i].niov;
   102	
   103			memset(niov, 0, sizeof(*niov));
   104			atomic_long_set(&niov->pp_ref_count, 0);
   105			pool->freelist[i] = i;
   106		}
   107	
   108		pool->free_count = nr_pages;
   109		pool->ifq = ifq;
   110		/* we're only supporting one region per ifq for now */
   111		pool->pool_id = 0;
   112		region->region_id = pool->pool_id;
   113		spin_lock_init(&pool->freelist_lock);
   114		*res = pool;
   115		return 0;
   116	err:
   117		if (pool)
   118			io_zc_rx_free_pool(pool);
   119		return ret;
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
