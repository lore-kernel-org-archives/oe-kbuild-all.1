Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B10B2837A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 04:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735188080; cv=none; b=daTUSYvkeUu2I8lAtZLCwyzv0Vw6uS5Z8qdA4UG+lnXimoscXvoDXGdRKk3sMpBFtcEzmVRKa+bXTRDb7WRPTCq7guo6riovnWzVGr51s0gODTYX5q0kLaC8cVBRJhhtOyIdOua7vdKZOsIMr9m7NlbNd3HgIuOWWSZTTl3UC0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735188080; c=relaxed/simple;
	bh=Gxk5PM4SSVRnR0aqH2wp0rrD1G+SRAzw8g1KzEam0as=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k50cgJhDsU6ZVZzCM5KWw7uoymZRIMOr5UoJsj7YPKUQTwzQMB3nKeMu2h3D6N7JXLDkJcNv6R3lvaMGq932KChnDRRiZeNv+gy01l/Pw05EzWNuiWmhWPKH4S3UCKjk2OkM7lwT7xHYmo+nbE7H3PNaaBSY8lb73Sgxba39r2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAcuZXvK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAcuZXvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735188079; x=1766724079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gxk5PM4SSVRnR0aqH2wp0rrD1G+SRAzw8g1KzEam0as=;
  b=oAcuZXvKfsmXCI6dK7B5GzCnKTMZstjBmjwFPASc2iXedxv5ze9LNWoJ
   z+naDk1KKy3HuHzdc5ZIMDofgjI3+C/h5O/dVGZUkdKFYDXBR255vqfuB
   BGGTgOJv0jW+GP1mHvW55roGhbaOaIuqxAmMDkSKdpup4N/z870lHHpY6
   ULAVceW9GDhbhbKR2TEhrIrnsJGEy22HIJezGV4LaXeI3NTntIw8UwW4+
   +RV9ceS3pT+Jax1c866SbEYRsIDwH9mG6AFA/nKZqslm9puSoGdNQ0e2c
   PBsKwgm333QhPVa8YKjDg0nbPCEFQGKjSjvCEawkpqsuh5Qwc/AgEGO0y
   g==;
X-CSE-ConnectionGUID: UMdaZ7shRMmIJmkuQE+mFQ==
X-CSE-MsgGUID: A5g/Wf6FSdSR6VAiO4MtIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46984786"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="46984786"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 20:41:09 -0800
X-CSE-ConnectionGUID: eZpxHRdBSTuC5j0ixavqTQ==
X-CSE-MsgGUID: vQUSSXW4SVW2J5YJDH9RQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="104807107"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Dec 2024 20:41:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQfgH-0002LA-0W;
	Thu, 26 Dec 2024 04:41:05 +0000
Date: Thu, 26 Dec 2024 12:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1662/1662]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:458:8: error:
 call to undeclared function 'eventfd_ctx_fileget'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202412261254.xsAWHJld-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bennie,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   589aaab51b2a3b112b232f89fd29a5302222d946
commit: 69181c3c9413ccaa4dab458057d13efda520cb60 [1662/1662] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-103-20241226 (https://download.01.org/0day-ci/archive/20241226/202412261254.xsAWHJld-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412261254.xsAWHJld-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412261254.xsAWHJld-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:6:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_product_base.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_include.h:12:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:458:8: error: call to undeclared function 'eventfd_ctx_fileget'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     458 |         ctx = eventfd_ctx_fileget(eventfd.file);
         |               ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:458:8: note: did you mean 'eventfd_ctx_fdget'?
   include/linux/eventfd.h:56:35: note: 'eventfd_ctx_fdget' declared here
      56 | static inline struct eventfd_ctx *eventfd_ctx_fdget(int fd)
         |                                   ^
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:458:6: error: incompatible integer to pointer conversion assigning to 'struct eventfd_ctx *' from 'int' [-Wint-conversion]
     458 |         ctx = eventfd_ctx_fileget(eventfd.file);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:475:14: warning: variable 'hw_addr' set but not used [-Wunused-but-set-variable]
     475 |         u8 __iomem *hw_addr;
         |                     ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:676:23: warning: variable 'vfn' set but not used [-Wunused-but-set-variable]
     676 |         unsigned long vaddr, vfn;
         |                              ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:1181:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1181 |         if (dma_get_mask(dev) != DMA_BIT_MASK(64))
         |                                  ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   8 warnings and 2 errors generated.


vim +/eventfd_ctx_fileget +458 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c

bad535d287c9c1 Bennie Yan 2024-09-24  436  
bad535d287c9c1 Bennie Yan 2024-09-24  437  static long nbl_userdev_set_eventfd(struct nbl_adapter *adapter, unsigned long arg)
bad535d287c9c1 Bennie Yan 2024-09-24  438  {
bad535d287c9c1 Bennie Yan 2024-09-24  439  	struct nbl_dev_mgt *dev_mgt = (struct nbl_dev_mgt *)NBL_ADAPTER_TO_DEV_MGT(adapter);
bad535d287c9c1 Bennie Yan 2024-09-24  440  	struct nbl_dev_user *user = NBL_DEV_MGT_TO_USER_DEV(dev_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  441  	struct nbl_channel_ops *chan_ops = NBL_DEV_MGT_TO_CHAN_OPS(dev_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  442  	struct eventfd_ctx *ctx;
bad535d287c9c1 Bennie Yan 2024-09-24  443  	struct fd eventfd;
bad535d287c9c1 Bennie Yan 2024-09-24  444  	int fd;
bad535d287c9c1 Bennie Yan 2024-09-24  445  	long ret = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  446  
bad535d287c9c1 Bennie Yan 2024-09-24  447  	if (get_user(fd, (unsigned long __user *)arg)) {
bad535d287c9c1 Bennie Yan 2024-09-24  448  		dev_err(NBL_ADAPTER_TO_DEV(adapter), "get user fd failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  449  		return -EFAULT;
bad535d287c9c1 Bennie Yan 2024-09-24  450  	}
bad535d287c9c1 Bennie Yan 2024-09-24  451  
bad535d287c9c1 Bennie Yan 2024-09-24  452  	eventfd = fdget(fd);
bad535d287c9c1 Bennie Yan 2024-09-24  453  	if (!eventfd.file) {
bad535d287c9c1 Bennie Yan 2024-09-24  454  		dev_err(NBL_ADAPTER_TO_DEV(adapter), "get eventfd failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  455  		return -EBADF;
bad535d287c9c1 Bennie Yan 2024-09-24  456  	}
bad535d287c9c1 Bennie Yan 2024-09-24  457  
bad535d287c9c1 Bennie Yan 2024-09-24 @458  	ctx = eventfd_ctx_fileget(eventfd.file);
bad535d287c9c1 Bennie Yan 2024-09-24  459  	if (IS_ERR(ctx)) {
bad535d287c9c1 Bennie Yan 2024-09-24  460  		ret = PTR_ERR(ctx);
bad535d287c9c1 Bennie Yan 2024-09-24  461  		dev_err(NBL_ADAPTER_TO_DEV(adapter), "get eventfd ctx failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  462  		return ret;
bad535d287c9c1 Bennie Yan 2024-09-24  463  	}
bad535d287c9c1 Bennie Yan 2024-09-24  464  
bad535d287c9c1 Bennie Yan 2024-09-24  465  	chan_ops->set_listener_info(NBL_DEV_MGT_TO_CHAN_PRIV(dev_mgt), user->shm_msg_ring, ctx);
bad535d287c9c1 Bennie Yan 2024-09-24  466  
bad535d287c9c1 Bennie Yan 2024-09-24  467  	return ret;
bad535d287c9c1 Bennie Yan 2024-09-24  468  }
bad535d287c9c1 Bennie Yan 2024-09-24  469  

:::::: The code at line 458 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
