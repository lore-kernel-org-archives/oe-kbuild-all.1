Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829468BE8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 19:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686598920; x=1718134920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3rkCwx2jHB0mCEHORkMw1A0jd8yd/uoMww3NUDqd7AU=;
  b=KwwNkOkBEZzXsn4M2unJeKH3N8csr4iyxMfK2BJMcDHT1msYXy14yXL5
   keMkRKnkZYzeOooch7omagOPULx1hGXwdHxMaXCwc1/XHUtWEzC4JsyjI
   ZtMUf+5luEjnHaiknbDmewa3lXNaE+bVfyA9kCLEvjt25T6gh4j7PklvT
   v+eOEYCzw3b6x7g/kHZ8ErlwDG6qYugLydVQs3I2EtvxKlnDCK8xxUQk4
   9QW4E8XylpVx88lbV4RtUqkATtWwib1TQF6Dj1BEEJodwT5F4RH+KB+y6
   R4OFElJRKTuopygTmXibU0HotlkjSb3ff8mSJmDHmWxLLOBwgycXTaqkf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="444524367"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="444524367"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 12:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="1041468453"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="1041468453"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jun 2023 12:41:58 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8nQL-0000cw-26;
	Mon, 12 Jun 2023 19:41:57 +0000
Date: Tue, 13 Jun 2023 03:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 3/3]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:764:62: warning: implicit
 conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction'
Message-ID: <202306130308.SCnGodxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   008dab8f0109b0f762a72a01e3ffa8a334ec447b
commit: 008dab8f0109b0f762a72a01e3ffa8a334ec447b [3/3] net: axienet: Introduce dmaengine support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230613/202306130308.SCnGodxn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/008dab8f0109b0f762a72a01e3ffa8a334ec447b
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx lkp_test
        git checkout 008dab8f0109b0f762a72a01e3ffa8a334ec447b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130308.SCnGodxn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/skbuff.h:28,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/ethernet/xilinx/xilinx_axienet_main.c:27:
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_dma_tx_cb':
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:764:62: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     764 |         dma_unmap_sg(lp->dev, axi_skb->sgl, axi_skb->sg_len, DMA_MEM_TO_DEV);
         |                                                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:414:62: note: in definition of macro 'dma_unmap_sg'
     414 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^


vim +764 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

   744	
   745	/**
   746	 * axienet_dma_tx_cb - DMA engine callback for TX channel.
   747	 * @data:       Pointer to the axi_skbuff structure
   748	 * @result:     error reporting through dmaengine_result.
   749	 * This function is called by dmaengine driver for TX channel to notify
   750	 * that the transmit is done.
   751	 */
   752	static void axienet_dma_tx_cb(void *data, const struct dmaengine_result *result)
   753	{
   754		struct axi_skbuff *axi_skb = data;
   755	
   756		struct net_device *netdev = axi_skb->skb->dev;
   757		struct axienet_local *lp = netdev_priv(netdev);
   758	
   759		u64_stats_update_begin(&lp->tx_stat_sync);
   760		u64_stats_add(&lp->tx_bytes, axi_skb->skb->len);
   761		u64_stats_add(&lp->tx_packets, 1);
   762		u64_stats_update_end(&lp->tx_stat_sync);
   763	
 > 764		dma_unmap_sg(lp->dev, axi_skb->sgl, axi_skb->sg_len, DMA_MEM_TO_DEV);
   765		dev_kfree_skb_any(axi_skb->skb);
   766		kmem_cache_free(lp->skb_cache, axi_skb);
   767	}
   768	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
