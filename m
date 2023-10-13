Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36279107AD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 22:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDdGIgCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697236933; x=1728772933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BqldsLbacZXIA0VlpjjBEw/sGa6OcZZr7XkN+fOAZOQ=;
  b=bDdGIgCTkKXlhalAPpWF+qvLA/MC3IeaFgVLNMao4yB+ejmY6V9BjJ5V
   wMEZ/P/kt8q4s3h5VHagvMnnI5PX7wJKLmzHHC/JPDy97D9ewina3A32j
   S1xiTBgg9eLC+gYr6ASkGfqG6knrv5qdItNg05U63Qlyz7QnT/Qog4ZJH
   e4mDjtz0fgPq8WEXhAXdAQMM1TWvxTndNq5XU7fm/DIR+zAxpG9EPj5QF
   xLKSc2INk1pq+x7xTTM/LBblAiQG1mB1GUt8VlZSJmRwr4u55D6oHQAsk
   NeebbT0i7BCPlgAhNXTRiMiXWwOQL7PjqPeLTWIau2Ftu5e1uaVJWev62
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385118844"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="385118844"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 15:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="845646514"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="845646514"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Oct 2023 15:41:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrQqw-0005Td-36;
	Fri, 13 Oct 2023 22:41:54 +0000
Date: Sat, 14 Oct 2023 06:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 5/7] io_uring/zc_rx.c:116:20: warning: unused
 variable 'addr'
Message-ID: <202310140601.NUM9TjyM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: 87d67390f5c169ff9ae3ed9748e59e5cfb540d70 [5/7] veth: zc_rx support
config: um-defconfig (https://download.01.org/0day-ci/archive/20231014/202310140601.NUM9TjyM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140601.NUM9TjyM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140601.NUM9TjyM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/zc_rx.c: In function 'io_zc_rx_map_buf':
>> io_uring/zc_rx.c:116:20: warning: unused variable 'addr' [-Wunused-variable]
     116 |         dma_addr_t addr;
         |                    ^~~~
   io_uring/zc_rx.c: At top level:
   io_uring/zc_rx.c:185:5: warning: no previous prototype for 'io_zc_rx_create_pool' [-Wmissing-prototypes]
     185 | int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/addr +116 io_uring/zc_rx.c

568ae4bf1dd0e1 David Wei      2023-08-14  112  
de471788991400 David Wei      2023-08-11  113  static int io_zc_rx_map_buf(struct device *dev, struct page *page, u16 pool_id,
de471788991400 David Wei      2023-08-11  114  			    u32 pgid, struct io_zc_rx_buf *buf)
de471788991400 David Wei      2023-08-11  115  {
de471788991400 David Wei      2023-08-11 @116  	dma_addr_t addr;
de471788991400 David Wei      2023-08-11  117  
de471788991400 David Wei      2023-08-11  118  	SetPagePrivate(page);
de471788991400 David Wei      2023-08-11  119  	set_page_private(page, mk_page_info(pool_id, pgid));
de471788991400 David Wei      2023-08-11  120  
87d67390f5c169 Pavel Begunkov 2023-10-12  121  	// addr = dma_map_page_attrs(dev, page, 0, PAGE_SIZE,
87d67390f5c169 Pavel Begunkov 2023-10-12  122  	// 			  DMA_BIDIRECTIONAL,
87d67390f5c169 Pavel Begunkov 2023-10-12  123  	// 			  DMA_ATTR_SKIP_CPU_SYNC);
87d67390f5c169 Pavel Begunkov 2023-10-12  124  	// if (dma_mapping_error(dev, addr)) {
87d67390f5c169 Pavel Begunkov 2023-10-12  125  	// 	set_page_private(page, 0);
87d67390f5c169 Pavel Begunkov 2023-10-12  126  	// 	ClearPagePrivate(page);
87d67390f5c169 Pavel Begunkov 2023-10-12  127  	// 	return -ENOMEM;
87d67390f5c169 Pavel Begunkov 2023-10-12  128  	// }
87d67390f5c169 Pavel Begunkov 2023-10-12  129  	buf->dma = 0;
87d67390f5c169 Pavel Begunkov 2023-10-12  130  	// buf->dma = addr;
de471788991400 David Wei      2023-08-11  131  
de471788991400 David Wei      2023-08-11  132  	buf->page = page;
de471788991400 David Wei      2023-08-11  133  	atomic_set(&buf->refcount, 0);
de471788991400 David Wei      2023-08-11  134  	get_page(page);
de471788991400 David Wei      2023-08-11  135  
de471788991400 David Wei      2023-08-11  136  	return 0;
de471788991400 David Wei      2023-08-11  137  }
de471788991400 David Wei      2023-08-11  138  

:::::: The code at line 116 was first introduced by commit
:::::: de471788991400859db2362ac41d6f1d2662820a io_uring: add ZC buf and pool

:::::: TO: David Wei <davidhwei@meta.com>
:::::: CC: David Wei <davidhwei@meta.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
