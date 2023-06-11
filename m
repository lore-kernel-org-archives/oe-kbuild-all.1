Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E9B15CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 06:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686465895; x=1718001895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZzwMU5cIxlAG1eT20H1qMNgz7pD3qFfAlbYVbyQulw=;
  b=PQndDMNzZcN0M5j0UU4zzKKSKQ4Go85J+V3DXuhoCwuH73Owv01u3mDW
   RmQdVn+lwMTmOc5UK+OHQ52UCKxRIBKh8HujG3ewlsvAQfcDz5+AaWalQ
   LlYMT9buFC091KSVtHVioskgGyjD+za3BCWvgTJo5HcfPViN8nLhX4XMt
   tKuNUenYkeoJUqiW/OWojdAMFh8CTIylSb78ajTA3QVETHfiLGrCzkM9D
   hMybxP+RFv94KUCSSZhqzj+FR539THbxmpBa1JTEoenBlsZta89FuKjUQ
   zZTI25w0tp4TtnMoDGb7mwrYIneViQj96HsIT1t+cTmURJCBUFh8dTD58
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="360318029"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="360318029"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 23:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="885037456"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="885037456"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Jun 2023 23:44:52 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8Eom-000Ahi-0P;
	Sun, 11 Jun 2023 06:44:52 +0000
Date: Sun, 11 Jun 2023 14:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:364:40: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202306111427.LOLym1UT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   022ce8862dff83c859089cd14bc4dca0733e2f90
commit: d636fc5dd692c8f4e00ae6e0359c0eceeb5d9bdb net: sched: add rcu annotations around qdisc->qdisc_sleeping
date:   4 days ago
config: parisc-randconfig-s032-20230611 (https://download.01.org/0day-ci/archive/20230611/202306111427.LOLym1UT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d636fc5dd692c8f4e00ae6e0359c0eceeb5d9bdb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d636fc5dd692c8f4e00ae6e0359c0eceeb5d9bdb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/ kernel/rcu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306111427.LOLym1UT-lkp@intel.com/

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
