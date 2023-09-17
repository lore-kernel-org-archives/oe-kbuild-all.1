Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA71E7469
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Sep 2023 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694989490; x=1726525490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BI1fkCip+3dhigXyARRWJIfnjO49jU6wvjE25MxJhq4=;
  b=S0y/fL+cobQ48bACvApnYamiz5oOkYOV2CcSNn3vaR4aLs4OuG4myhFe
   QI+Dpv7J2cxVEbV0UxUyAU7GnEU7z1uubPFdUk2eBoY1FaFq4D8bFjIFw
   mrDs6syfmX/9YrgMYqxHobZYoOY9RT5hqsyhQHO2r7NQ5BVjoY0jO81BP
   U541uYrwNjsr7ylDTuchVXSo0I9Cwz7z6a7Z1Ivkkh3EDA+rxsL8zXiNU
   wHP3R8xJPAA2SfJAu2WmPXRdomkifZl44PU/HUpMaJrsFBhDSDpWK+W0r
   084komW+w2o4Bciqu3SKj5H5HML+cxJMd82a8DOdf3ywqlRFwTeFe+hrU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="376851723"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="376851723"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 15:24:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="919257610"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="919257610"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Sep 2023 15:24:48 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qi0C6-0005Vg-0B;
	Sun, 17 Sep 2023 22:24:46 +0000
Date: Mon, 18 Sep 2023 06:24:10 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:364:40: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202309180636.BDozYbf4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e789286468a9ea7acb5aae09a11bdfc7d46874ec
commit: d636fc5dd692c8f4e00ae6e0359c0eceeb5d9bdb net: sched: add rcu annotations around qdisc->qdisc_sleeping
date:   3 months ago
config: i386-randconfig-063-20230918 (https://download.01.org/0day-ci/archive/20230918/202309180636.BDozYbf4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230918/202309180636.BDozYbf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309180636.BDozYbf4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:364:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct Qdisc *qdisc @@     got struct Qdisc [noderef] __rcu *qdisc_sleeping @@
   drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:364:40: sparse:     expected struct Qdisc *qdisc
   drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:364:40: sparse:     got struct Qdisc [noderef] __rcu *qdisc_sleeping

vim +364 drivers/net/ethernet/mellanox/mlx5/core/en/qos.c

214baf22870cfa Maxim Mikityanskiy 2021-01-19  360  
462b0059993696 Moshe Tal          2022-05-02  361  void mlx5e_reset_qdisc(struct net_device *dev, u16 qid)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  362  {
214baf22870cfa Maxim Mikityanskiy 2021-01-19  363  	struct netdev_queue *dev_queue = netdev_get_tx_queue(dev, qid);
214baf22870cfa Maxim Mikityanskiy 2021-01-19 @364  	struct Qdisc *qdisc = dev_queue->qdisc_sleeping;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  365  
214baf22870cfa Maxim Mikityanskiy 2021-01-19  366  	if (!qdisc)
214baf22870cfa Maxim Mikityanskiy 2021-01-19  367  		return;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  368  
214baf22870cfa Maxim Mikityanskiy 2021-01-19  369  	spin_lock_bh(qdisc_lock(qdisc));
214baf22870cfa Maxim Mikityanskiy 2021-01-19  370  	qdisc_reset(qdisc);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  371  	spin_unlock_bh(qdisc_lock(qdisc));
214baf22870cfa Maxim Mikityanskiy 2021-01-19  372  }
214baf22870cfa Maxim Mikityanskiy 2021-01-19  373  

:::::: The code at line 364 was first introduced by commit
:::::: 214baf22870cfa437522f3bd4fbae56338674b04 net/mlx5e: Support HTB offload

:::::: TO: Maxim Mikityanskiy <maximmi@mellanox.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
