Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B04A13E04C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 23:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722555058; cv=none; b=eZkSjmCx6rzR+hWMuAvxOWZnONs3lMEoYyqgJAosgsnqeBtGnuKSjLnhXKIniba6DSYMuSLF2htQZLxEnqvMVnmqvKaABihbKESYVNs+F8AsCHF9VH9ayQ+fGdKNKoQcavYvhOiPpgZ5Dg32TLi8XtD6oSKTT7FoV5kNXxZ7AiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722555058; c=relaxed/simple;
	bh=WQZClHm7/QAHTYi549FS//RYgZDz/4OUthk62hLOUWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQ4eTNOo2RDNfemXRhPi8WyOz+HyzCwLAu1KvEuGrieENlnJXaphB9A33+Hib+sVUTaDoMLM7dRCxiD4y6n4UGa4ozvi9uCCiOPwdM8RPsI3eJ8ULYNvHkW/9hLZuqL+cX7NNC37RKVRP/6DFHWUhQi7ahBy5tzWDYkBkeSyOtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2LAs4zy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2LAs4zy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722555057; x=1754091057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WQZClHm7/QAHTYi549FS//RYgZDz/4OUthk62hLOUWA=;
  b=I2LAs4zy0kKqUUe1iebvK6XDPJTTBsaUKRxHLYPwmSLJSjZY4qLO1CoN
   C2B035x1u7W69ndLDiSOxGe8kohSRc3pIUrM0gdL8YVav6fkUkGHjpjpE
   rT8FnrNjlUEOrNEhST3LJtiL5Tv1+O9LCNWbmLVN7TOf9wSuXAaKGZAe6
   JPs0FS5gfOO5f8PvqWjsev74H8Tx8qsJq9V+Bx8i9x9zObOrGkrx7+MzS
   /lEhpqv1RR2n5CuFGtYftemQrgwZEDuaSpmojZs+3Nffcp/xAFFtrUP7h
   /TKx7D+j3q7PRN9yYEu/rLaSNnfrXE+r8ghFmhGsUJJsQdobnoe6aT9F3
   g==;
X-CSE-ConnectionGUID: QUUOW6Y2TEanH9JrPaU9yQ==
X-CSE-MsgGUID: e1UTmrbXRImM7UdqaVi37g==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="45956467"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="45956467"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 16:30:56 -0700
X-CSE-ConnectionGUID: 2+8Vi/L1QQ6Jui0kFr6fVg==
X-CSE-MsgGUID: vnroObATSSWL/C8u7Fg2SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="85795635"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Aug 2024 16:30:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZfFz-000w8K-1o;
	Thu, 01 Aug 2024 23:30:51 +0000
Date: Fri, 2 Aug 2024 07:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Saeed Mahameed <saeedm@nvidia.com>,
	Willem de Bruijn <willemb@google.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>
Subject: [saeed:temp/zcrx-mlx5 5/44] net/core/devmem.c:87:undefined reference
 to `gen_pool_has_addr'
Message-ID: <202408020740.Kvhjyaci-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git temp/zcrx-mlx5
head:   86d67e0dea281a7762636cc545694ca81f5b4621
commit: c76cb91cfec2d7b06ac6435692c4e619acddb8d8 [5/44] netdev: netdevice devmem allocator
config: i386-randconfig-006-20240801 (https://download.01.org/0day-ci/archive/20240802/202408020740.Kvhjyaci-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020740.Kvhjyaci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408020740.Kvhjyaci-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/core/devmem.o: in function `__net_devmem_dmabuf_binding_free':
   net/core/devmem.c:39:(.text+0x3a): undefined reference to `gen_pool_for_each_chunk'
   ld: net/core/devmem.c:42:(.text+0x42): undefined reference to `gen_pool_size'
   ld: net/core/devmem.c:43:(.text+0x4c): undefined reference to `gen_pool_avail'
   ld: net/core/devmem.c:47:(.text+0x58): undefined reference to `gen_pool_destroy'
   ld: net/core/devmem.o: in function `gen_pool_alloc_owner':
>> include/linux/genalloc.h:131:(.text+0xdf): undefined reference to `gen_pool_alloc_algo_owner'
   ld: net/core/devmem.o: in function `net_devmem_free_dmabuf':
>> net/core/devmem.c:87:(.text+0x187): undefined reference to `gen_pool_has_addr'
   ld: net/core/devmem.o: in function `gen_pool_free':
>> include/linux/genalloc.h:172:(.text+0x1d2): undefined reference to `gen_pool_free_owner'
   ld: net/core/devmem.o: in function `net_devmem_bind_dmabuf':
   net/core/devmem.c:225:(.text+0x570): undefined reference to `gen_pool_create'
   ld: net/core/devmem.c:245:(.text+0x605): undefined reference to `gen_pool_add_owner'
   ld: net/core/devmem.c:274:(.text+0x6a0): undefined reference to `gen_pool_for_each_chunk'
   ld: net/core/devmem.c:276:(.text+0x6a8): undefined reference to `gen_pool_destroy'


vim +87 net/core/devmem.c

    34	
    35	void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
    36	{
    37		size_t size, avail;
    38	
  > 39		gen_pool_for_each_chunk(binding->chunk_pool,
    40					net_devmem_dmabuf_free_chunk_owner, NULL);
    41	
    42		size = gen_pool_size(binding->chunk_pool);
    43		avail = gen_pool_avail(binding->chunk_pool);
    44	
    45		if (!WARN(size != avail, "can't destroy genpool. size=%zu, avail=%zu",
    46			  size, avail))
    47			gen_pool_destroy(binding->chunk_pool);
    48	
    49		dma_buf_unmap_attachment(binding->attachment, binding->sgt,
    50					 DMA_FROM_DEVICE);
    51		dma_buf_detach(binding->dmabuf, binding->attachment);
    52		dma_buf_put(binding->dmabuf);
    53		xa_destroy(&binding->bound_rxq_list);
    54		kfree(binding);
    55	}
    56	
    57	struct net_iov *
    58	net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
    59	{
    60		struct dmabuf_genpool_chunk_owner *owner;
    61		unsigned long dma_addr;
    62		struct net_iov *niov;
    63		ssize_t offset;
    64		ssize_t index;
    65	
    66		dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
    67						(void **)&owner);
    68		if (!dma_addr)
    69			return NULL;
    70	
    71		offset = dma_addr - owner->base_dma_addr;
    72		index = offset / PAGE_SIZE;
    73		niov = &owner->niovs[index];
    74	
    75		niov->dma_addr = 0;
    76	
    77		net_devmem_dmabuf_binding_get(binding);
    78	
    79		return niov;
    80	}
    81	
    82	void net_devmem_free_dmabuf(struct net_iov *niov)
    83	{
    84		struct net_devmem_dmabuf_binding *binding = net_iov_binding(niov);
    85		unsigned long dma_addr = net_iov_dma_addr(niov);
    86	
  > 87		if (gen_pool_has_addr(binding->chunk_pool, dma_addr, PAGE_SIZE))
    88			gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
    89	
    90		net_devmem_dmabuf_binding_put(binding);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
