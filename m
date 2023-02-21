Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8304710F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 06:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676959256; x=1708495256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iBdzoFb6hUIA4NzWT0fEJU6GzL5UGCBzoozQvvx9dnc=;
  b=Lwtx9VptO4DWiOADEbHW2ys+LfutbFh1Jgp894sHB/futQakto5RE838
   O1LqEzyqW+mZkPv1E8qLcIkER/wMe6TLkonZ2aqH+HZiyKEnFN/pPpgi8
   U8sxkMBC3trkFfYq5ZB41JkimA9l8V1Bq/FV5Ha89icoKDGsXlwprS3j3
   GyWn28/7paRxVLqqW5mg/uN/Djo/b8xScNWfJPGjBsEAWKqGu4vssntW6
   6gDf1EqPiB4aUqbyd3ysoeDLExkv6Oge631ajkhnEXS4G/yzWg6A31YC7
   0ssW5dreN2uZ8t+qmxRq+5v84GvrnyJoEma+jKGt7idNpk/SO9+h0bjxq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="316271229"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="316271229"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 22:00:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="740282227"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="740282227"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Feb 2023 22:00:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pULhm-000EVJ-2t;
	Tue, 21 Feb 2023 06:00:46 +0000
Date: Tue, 21 Feb 2023 14:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:sa1100 46/51] drivers/net/ethernet/3com/3c589_cs.c:224:9:
 error: too many arguments to function 'netif_napi_add'
Message-ID: <202302211344.hlHJKg6l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm sa1100
head:   3b773203fd7374c09a78d11f248e89289a8fb87b
commit: b292be0bef98aac54dc74812e6e4e79a22b008fe [46/51] net: 3c589_cs: convert to NAPI
config: alpha-buildonly-randconfig-r001-20230220 (https://download.01.org/0day-ci/archive/20230221/202302211344.hlHJKg6l-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm sa1100
        git checkout b292be0bef98aac54dc74812e6e4e79a22b008fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/ethernet/3com/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302211344.hlHJKg6l-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/3com/3c589_cs.c: In function 'tc589_probe':
>> drivers/net/ethernet/3com/3c589_cs.c:224:9: error: too many arguments to function 'netif_napi_add'
     224 |         netif_napi_add(dev, &lp->napi, el3_napi_poll, NAPI_POLL_WEIGHT);
         |         ^~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/3com/3c589_cs.c:37:
   include/linux/netdevice.h:2586:1: note: declared here
    2586 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         | ^~~~~~~~~~~~~~


vim +/netif_napi_add +224 drivers/net/ethernet/3com/3c589_cs.c

   196	
   197	static int tc589_probe(struct pcmcia_device *link)
   198	{
   199		struct el3_private *lp;
   200		struct net_device *dev;
   201	
   202		dev_dbg(&link->dev, "3c589_attach()\n");
   203	
   204		/* Create new ethernet device */
   205		dev = alloc_etherdev(sizeof(struct el3_private));
   206		if (!dev)
   207			return -ENOMEM;
   208		lp = netdev_priv(dev);
   209		link->priv = dev;
   210		lp->p_dev = link;
   211	
   212		spin_lock_init(&lp->lock);
   213		link->resource[0]->end = 16;
   214		link->resource[0]->flags |= IO_DATA_PATH_WIDTH_16;
   215	
   216		link->config_flags |= CONF_ENABLE_IRQ;
   217		link->config_index = 1;
   218	
   219		dev->netdev_ops = &el3_netdev_ops;
   220		dev->watchdog_timeo = TX_TIMEOUT;
   221	
   222		dev->ethtool_ops = &netdev_ethtool_ops;
   223	
 > 224		netif_napi_add(dev, &lp->napi, el3_napi_poll, NAPI_POLL_WEIGHT);
   225	
   226		return tc589_config(link);
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
