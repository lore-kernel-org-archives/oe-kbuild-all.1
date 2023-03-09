Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF862F3A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 08:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678350559; x=1709886559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7eLkM3eExnOAEHuzBRl4HrhYD28cOXPWFS8ppY2oubw=;
  b=T9wUkJIZ6X2NXP8lCZkHHcvMTaycZJJaQFoq41oQskIOKKhf2eHfTY7w
   EIRo7BXTZK6DwSVQM4z8qgCXt69WNV0PIXkO7kjiEgk8u+q3TVVGMeNDl
   jZKw0T4dhCOSOqhT30blKPMlb8l1sEmLVnnve804vldQJz7irVa/Kj6AP
   gD6u/d3g0GzNNS7Gmc4Bu9Xfx0E6rTN/rjg8t17IQsmWF6/0W2n+KttPj
   7zEOMcgzJaCD9UixS2LciVihF/xssjZoFN8RB2QTOAoeKUG5oBdSN/fiY
   QUCI86h8jL9CU794oYvhBnjaKDnwCZ01Dijb0ZP/HjK6r93qhiVBwD8lE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333857806"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="333857806"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 00:29:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="746232564"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="746232564"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2023 00:29:16 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paBeG-0002nr-0J;
	Thu, 09 Mar 2023 08:29:16 +0000
Date: Thu, 9 Mar 2023 16:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c:1087:28: warning:
 'tracker' is used uninitialized
Message-ID: <202303091658.YVmA2chk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a98c9cae232800c319ed69e1063480d31430887
commit: 41596803302d83a67a80dc1efef4e51ac46acabb LoongArch: Make -mstrict-align configurable
date:   12 days ago
config: loongarch-randconfig-r033-20230309 (https://download.01.org/0day-ci/archive/20230309/202303091658.YVmA2chk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41596803302d83a67a80dc1efef4e51ac46acabb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 41596803302d83a67a80dc1efef4e51ac46acabb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091658.YVmA2chk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c: In function 'mlx5_lag_netdev_event':
>> drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c:1087:28: warning: 'tracker' is used uninitialized [-Wuninitialized]
    1087 |         struct lag_tracker tracker;
         |                            ^~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c:1087:28: note: 'tracker' declared here
    1087 |         struct lag_tracker tracker;
         |                            ^~~~~~~


vim +/tracker +1087 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c

54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1081  
94db3317781922 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Eli Cohen   2022-01-31  1082  /* this handler is always registered to netdev events */
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1083  static int mlx5_lag_netdev_event(struct notifier_block *this,
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1084  				 unsigned long event, void *ptr)
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1085  {
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1086  	struct net_device *ndev = netdev_notifier_info_to_dev(ptr);
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17 @1087  	struct lag_tracker tracker;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1088  	struct mlx5_lag *ldev;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1089  	int changed = 0;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1090  
54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1091  	if (event != NETDEV_CHANGEUPPER &&
54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1092  	    event != NETDEV_CHANGELOWERSTATE &&
54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1093  	    event != NETDEV_CHANGEINFODATA)
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1094  		return NOTIFY_DONE;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1095  
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1096  	ldev    = container_of(this, struct mlx5_lag, nb);
9b412cc35f0025 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Jianbo Liu  2020-04-17  1097  
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1098  	tracker = ldev->tracker;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1099  
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1100  	switch (event) {
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1101  	case NETDEV_CHANGEUPPER:
a4a9c87ebb689c drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Eli Cohen   2022-02-06  1102  		changed = mlx5_handle_changeupper_event(ldev, &tracker, ptr);
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1103  		break;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1104  	case NETDEV_CHANGELOWERSTATE:
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1105  		changed = mlx5_handle_changelowerstate_event(ldev, &tracker,
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1106  							     ndev, ptr);
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1107  		break;
54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1108  	case NETDEV_CHANGEINFODATA:
54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1109  		changed = mlx5_handle_changeinfodata_event(ldev, &tracker, ndev);
54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1110  		break;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1111  	}
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1112  
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1113  	ldev->tracker = tracker;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1114  
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1115  	if (changed)
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1116  		mlx5_queue_bond_work(ldev, 0);
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1117  
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1118  	return NOTIFY_DONE;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1119  }
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1120  

:::::: The code at line 1087 was first introduced by commit
:::::: 7907f23adc186700efbe56c032527e47485c86ab net/mlx5: Implement RoCE LAG feature

:::::: TO: Aviv Heller <avivh@mellanox.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
