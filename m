Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E2829A8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 15:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681486723; x=1713022723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OnHy1NRqgTwaRpDZk1K6ayQ+Hbh3z55YhxtRAI9DM18=;
  b=K4mW/sB960hiG8gZtKnne2evvRqz3l/Awpv/3Cek6ftBj4ZiOfUYr5Za
   /YST+JP1UBLkpPA7XAh2t3yjnRUBbLMYO0aLUvXiFAJsp4xgzclqEsf8+
   GJNeUe/Fy2xvGtJgrGfAnQ2jWCCvzNHAt7rt/qx32ySgdNdOTwWwtc3Xg
   j3CMQ7LZqR/jgI4gobWURjaYiYRDgXLvetrrSd1kecojfnMCbR72KhvDz
   NOCQd2buahcjfqyAvFHxPr9NV0pta8QVfzV/4MLwuVJZLeresl3/GRqYY
   TpNSa0A9kbKREmfVU0054KWxxCLFPCec/0I3xXCP/s+QscVmDXp4mGMUF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="328642222"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="328642222"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 08:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722491243"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="722491243"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Apr 2023 08:38:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnLVU-000Zg1-0j;
	Fri, 14 Apr 2023 15:38:36 +0000
Date: Fri, 14 Apr 2023 23:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Larysa Zaremba <larysa.zaremba@intel.com>
Subject: [alobakin:pr/19 10/25]
 drivers/net/ethernet/intel/iavf/iavf_main.c:1435:6: warning: no previous
 prototype for 'iavf_stop_traffic'
Message-ID: <202304142304.dQ12hJF1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pr/19
head:   f71cafea4b538c1b76bcd74d720368a12d0d5624
commit: 9f85b9dbd42d49a98401291b1446ef0bb49131a8 [10/25] iavf: Handle XDP_SETUP_PROG command in .ndo_bpf
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230414/202304142304.dQ12hJF1-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alobakin/linux/commit/9f85b9dbd42d49a98401291b1446ef0bb49131a8
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin pr/19
        git checkout 9f85b9dbd42d49a98401291b1446ef0bb49131a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/net/ethernet/intel/iavf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304142304.dQ12hJF1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/iavf/iavf_main.c:1435:6: warning: no previous prototype for 'iavf_stop_traffic' [-Wmissing-prototypes]
    1435 | void iavf_stop_traffic(struct iavf_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/iavf/iavf_main.c:1450:6: warning: no previous prototype for 'iavf_start_traffic' [-Wmissing-prototypes]
    1450 | void iavf_start_traffic(struct iavf_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~


vim +/iavf_stop_traffic +1435 drivers/net/ethernet/intel/iavf/iavf_main.c

  1430	
  1431	/**
  1432	 * iavf_stop_traffic - Stop NAPI and interrupts before link down
  1433	 * @adapter: board private structure
  1434	 */
> 1435	void iavf_stop_traffic(struct iavf_adapter *adapter)
  1436	{
  1437		struct net_device *netdev = adapter->netdev;
  1438	
  1439		netif_carrier_off(netdev);
  1440		netif_tx_disable(netdev);
  1441		adapter->link_up = false;
  1442		iavf_napi_disable_all(adapter);
  1443		iavf_irq_disable(adapter);
  1444	}
  1445	
  1446	/**
  1447	 * iavf_start_traffic - Start NAPI and interrupts after link up
  1448	 * @adapter: board private structure
  1449	 */
> 1450	void iavf_start_traffic(struct iavf_adapter *adapter)
  1451	{
  1452		struct net_device *netdev = adapter->netdev;
  1453	
  1454		iavf_napi_enable_all(adapter);
  1455		iavf_irq_enable(adapter, true);
  1456		adapter->link_up = true;
  1457		netif_tx_start_all_queues(netdev);
  1458		netif_carrier_on(netdev);
  1459	}
  1460	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
