Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971C17462
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715104308; cv=none; b=nNvnHjAl9T5T71b7bgHgb1ZHk4Pi2Qwz5dCkihH9qRyG9LcaGCBxAQ0ke+sOApvoDJt9MmLnb0kCFlIpZxqr6nPRBgJSOttLvWPhB18mYItUemP/cjtVy2J+is9Cqs/zwSO7YwBRG7+oDN+JVRZ747Ygn3BaVfOD+TAtMyZg/9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715104308; c=relaxed/simple;
	bh=Bmk4LdIyOk0nNbG56VHOG2A+j4E5RnebEM++XDPQcqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pcFVO/ymArvZpCmQWYf6yRmziauO5xiEc1nBKwndrlm1HFqB+gc66HVHq5qxGEjoqlNxzFeqKSel0lj45lT7itoP+XajTX+tMM/FO/nySuaSykgvoLWtaELOs8gINuXrks3MK/riZ9gPipAnubn7bPk82v77YobxoNOJOHjMZ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwG5u5zz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwG5u5zz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715104307; x=1746640307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bmk4LdIyOk0nNbG56VHOG2A+j4E5RnebEM++XDPQcqo=;
  b=DwG5u5zzMNWmwnTe/usJ+lZl/eIn9IfKyxzhXx+cztt+E+rXW/qd1W6m
   R50VD474xbNMnEDUQvFtUBKjvj9B9Nkhd+0lEwQXdDuSSHmNO2Um6HHri
   6HYFh/sWe4Pq65qs8ZqFi8nesobRWZRLJAKa5gy9AQvmrvQIXLsKCVz2E
   +LAoAGg4VT2kA8BBqSEYJAshRWNUTs6XLKYwtiqcoqhwbn3A1vcGT8E/5
   gOfqj2Z9EbPxGFmhIjvGcWyoc++Geyk7QbrrwUbckiqvQ+julmn5sTtxo
   ATleUB3ZlXxK0Hb4UbJd2tK2eoc5eAJcDhomKzq7Opjuta5CIBQkBvrU/
   A==;
X-CSE-ConnectionGUID: z5YrhIZWScOSZWHpjfvjeg==
X-CSE-MsgGUID: QWH82cfsSheMOwcILQMbaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10788411"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="10788411"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 10:51:46 -0700
X-CSE-ConnectionGUID: 2qOo3A2+TOylvuTaGDUvuw==
X-CSE-MsgGUID: 1+UTvj9jTGeKqiOlzGkHMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="28691418"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2024 10:51:44 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4Oyb-0002Wu-24;
	Tue, 07 May 2024 17:51:41 +0000
Date: Wed, 8 May 2024 01:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-dma-mapping:for-next 9/10] net/core/page_pool.c:406:47: error:
 passing 'const struct page *' to parameter of type 'struct page *' discards
 qualifiers
Message-ID: <202405080101.0mPUjuAp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/dma-mapping for-next
head:   66772d621cbea3d8acfeda4ba1f411030798d26f
commit: 8bf4d7154d4c0d281666e5595a843be89147d352 [9/10] page_pool: check for DMA sync shortcut earlier
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240508/202405080101.0mPUjuAp-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 0ab4458df0688955620b72cc2c72a32dffad3615)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080101.0mPUjuAp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080101.0mPUjuAp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/page_pool.c:13:
   In file included from include/net/page_pool/helpers.h:55:
   In file included from include/net/page_pool/types.h:7:
   In file included from include/linux/ptr_ring.h:26:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/core/page_pool.c:406:47: error: passing 'const struct page *' to parameter of type 'struct page *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     406 |         dma_addr_t dma_addr = page_pool_get_dma_addr(page);
         |                                                      ^~~~
   include/net/page_pool/helpers.h:373:62: note: passing argument to parameter 'page' here
     373 | static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
         |                                                              ^
   1 warning and 1 error generated.


vim +406 net/core/page_pool.c

ff7d6b27f894f1 Jesper Dangaard Brouer  2018-04-17  400  
8bf4d7154d4c0d Alexander Lobakin       2024-05-07  401  static void __page_pool_dma_sync_for_device(const struct page_pool *pool,
8bf4d7154d4c0d Alexander Lobakin       2024-05-07  402  					    const struct page *page,
8bf4d7154d4c0d Alexander Lobakin       2024-05-07  403  					    u32 dma_sync_size)
e68bc75691cc3d Lorenzo Bianconi        2019-11-20  404  {
8bf4d7154d4c0d Alexander Lobakin       2024-05-07  405  #if defined(CONFIG_HAS_DMA) && defined(CONFIG_DMA_NEED_SYNC)
9ddb3c14afba8b Matthew Wilcox (Oracle  2021-05-14 @406) 	dma_addr_t dma_addr = page_pool_get_dma_addr(page);
9ddb3c14afba8b Matthew Wilcox (Oracle  2021-05-14  407) 
e68bc75691cc3d Lorenzo Bianconi        2019-11-20  408  	dma_sync_size = min(dma_sync_size, pool->p.max_len);
8bf4d7154d4c0d Alexander Lobakin       2024-05-07  409  	__dma_sync_single_for_device(pool->p.dev, dma_addr + pool->p.offset,
8bf4d7154d4c0d Alexander Lobakin       2024-05-07  410  				     dma_sync_size, pool->p.dma_dir);
8bf4d7154d4c0d Alexander Lobakin       2024-05-07  411  #endif
8bf4d7154d4c0d Alexander Lobakin       2024-05-07  412  }
8bf4d7154d4c0d Alexander Lobakin       2024-05-07  413  

:::::: The code at line 406 was first introduced by commit
:::::: 9ddb3c14afba8bc5950ed297f02d4ae05ff35cd1 mm: fix struct page layout on 32-bit systems

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
