Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000E77476
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 21:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678917433; x=1710453433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gij3na9W7PI/15+cgQWZ5+L2UOIMmZepntzs/up3Qdg=;
  b=ckESVM4TkZwx6k6X5gqPOthWMqBYVytJqJJ/KJlntVaRmfFAY6/J+NJj
   r/Ful8C9C0EMQddwoXfofnLDGCRXQnvGHPf/wOjSYXZED1aEcMQPElCHH
   eCa5RP7dlDLUr7MUIRUd7JQPIQkJ9y3vawN2C51JVF8kEzm8VeHxwvFyD
   p6UztpqtI2F8YPhZUb1s4tJfX05KU6XCeOyBLFDE3Cpnf1Ud4rofWoZkk
   ZAqFrEYYNhiAvfXdbRo/Yg/zyvKqLEJh8qgp+lA/9Tm4/eh0puNtr9WS4
   E+rT9hUmKD57h0pBLdahR3G+6JuENnHQfZekIuHGyxmgLgbr81FhWRd3e
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="326186047"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="326186047"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 14:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="789999461"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="789999461"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2023 14:57:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcZ7M-00083b-2l;
	Wed, 15 Mar 2023 21:57:08 +0000
Date: Thu, 16 Mar 2023 05:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 23/31]
 drivers/net/ethernet/mellanox/mlx4/en_netdev.c:2906:30: warning: variable
 'priv' set but not used
Message-ID: <202303160533.uCCUxfKD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   712b4584a71d7f86b5f870dae8ee6e5abd42971f
commit: b2c583ca5c5d33ebeba8a5dda6bb402618547d88 [23/31] mlx4: Move the bond work to the core driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230316/202303160533.uCCUxfKD-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/commit/?id=b2c583ca5c5d33ebeba8a5dda6bb402618547d88
        git remote add leon-rdma https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git
        git fetch --no-tags leon-rdma rdma-next
        git checkout b2c583ca5c5d33ebeba8a5dda6bb402618547d88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160533.uCCUxfKD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx4/en_netdev.c: In function 'mlx4_en_netdev_event':
>> drivers/net/ethernet/mellanox/mlx4/en_netdev.c:2906:30: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
    2906 |         struct mlx4_en_priv *priv;
         |                              ^~~~


vim +/priv +2906 drivers/net/ethernet/mellanox/mlx4/en_netdev.c

ab46182d0dcb3a Stanislav Fomichev 2023-01-19  2896  
5da0354726e4a6 Moni Shoua         2015-02-03  2897  int mlx4_en_netdev_event(struct notifier_block *this,
5da0354726e4a6 Moni Shoua         2015-02-03  2898  			 unsigned long event, void *ptr)
5da0354726e4a6 Moni Shoua         2015-02-03  2899  {
5da0354726e4a6 Moni Shoua         2015-02-03  2900  	struct net_device *ndev = netdev_notifier_info_to_dev(ptr);
5da0354726e4a6 Moni Shoua         2015-02-03  2901  	u8 port = 0;
5da0354726e4a6 Moni Shoua         2015-02-03  2902  	struct mlx4_en_dev *mdev;
5da0354726e4a6 Moni Shoua         2015-02-03  2903  	struct mlx4_dev *dev;
5da0354726e4a6 Moni Shoua         2015-02-03  2904  	int i, num_eth_ports = 0;
5da0354726e4a6 Moni Shoua         2015-02-03  2905  	bool do_bond = true;
5da0354726e4a6 Moni Shoua         2015-02-03 @2906  	struct mlx4_en_priv *priv;
5da0354726e4a6 Moni Shoua         2015-02-03  2907  	u8 v2p_port1 = 0;
5da0354726e4a6 Moni Shoua         2015-02-03  2908  	u8 v2p_port2 = 0;
5da0354726e4a6 Moni Shoua         2015-02-03  2909  
5da0354726e4a6 Moni Shoua         2015-02-03  2910  	if (!net_eq(dev_net(ndev), &init_net))
5da0354726e4a6 Moni Shoua         2015-02-03  2911  		return NOTIFY_DONE;
5da0354726e4a6 Moni Shoua         2015-02-03  2912  
cc625983f9a9c6 Petr Pavlu         2023-02-24  2913  	mdev = container_of(this, struct mlx4_en_dev, netdev_nb);
5da0354726e4a6 Moni Shoua         2015-02-03  2914  	dev = mdev->dev;
5da0354726e4a6 Moni Shoua         2015-02-03  2915  
5da0354726e4a6 Moni Shoua         2015-02-03  2916  	/* Go into this mode only when two network devices set on two ports
5da0354726e4a6 Moni Shoua         2015-02-03  2917  	 * of the same mlx4 device are slaves of the same bonding master
5da0354726e4a6 Moni Shoua         2015-02-03  2918  	 */
5da0354726e4a6 Moni Shoua         2015-02-03  2919  	mlx4_foreach_port(i, dev, MLX4_PORT_TYPE_ETH) {
5da0354726e4a6 Moni Shoua         2015-02-03  2920  		++num_eth_ports;
5da0354726e4a6 Moni Shoua         2015-02-03  2921  		if (!port && (mdev->pndev[i] == ndev))
5da0354726e4a6 Moni Shoua         2015-02-03  2922  			port = i;
5da0354726e4a6 Moni Shoua         2015-02-03  2923  		mdev->upper[i] = mdev->pndev[i] ?
5da0354726e4a6 Moni Shoua         2015-02-03  2924  			netdev_master_upper_dev_get(mdev->pndev[i]) : NULL;
5da0354726e4a6 Moni Shoua         2015-02-03  2925  		/* condition not met: network device is a slave */
5da0354726e4a6 Moni Shoua         2015-02-03  2926  		if (!mdev->upper[i])
5da0354726e4a6 Moni Shoua         2015-02-03  2927  			do_bond = false;
5da0354726e4a6 Moni Shoua         2015-02-03  2928  		if (num_eth_ports < 2)
5da0354726e4a6 Moni Shoua         2015-02-03  2929  			continue;
5da0354726e4a6 Moni Shoua         2015-02-03  2930  		/* condition not met: same master */
5da0354726e4a6 Moni Shoua         2015-02-03  2931  		if (mdev->upper[i] != mdev->upper[i-1])
5da0354726e4a6 Moni Shoua         2015-02-03  2932  			do_bond = false;
5da0354726e4a6 Moni Shoua         2015-02-03  2933  	}
5da0354726e4a6 Moni Shoua         2015-02-03  2934  	/* condition not met: 2 salves */
5da0354726e4a6 Moni Shoua         2015-02-03  2935  	do_bond = (num_eth_ports ==  2) ? do_bond : false;
5da0354726e4a6 Moni Shoua         2015-02-03  2936  
5da0354726e4a6 Moni Shoua         2015-02-03  2937  	/* handle only events that come with enough info */
5da0354726e4a6 Moni Shoua         2015-02-03  2938  	if ((do_bond && (event != NETDEV_BONDING_INFO)) || !port)
5da0354726e4a6 Moni Shoua         2015-02-03  2939  		return NOTIFY_DONE;
5da0354726e4a6 Moni Shoua         2015-02-03  2940  
5da0354726e4a6 Moni Shoua         2015-02-03  2941  	priv = netdev_priv(ndev);
5da0354726e4a6 Moni Shoua         2015-02-03  2942  	if (do_bond) {
5da0354726e4a6 Moni Shoua         2015-02-03  2943  		struct netdev_notifier_bonding_info *notifier_info = ptr;
5da0354726e4a6 Moni Shoua         2015-02-03  2944  		struct netdev_bonding_info *bonding_info =
5da0354726e4a6 Moni Shoua         2015-02-03  2945  			&notifier_info->bonding_info;
5da0354726e4a6 Moni Shoua         2015-02-03  2946  
5da0354726e4a6 Moni Shoua         2015-02-03  2947  		/* required mode 1, 2 or 4 */
5da0354726e4a6 Moni Shoua         2015-02-03  2948  		if ((bonding_info->master.bond_mode != BOND_MODE_ACTIVEBACKUP) &&
5da0354726e4a6 Moni Shoua         2015-02-03  2949  		    (bonding_info->master.bond_mode != BOND_MODE_XOR) &&
5da0354726e4a6 Moni Shoua         2015-02-03  2950  		    (bonding_info->master.bond_mode != BOND_MODE_8023AD))
5da0354726e4a6 Moni Shoua         2015-02-03  2951  			do_bond = false;
5da0354726e4a6 Moni Shoua         2015-02-03  2952  
5da0354726e4a6 Moni Shoua         2015-02-03  2953  		/* require exactly 2 slaves */
5da0354726e4a6 Moni Shoua         2015-02-03  2954  		if (bonding_info->master.num_slaves != 2)
5da0354726e4a6 Moni Shoua         2015-02-03  2955  			do_bond = false;
5da0354726e4a6 Moni Shoua         2015-02-03  2956  
5da0354726e4a6 Moni Shoua         2015-02-03  2957  		/* calc v2p */
5da0354726e4a6 Moni Shoua         2015-02-03  2958  		if (do_bond) {
5da0354726e4a6 Moni Shoua         2015-02-03  2959  			if (bonding_info->master.bond_mode ==
5da0354726e4a6 Moni Shoua         2015-02-03  2960  			    BOND_MODE_ACTIVEBACKUP) {
5da0354726e4a6 Moni Shoua         2015-02-03  2961  				/* in active-backup mode virtual ports are
5da0354726e4a6 Moni Shoua         2015-02-03  2962  				 * mapped to the physical port of the active
5da0354726e4a6 Moni Shoua         2015-02-03  2963  				 * slave */
5da0354726e4a6 Moni Shoua         2015-02-03  2964  				if (bonding_info->slave.state ==
5da0354726e4a6 Moni Shoua         2015-02-03  2965  				    BOND_STATE_BACKUP) {
5da0354726e4a6 Moni Shoua         2015-02-03  2966  					if (port == 1) {
5da0354726e4a6 Moni Shoua         2015-02-03  2967  						v2p_port1 = 2;
5da0354726e4a6 Moni Shoua         2015-02-03  2968  						v2p_port2 = 2;
5da0354726e4a6 Moni Shoua         2015-02-03  2969  					} else {
5da0354726e4a6 Moni Shoua         2015-02-03  2970  						v2p_port1 = 1;
5da0354726e4a6 Moni Shoua         2015-02-03  2971  						v2p_port2 = 1;
5da0354726e4a6 Moni Shoua         2015-02-03  2972  					}
5da0354726e4a6 Moni Shoua         2015-02-03  2973  				} else { /* BOND_STATE_ACTIVE */
5da0354726e4a6 Moni Shoua         2015-02-03  2974  					if (port == 1) {
5da0354726e4a6 Moni Shoua         2015-02-03  2975  						v2p_port1 = 1;
5da0354726e4a6 Moni Shoua         2015-02-03  2976  						v2p_port2 = 1;
5da0354726e4a6 Moni Shoua         2015-02-03  2977  					} else {
5da0354726e4a6 Moni Shoua         2015-02-03  2978  						v2p_port1 = 2;
5da0354726e4a6 Moni Shoua         2015-02-03  2979  						v2p_port2 = 2;
5da0354726e4a6 Moni Shoua         2015-02-03  2980  					}
5da0354726e4a6 Moni Shoua         2015-02-03  2981  				}
5da0354726e4a6 Moni Shoua         2015-02-03  2982  			} else { /* Active-Active */
5da0354726e4a6 Moni Shoua         2015-02-03  2983  				/* in active-active mode a virtual port is
5da0354726e4a6 Moni Shoua         2015-02-03  2984  				 * mapped to the native physical port if and only
5da0354726e4a6 Moni Shoua         2015-02-03  2985  				 * if the physical port is up */
5da0354726e4a6 Moni Shoua         2015-02-03  2986  				__s8 link = bonding_info->slave.link;
5da0354726e4a6 Moni Shoua         2015-02-03  2987  
5da0354726e4a6 Moni Shoua         2015-02-03  2988  				if (port == 1)
5da0354726e4a6 Moni Shoua         2015-02-03  2989  					v2p_port2 = 2;
5da0354726e4a6 Moni Shoua         2015-02-03  2990  				else
5da0354726e4a6 Moni Shoua         2015-02-03  2991  					v2p_port1 = 1;
5da0354726e4a6 Moni Shoua         2015-02-03  2992  				if ((link == BOND_LINK_UP) ||
5da0354726e4a6 Moni Shoua         2015-02-03  2993  				    (link == BOND_LINK_FAIL)) {
5da0354726e4a6 Moni Shoua         2015-02-03  2994  					if (port == 1)
5da0354726e4a6 Moni Shoua         2015-02-03  2995  						v2p_port1 = 1;
5da0354726e4a6 Moni Shoua         2015-02-03  2996  					else
5da0354726e4a6 Moni Shoua         2015-02-03  2997  						v2p_port2 = 2;
5da0354726e4a6 Moni Shoua         2015-02-03  2998  				} else { /* BOND_LINK_DOWN || BOND_LINK_BACK */
5da0354726e4a6 Moni Shoua         2015-02-03  2999  					if (port == 1)
5da0354726e4a6 Moni Shoua         2015-02-03  3000  						v2p_port1 = 2;
5da0354726e4a6 Moni Shoua         2015-02-03  3001  					else
5da0354726e4a6 Moni Shoua         2015-02-03  3002  						v2p_port2 = 1;
5da0354726e4a6 Moni Shoua         2015-02-03  3003  				}
5da0354726e4a6 Moni Shoua         2015-02-03  3004  			}
5da0354726e4a6 Moni Shoua         2015-02-03  3005  		}
5da0354726e4a6 Moni Shoua         2015-02-03  3006  	}
5da0354726e4a6 Moni Shoua         2015-02-03  3007  
b2c583ca5c5d33 Petr Pavlu         2023-02-24  3008  	mlx4_queue_bond_work(dev, do_bond, v2p_port1, v2p_port2);
5da0354726e4a6 Moni Shoua         2015-02-03  3009  
5da0354726e4a6 Moni Shoua         2015-02-03  3010  	return NOTIFY_DONE;
5da0354726e4a6 Moni Shoua         2015-02-03  3011  }
5da0354726e4a6 Moni Shoua         2015-02-03  3012  

:::::: The code at line 2906 was first introduced by commit
:::::: 5da0354726e4a6ae2e25c1fa2feb77585d997b05 net/mlx4_en: Port aggregation configuration

:::::: TO: Moni Shoua <monis@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
