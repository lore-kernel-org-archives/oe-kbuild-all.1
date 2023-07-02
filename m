Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE06A31
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jul 2023 06:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688279373; x=1719815373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DuMB1/RVpXcCjf6iv3t2KtEG53jlLCwbeM+bbVtBumU=;
  b=BPgw5rO9uJOBSpHCWTCAcMTZBhU5dJ/S+8rmYPiyoddLeeeIzwRK/Hoh
   1aVe3aVNoH70tvv41XQsbvh++IK5Jrq81hJr4wiN9vRgtTHGbmzxbB7/+
   SR5FCMx+q450i+hKrzZovSQvnXQfk6DJaib8lt4sXqdqKHqm8YkMWXMbI
   qIxtCB3apnO4esacYk7lLBt4Nl8mOHb6+pnlFrPi15qyQQwcShKuBjk/H
   9CNl8BrKJoMRS4uWaBpnHA3m7/jW7z8KA5DsPZHdu0JjVfA8Ov5vovUJt
   lLUDEIq/t44sv92iUYx8G2j1xYwjI7wLqOTY3cK+VrrdzI4T46b0fnGoT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="426356047"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="426356047"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 23:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="747820532"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="747820532"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Jul 2023 23:29:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFqaQ-000GUw-1f;
	Sun, 02 Jul 2023 06:29:30 +0000
Date: Sun, 2 Jul 2023 14:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:virt_to_page_dma_map 1/1]
 drivers/net/ethernet/alteon/acenic.c:2366:47: error: macro "dma_map_single"
 requires 4 arguments, but only 3 given
Message-ID: <202307021427.3tleoyTJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git virt_to_page_dma_map
head:   b2c7def6da56656169a0978e4e8b627685d5fa13
commit: b2c7def6da56656169a0978e4e8b627685d5fa13 [1/1] net: remove virt_to_page when dma mapping
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230702/202307021427.3tleoyTJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230702/202307021427.3tleoyTJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307021427.3tleoyTJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/alteon/acenic.c: In function 'ace_map_tx_skb':
>> drivers/net/ethernet/alteon/acenic.c:2366:47: error: macro "dma_map_single" requires 4 arguments, but only 3 given
    2366 |                                  DMA_TO_DEVICE);
         |                                               ^
   In file included from include/linux/pci.h:2592,
                    from drivers/net/ethernet/alteon/acenic.c:54:
   include/linux/dma-mapping.h:411: note: macro "dma_map_single" defined here
     411 | #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
         | 
>> drivers/net/ethernet/alteon/acenic.c:2365:19: error: 'dma_map_single' undeclared (first use in this function); did you mean 'dma_map_sgtable'?
    2365 |         mapping = dma_map_single(&ap->pdev->dev, skb->data skb->len,
         |                   ^~~~~~~~~~~~~~
         |                   dma_map_sgtable
   drivers/net/ethernet/alteon/acenic.c:2365:19: note: each undeclared identifier is reported only once for each function it appears in


vim +/dma_map_single +2366 drivers/net/ethernet/alteon/acenic.c

^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2356  
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2357  
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2358  static inline dma_addr_t
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2359  ace_map_tx_skb(struct ace_private *ap, struct sk_buff *skb,
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2360  	       struct sk_buff *tail, u32 idx)
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2361  {
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2362  	dma_addr_t mapping;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2363  	struct tx_ring_info *info;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2364  
b2c7def6da5665 drivers/net/ethernet/alteon/acenic.c Yunsheng Lin       2023-07-02 @2365  	mapping = dma_map_single(&ap->pdev->dev, skb->data skb->len,
f4079e5d72ff97 drivers/net/ethernet/alteon/acenic.c Christophe JAILLET 2020-07-16 @2366  				 DMA_TO_DEVICE);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2367  
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2368  	info = ap->skb->tx_skbuff + idx;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2369  	info->skb = tail;
430e55b11e9756 drivers/net/acenic.c                 FUJITA Tomonori    2010-03-31  2370  	dma_unmap_addr_set(info, mapping, mapping);
430e55b11e9756 drivers/net/acenic.c                 FUJITA Tomonori    2010-03-31  2371  	dma_unmap_len_set(info, maplen, skb->len);
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2372  	return mapping;
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2373  }
^1da177e4c3f41 drivers/net/acenic.c                 Linus Torvalds     2005-04-16  2374  

:::::: The code at line 2366 was first introduced by commit
:::::: f4079e5d72ff973a8c2937e7aa9fc463dc6bcaa2 net: alteon: switch from 'pci_' to 'dma_' API

:::::: TO: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
