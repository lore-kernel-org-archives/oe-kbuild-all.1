Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B101C04
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jul 2023 12:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688300079; x=1719836079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7pNlH+ItTnmMmijBkDqdEWFvGer0ufUfF6gr+VFAAsg=;
  b=kcQCwDyiNqlq4+Gm8/0yx/GI9Rn8bCTedi53/X1sy2nuVAOduV1BkQW8
   cuHqm52qqediARTXn4jmmU4WPKBJIovosyGZAfStfkj3djmeNYHeUdbo5
   1JI2hPvLrgN/IGgzwTWBS2U7UT0FqDHq2ILx5axn0QByX5N6Vh2hEELr2
   eC02QSasNHDpUCFmE9rdRydCRPxfaiJ9JzWR60RjQ9HfvJ1MZWfuuAO2J
   puzkrfGVTN8lt1BJPRV6NtaY2kAmlWt3FBGx+vbDjRT2MZFAqrayiVx9Q
   E+Vj5FobJZ7nBNljnab6aaV5RaNdIrZFpFLGxaNiNkYIl0Aj9B5TDC/8x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="347475993"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="347475993"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 05:14:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="747878324"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="747878324"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Jul 2023 05:14:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFvyP-000GdD-1P;
	Sun, 02 Jul 2023 12:14:37 +0000
Date: Sun, 2 Jul 2023 20:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:virt_to_page_dma_map 2/2]
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:102:16: error:
 implicit declaration of function 'dma_dma_map_page_attrs'; did you mean
 'dma_unmap_page_attrs'?
Message-ID: <202307022021.3FbGjQVg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git virt_to_page_dma_map
head:   bdadb716f811b19b48c3f3290584f0fac4daef12
commit: 7c2f0b0ae7911f2598b33eae4134e15a54cfe457 [2/2] octeontx2-pf: remove virt_to_page() in dma mapping operation
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230702/202307022021.3FbGjQVg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230702/202307022021.3FbGjQVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307022021.3FbGjQVg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c: In function 'otx2_dma_map_skb_frag':
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:102:16: error: implicit declaration of function 'dma_dma_map_page_attrs'; did you mean 'dma_unmap_page_attrs'? [-Werror=implicit-function-declaration]
     102 |         return dma_dma_map_page_attrs(pfvf->dev, page, offset, *len,
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                dma_unmap_page_attrs
   cc1: some warnings being treated as errors


vim +102 drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c

    81	
    82	static dma_addr_t otx2_dma_map_skb_frag(struct otx2_nic *pfvf,
    83						struct sk_buff *skb, int seg, int *len)
    84	{
    85		const skb_frag_t *frag;
    86		struct page *page;
    87		int offset;
    88	
    89		/* First segment is always skb->data */
    90		if (!seg) {
    91			*len = skb_headlen(skb);
    92			return dma_map_single_attrs(pfvf->dev, skb->data, *len,
    93						    DMA_TO_DEVICE,
    94						    DMA_ATTR_SKIP_CPU_SYNC);
    95		}
    96	
    97		frag = &skb_shinfo(skb)->frags[seg - 1];
    98		page = skb_frag_page(frag);
    99		offset = skb_frag_off(frag);
   100		*len = skb_frag_size(frag);
   101	
 > 102		return dma_dma_map_page_attrs(pfvf->dev, page, offset, *len,
   103					      DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
