Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E161173
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 00:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680912135; x=1712448135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vI+1gdneaOcXG4G/SUHIU0kNC2E0dYGuegy5BAfxmP4=;
  b=f19waCpllBiAoNA2XNdX6zk97znTxV7gzDPWxUmuLq5WlZbnNT4YBFAw
   ECYSnDKWYKCeZWzYtvdViDM8ez6PU1fv8Isdpd/792CwIiv7yFilEdAGJ
   y4dTwGlRvlJ4ZVJ6Ln9wwb5l1ULpzuM4Pe/sLNbh/+MzoiPXe6JUIGXxQ
   +ufD/B/Yz9AQysYrSVVXgRBLq1wzEBqfpU0MLz/nwKndIGK/IWq8I7yRt
   3DnJTjtHN5VjkzxxDxlsKcxHI60MsvwfvgZ6KrXDls2gJmmMjUI8xyf/M
   LGrru7vWqB54o8O3W8cyeHj3Ku2Qf28Y5TANn1yB7FMqUC4IiyeCEhwCB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="370924164"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="370924164"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 17:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="717984091"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="717984091"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Apr 2023 17:02:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkw20-000T18-0n;
	Sat, 08 Apr 2023 00:02:12 +0000
Date: Sat, 8 Apr 2023 08:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 169/213]
 drivers/net/ethernet/ti/j721e-cpsw-virt-mac.c:851:33: error: implicit
 declaration of function 'u64_stats_fetch_begin_irq'; did you mean
 'u64_stats_fetch_begin'?
Message-ID: <202304080707.s3lya01t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   4921e3af7003ec7365b16a51252a8318739753e7
commit: 3919c6c183e52f26bc6c2067f94dc561e69542f4 [169/213] Merge branch 'ti-linux-6.1.y-cicd' of git://git.ti.com/ti-linux-kernel/ti-linux-kernel into ti-rt-linux-6.1.y-cicd
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080707.s3lya01t-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 3919c6c183e52f26bc6c2067f94dc561e69542f4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080707.s3lya01t-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/ti/j721e-cpsw-virt-mac.c: In function 'virt_cpsw_nuss_ndo_get_stats':
>> drivers/net/ethernet/ti/j721e-cpsw-virt-mac.c:851:33: error: implicit declaration of function 'u64_stats_fetch_begin_irq'; did you mean 'u64_stats_fetch_begin'? [-Werror=implicit-function-declaration]
     851 |                         start = u64_stats_fetch_begin_irq(&cpu_stats->syncp);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 u64_stats_fetch_begin
>> drivers/net/ethernet/ti/j721e-cpsw-virt-mac.c:856:26: error: implicit declaration of function 'u64_stats_fetch_retry_irq'; did you mean 'u64_stats_fetch_retry'? [-Werror=implicit-function-declaration]
     856 |                 } while (u64_stats_fetch_retry_irq(&cpu_stats->syncp, start));
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                          u64_stats_fetch_retry
   cc1: some warnings being treated as errors


vim +851 drivers/net/ethernet/ti/j721e-cpsw-virt-mac.c

3fed924f0c664f Grygorii Strashko 2023-03-28  834  
3fed924f0c664f Grygorii Strashko 2023-03-28  835  static void virt_cpsw_nuss_ndo_get_stats(struct net_device *dev,
3fed924f0c664f Grygorii Strashko 2023-03-28  836  					 struct rtnl_link_stats64 *stats)
3fed924f0c664f Grygorii Strashko 2023-03-28  837  {
3fed924f0c664f Grygorii Strashko 2023-03-28  838  	struct virt_cpsw_ndev_priv *ndev_priv = netdev_priv(dev);
3fed924f0c664f Grygorii Strashko 2023-03-28  839  	unsigned int start;
3fed924f0c664f Grygorii Strashko 2023-03-28  840  	int cpu;
3fed924f0c664f Grygorii Strashko 2023-03-28  841  
3fed924f0c664f Grygorii Strashko 2023-03-28  842  	for_each_possible_cpu(cpu) {
3fed924f0c664f Grygorii Strashko 2023-03-28  843  		struct virt_cpsw_ndev_stats *cpu_stats;
3fed924f0c664f Grygorii Strashko 2023-03-28  844  		u64 rx_packets;
3fed924f0c664f Grygorii Strashko 2023-03-28  845  		u64 rx_bytes;
3fed924f0c664f Grygorii Strashko 2023-03-28  846  		u64 tx_packets;
3fed924f0c664f Grygorii Strashko 2023-03-28  847  		u64 tx_bytes;
3fed924f0c664f Grygorii Strashko 2023-03-28  848  
3fed924f0c664f Grygorii Strashko 2023-03-28  849  		cpu_stats = per_cpu_ptr(ndev_priv->stats, cpu);
3fed924f0c664f Grygorii Strashko 2023-03-28  850  		do {
3fed924f0c664f Grygorii Strashko 2023-03-28 @851  			start = u64_stats_fetch_begin_irq(&cpu_stats->syncp);
3fed924f0c664f Grygorii Strashko 2023-03-28  852  			rx_packets = cpu_stats->rx_packets;
3fed924f0c664f Grygorii Strashko 2023-03-28  853  			rx_bytes   = cpu_stats->rx_bytes;
3fed924f0c664f Grygorii Strashko 2023-03-28  854  			tx_packets = cpu_stats->tx_packets;
3fed924f0c664f Grygorii Strashko 2023-03-28  855  			tx_bytes   = cpu_stats->tx_bytes;
3fed924f0c664f Grygorii Strashko 2023-03-28 @856  		} while (u64_stats_fetch_retry_irq(&cpu_stats->syncp, start));
3fed924f0c664f Grygorii Strashko 2023-03-28  857  
3fed924f0c664f Grygorii Strashko 2023-03-28  858  		stats->rx_packets += rx_packets;
3fed924f0c664f Grygorii Strashko 2023-03-28  859  		stats->rx_bytes   += rx_bytes;
3fed924f0c664f Grygorii Strashko 2023-03-28  860  		stats->tx_packets += tx_packets;
3fed924f0c664f Grygorii Strashko 2023-03-28  861  		stats->tx_bytes   += tx_bytes;
3fed924f0c664f Grygorii Strashko 2023-03-28  862  	}
3fed924f0c664f Grygorii Strashko 2023-03-28  863  
3fed924f0c664f Grygorii Strashko 2023-03-28  864  	stats->rx_errors	= dev->stats.rx_errors;
3fed924f0c664f Grygorii Strashko 2023-03-28  865  	stats->rx_dropped	= dev->stats.rx_dropped;
3fed924f0c664f Grygorii Strashko 2023-03-28  866  	stats->tx_dropped	= dev->stats.tx_dropped;
3fed924f0c664f Grygorii Strashko 2023-03-28  867  }
3fed924f0c664f Grygorii Strashko 2023-03-28  868  

:::::: The code at line 851 was first introduced by commit
:::::: 3fed924f0c664f5f28d3eae9f62d20d773f0a87c net: ethernet: ti: introduce j721e virt cpsw-nuss mac driver

:::::: TO: Grygorii Strashko <grygorii.strashko@ti.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
