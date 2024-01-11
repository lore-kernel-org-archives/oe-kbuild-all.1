Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894D551036
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 17:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnzAfqp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704994205; x=1736530205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=26dGM4vPAnEEkV+ZppYc/tIjoIes7lmS0c5a8XIoGJ4=;
  b=XnzAfqp+nqqm/qK/cz6agA1DQ1C/NRrDK1OfA3KQMdRVOTU3ELzgbTZg
   8+Bj5koft6fUZv96vojO26fTM4DZMPhbWIPGIsIzWp6g+GSDrIFar6o0B
   d/YcM5VGFgy5AXMMctpzexIL5OkhNoEYC3TYKV+ex3gKxvBkQRoUV77lU
   qzJ8DRz6klpsX5snPyyAmGUU55ECGFexKYAyqCLI/h8rHgkcghGR4/3gy
   iGWdIKHvzbx2+BVdeL9GyCKBK/EbQ4JGe344pamq6fxDQXUylysntuFqx
   MvNW5hyJJGWm1QgASGqJyOoWzxfjHFw3nUgNrU50RfiHzLcvG0Z7uxvKX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6009891"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="6009891"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 09:30:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="17105471"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2024 09:30:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNysT-0008XG-1p;
	Thu, 11 Jan 2024 17:30:01 +0000
Date: Fri, 12 Jan 2024 01:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13163/21544]
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:2220:13: warning: unused
 variable 'ret'
Message-ID: <202401120108.7vr89pKF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: d93d588d1b66f5aa630bab8cbbdecf3cda394017 [13163/21544] net: ipv6_stub: use ip6_dst_lookup_flow instead of ip6_dst_lookup
config: x86_64-openeuler_defconfig (https://download.01.org/0day-ci/archive/20240112/202401120108.7vr89pKF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120108.7vr89pKF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120108.7vr89pKF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/en_tc.c: In function 'mlx5e_route_lookup_ipv6':
>> drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:2220:13: warning: unused variable 'ret' [-Wunused-variable]
    2220 |         int ret;
         |             ^~~
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:49:
   drivers/net/ethernet/mellanox/mlx5/core/en.h: At top level:
   drivers/net/ethernet/mellanox/mlx5/core/en.h:208:19: warning: 'mlx5e_priv_flags' defined but not used [-Wunused-const-variable=]
     208 | static const char mlx5e_priv_flags[][ETH_GSTRING_LEN] = {
         |                   ^~~~~~~~~~~~~~~~


vim +/ret +2220 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c

b1d90e6bbd149f Rabie Loulou    2018-01-11  2206  
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2207  static int mlx5e_route_lookup_ipv6(struct mlx5e_priv *priv,
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2208  				   struct net_device *mirred_dev,
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2209  				   struct net_device **out_dev,
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2210  				   struct flowi6 *fl6,
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2211  				   struct neighbour **out_n,
6360cd625e88a5 Or Gerlitz      2018-07-24  2212  				   u8 *out_ttl)
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2213  {
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2214  	struct neighbour *n = NULL;
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2215  	struct dst_entry *dst;
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2216  
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2217  #if IS_ENABLED(CONFIG_INET) && IS_ENABLED(CONFIG_IPV6)
74bd5d56bfcb85 Arnd Bergmann   2018-01-03  2218  	struct mlx5e_rep_priv *uplink_rpriv;
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2219  	struct mlx5_eswitch *esw = priv->mdev->priv.eswitch;
ce99f6b97fcdcb Or Gerlitz      2016-12-11 @2220  	int ret;
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2221  
d93d588d1b66f5 Sabrina Dubroca 2020-03-16  2222  	dst = ipv6_stub->ipv6_dst_lookup_flow(dev_net(mirred_dev), NULL, fl6,
d93d588d1b66f5 Sabrina Dubroca 2020-03-16  2223  					      NULL);
d93d588d1b66f5 Sabrina Dubroca 2020-03-16  2224  	if (IS_ERR(dst))
d93d588d1b66f5 Sabrina Dubroca 2020-03-16  2225  		return PTR_ERR(dst);
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2226  
6360cd625e88a5 Or Gerlitz      2018-07-24  2227  	if (!(*out_ttl))
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2228  		*out_ttl = ip6_dst_hoplimit(dst);
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2229  
a4b97ab4211fd0 Mark Bloch      2017-12-07  2230  	uplink_rpriv = mlx5_eswitch_get_uplink_priv(esw, REP_ETH);
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2231  	/* if the egress device isn't on the same HW e-switch, we use the uplink */
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2232  	if (!switchdev_port_same_parent_id(priv->netdev, dst->dev))
5ed99fb421d4d5 Mark Bloch      2017-12-07  2233  		*out_dev = uplink_rpriv->netdev;
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2234  	else
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2235  		*out_dev = dst->dev;
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2236  #else
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2237  	return -EOPNOTSUPP;
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2238  #endif
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2239  
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2240  	n = dst_neigh_lookup(dst, &fl6->daddr);
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2241  	dst_release(dst);
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2242  	if (!n)
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2243  		return -ENOMEM;
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2244  
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2245  	*out_n = n;
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2246  	return 0;
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2247  }
ce99f6b97fcdcb Or Gerlitz      2016-12-11  2248  

:::::: The code at line 2220 was first introduced by commit
:::::: ce99f6b97fcdcb4e7f6f7e2fe5e5fe6c65585cab net/mlx5e: Support SRIOV TC encapsulation offloads for IPv6 tunnels

:::::: TO: Or Gerlitz <ogerlitz@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
