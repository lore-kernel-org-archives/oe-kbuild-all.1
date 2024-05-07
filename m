Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BF016190C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 17:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715102386; cv=none; b=Z5Izm8Vy1tvMBcUVaJRQHwQN8pWIUss/bpZzOk4snfKZoy2vUNm7qG1U4NeHTBVaFmGlN4j/T4CG6SyHdwM/FJJVIQm3ZLhFMDSrX01TJS7WtlmWGaf25L2pDbbslkI3eg62v05F+2G5QTZtQUM5DPGVOd7lM14QOCsm3ETSOBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715102386; c=relaxed/simple;
	bh=VF92r0b5/+S5yFBW9k3DqNbA07vg80yhEuOGDbUNRHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HFob7mQm++KYHekrcSym0MVJ56v0zxroUgkgop39mhCyiF44tWJqHAVJaL/iWuZRkiyJpVSFc+trbdILN7wAzNOd+Sv3yJmuPG4ISxXIDwMYONeTXbAgTM6wJnoi4b9sFmx46VUUcquIHiw87QpFfZhvLT/eS/Z+kyUrzu1T1/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQOc4bSd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQOc4bSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715102384; x=1746638384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VF92r0b5/+S5yFBW9k3DqNbA07vg80yhEuOGDbUNRHk=;
  b=bQOc4bSdTa+MM3Ocds4a7g0spU5KK/drWc8LZuEj0AaukizzZyhTGKNv
   Dt8YOjUHioICqQUecm+8MOw9ZNKYPEnIMk8htbqwMsJypk44UBB7IAnAy
   +Z+mFwUj5WEG1E33pXhDRF9IlLNtLmHH2Dbpq6AwRZBQdcPupYfZO8ztQ
   uAtQWJn32rNPXYQViBsYCDYUY31g8xDSX365q2zRqahedOzqtMY8ozwsa
   ZRWWfbS1b7I4uuRJnVa9cn//hO9JiMT+wgIvy/Q3ZvUMQCD2Kntx43dJB
   cX7NDhTPex/YmzThtPVbuKwb/9DF95zcezxHGvPYxIQFUW+W6frDXjK2T
   w==;
X-CSE-ConnectionGUID: EB4OXIMJQ7mCjoi1Q8HM4w==
X-CSE-MsgGUID: 1eHaxQecRgeczgkKinRmWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11042400"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="11042400"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 10:19:42 -0700
X-CSE-ConnectionGUID: 064cZ542SHOI0Xx6L9zmPA==
X-CSE-MsgGUID: hYbJX7cLRN2esYzh/P1Jtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="59760891"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 May 2024 10:19:42 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4OTb-0002Sw-2R;
	Tue, 07 May 2024 17:19:39 +0000
Date: Wed, 8 May 2024 01:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-dma-mapping:for-next 9/10] net/core/page_pool.c:406:54:
 warning: passing argument 1 of 'page_pool_get_dma_addr' discards 'const'
 qualifier from pointer target type
Message-ID: <202405080109.cZObB5j9-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240508/202405080109.cZObB5j9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080109.cZObB5j9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080109.cZObB5j9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/page_pool.c: In function '__page_pool_dma_sync_for_device':
>> net/core/page_pool.c:406:54: warning: passing argument 1 of 'page_pool_get_dma_addr' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     406 |         dma_addr_t dma_addr = page_pool_get_dma_addr(page);
         |                                                      ^~~~
   In file included from net/core/page_pool.c:13:
   include/net/page_pool/helpers.h:373:62: note: expected 'struct page *' but argument is of type 'const struct page *'
     373 | static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
         |                                                 ~~~~~~~~~~~~~^~~~


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
