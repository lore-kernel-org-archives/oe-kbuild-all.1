Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51951D306
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 18:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679421853; x=1710957853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dV91F8PB8gBjebk1HHBCNq3X2X1VcC8xGlGVPyu4SQ8=;
  b=N9UveX4WzPACQY3q+FN5ahsh6jr+sBJbsS//m+kn07ar/UOeZLO5CY6t
   De1khoZq/Ij8xKP1iNsyqC+MqletPGGcPuuxWLIe4nR6smpOZLDaflX1t
   Rg1RXRm9RHJqNJdfbWRnk6fUN4UGgiKvVIInC71bfeKYPJRUKRKRusw5P
   g/xoNvTJNUouS0fMiGQQSQ7NNeCXs+8fMgujsQNliPVjIE1ds7raKkx79
   hCpWojpNd2SFlYkp/vyVr28kAtq2q1cmoc8aCsL4y1sHbPk1S4XcPX9lB
   4XaWi6F/XVjUCwh+zaEruXsCH3wyY5ACq0fYMNhyXn32bO9ZwFDChbZiM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401591101"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="401591101"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 11:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792197648"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="792197648"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 11:03:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pegKm-000CEs-01;
	Tue, 21 Mar 2023 18:03:44 +0000
Date: Wed, 22 Mar 2023 02:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: alikernel-developer@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alibaba-cloud:linux-next 8423/9999]
 drivers/infiniband/core/addr.c:473:13: warning: variable 'ret' set but not
 used
Message-ID: <202303220105.k4IYt222-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alibaba/cloud-kernel.git linux-next
head:   d121e0c25d1a19485d7f293b67901462bb1a6552
commit: d6d722c84c60b998067871f2d96e9dc4e5da706f [8423/9999] RDMA/core: Protect against changing dst->dev during destination resolve
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230322/202303220105.k4IYt222-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/alibaba/cloud-kernel/commit/d6d722c84c60b998067871f2d96e9dc4e5da706f
        git remote add alibaba-cloud https://github.com/alibaba/cloud-kernel.git
        git fetch --no-tags alibaba-cloud linux-next
        git checkout d6d722c84c60b998067871f2d96e9dc4e5da706f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/infiniband/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220105.k4IYt222-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/core/addr.c: In function 'copy_src_l2_addr':
>> drivers/infiniband/core/addr.c:473:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     473 |         int ret = 0;
         |             ^~~


vim +/ret +473 drivers/infiniband/core/addr.c

200298326b276d Matan Barak  2015-12-23  467  
d6d722c84c60b9 Parav Pandit 2018-09-05  468  static void copy_src_l2_addr(struct rdma_dev_addr *dev_addr,
23084924636ed4 Parav Pandit 2018-09-05  469  			     const struct sockaddr *dst_in,
d6d722c84c60b9 Parav Pandit 2018-09-05  470  			     const struct dst_entry *dst,
d6d722c84c60b9 Parav Pandit 2018-09-05  471  			     const struct net_device *ndev)
23084924636ed4 Parav Pandit 2018-09-05  472  {
23084924636ed4 Parav Pandit 2018-09-05 @473  	int ret = 0;
23084924636ed4 Parav Pandit 2018-09-05  474  
23084924636ed4 Parav Pandit 2018-09-05  475  	if (dst->dev->flags & IFF_LOOPBACK)
23084924636ed4 Parav Pandit 2018-09-05  476  		ret = rdma_translate_ip(dst_in, dev_addr);
23084924636ed4 Parav Pandit 2018-09-05  477  	else
0652a52eb6eec4 Parav Pandit 2018-09-05  478  		rdma_copy_src_l2_addr(dev_addr, dst->dev);
32fb22f5355899 Parav Pandit 2018-09-05  479  
32fb22f5355899 Parav Pandit 2018-09-05  480  	/*
32fb22f5355899 Parav Pandit 2018-09-05  481  	 * If there's a gateway and type of device not ARPHRD_INFINIBAND,
32fb22f5355899 Parav Pandit 2018-09-05  482  	 * we're definitely in RoCE v2 (as RoCE v1 isn't routable) set the
32fb22f5355899 Parav Pandit 2018-09-05  483  	 * network type accordingly.
32fb22f5355899 Parav Pandit 2018-09-05  484  	 */
32fb22f5355899 Parav Pandit 2018-09-05  485  	if (has_gateway(dst, dst_in->sa_family) &&
d6d722c84c60b9 Parav Pandit 2018-09-05  486  	    ndev->type != ARPHRD_INFINIBAND)
32fb22f5355899 Parav Pandit 2018-09-05  487  		dev_addr->network = dst_in->sa_family == AF_INET ?
32fb22f5355899 Parav Pandit 2018-09-05  488  						RDMA_NETWORK_IPV4 :
32fb22f5355899 Parav Pandit 2018-09-05  489  						RDMA_NETWORK_IPV6;
32fb22f5355899 Parav Pandit 2018-09-05  490  	else
32fb22f5355899 Parav Pandit 2018-09-05  491  		dev_addr->network = RDMA_NETWORK_IB;
d6d722c84c60b9 Parav Pandit 2018-09-05  492  }
32fb22f5355899 Parav Pandit 2018-09-05  493  

:::::: The code at line 473 was first introduced by commit
:::::: 23084924636ed44eaea811f8d28c5f80dbb76461 RDMA/core: Introduce and use rdma_set_src_addr() between IPv4 and IPv6

:::::: TO: Parav Pandit <parav@mellanox.com>
:::::: CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
