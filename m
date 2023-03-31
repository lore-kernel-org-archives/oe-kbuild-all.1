Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3540C23BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 10:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680258154; x=1711794154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NdfR3OoC8Ca6LP/rVQdqit+aFh6X6Q3dj5wvncoIjms=;
  b=PAuaMNi/P0Tcb1CGWs4V2V3KMN3T8cYGCKyBV8XWigCSXR4NYeuHNgK5
   hkKZkJboWM+QyBEFDW0sSpoywbkLS4N+qtBb/OTKt2ZPIPxbRcbC2+53Y
   /CCLs/ZHRbGQfWSOQMJugDZFMtwcTe5JeTGtMqlipX0GBpEQVc+HqbcD/
   lG8dAxjYcLrRAuaP3sz6ecjnQAv+v09B4KBKk+2WUEMLJgK4QD60tCIjf
   vJS/zkdNfAmEtBJTzPzdGLQjQuMMhPNjnHz9l0qkPyVmcrI+Xk0rkWhTE
   A5xalpxxPmAi4UJ3V2o/cwCDszSNM0DVCWedphWlzU7pOHkaOg6iK6gam
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="325382911"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="325382911"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 03:22:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="774310983"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="774310983"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Mar 2023 03:22:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piBtv-000LgM-1v;
	Fri, 31 Mar 2023 10:22:31 +0000
Date: Fri, 31 Mar 2023 18:21:46 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 net-next 1/2] net: ethernet: mtk_eth_soc: add code for
 offloading flows from wlan devices
Message-ID: <202303311824.XkRWga6s-lkp@intel.com>
References: <20230331082841.74991-1-nbd@nbd.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331082841.74991-1-nbd@nbd.name>

Hi Felix,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Fietkau/net-ethernet-mtk_eth_soc-mtk_ppe-prefer-newly-added-l2-flows/20230331-163040
patch link:    https://lore.kernel.org/r/20230331082841.74991-1-nbd%40nbd.name
patch subject: [PATCH v2 net-next 1/2] net: ethernet: mtk_eth_soc: add code for offloading flows from wlan devices
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230331/202303311824.XkRWga6s-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a47c5a04b481ded12c124e50e71e0da448df897a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Felix-Fietkau/net-ethernet-mtk_eth_soc-mtk_ppe-prefer-newly-added-l2-flows/20230331-163040
        git checkout a47c5a04b481ded12c124e50e71e0da448df897a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303311824.XkRWga6s-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_ppe_offload.c: In function 'mtk_eth_setup_tc_block_cb':
>> drivers/net/ethernet/mediatek/mtk_ppe_offload.c:554:43: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     554 |         struct mtk_mac *mac = netdev_priv(dev);
         |                                           ^~~
         |                                           cdev
   drivers/net/ethernet/mediatek/mtk_ppe_offload.c:554:43: note: each undeclared identifier is reported only once for each function it appears in


vim +554 drivers/net/ethernet/mediatek/mtk_ppe_offload.c

   549	
   550	static int
   551	mtk_eth_setup_tc_block_cb(enum tc_setup_type type, void *type_data, void *cb_priv)
   552	{
   553		struct flow_cls_offload *cls = type_data;
 > 554		struct mtk_mac *mac = netdev_priv(dev);
   555		struct net_device *dev = cb_priv;
   556		struct mtk_eth *eth = mac->hw;
   557	
   558		if (!tc_can_offload(dev))
   559			return -EOPNOTSUPP;
   560	
   561		if (type != TC_SETUP_CLSFLOWER)
   562			return -EOPNOTSUPP;
   563	
   564		return mtk_flow_offload_cmd(eth, cls, 0);
   565	}
   566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
