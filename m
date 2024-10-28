Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2D9192B98
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730106832; cv=none; b=C5Sv60y+Z+kcoss54Fvk/jtURNaY4+yhmNuv0Bg2CPgDqxR/6Xth93vunsmuydOehrJKCngj11qtR7xMj/npROeDEibDWVsqkewZ8wmgMDgDqtyBxG0+CGFZus52jmCLoQisBxZMa7t6JDu8GkSb6wHXKiIdvO+zVb0ir5bqY88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730106832; c=relaxed/simple;
	bh=I4XwJFGrNZUG4jP4yhhKS/Yy2+1rJI4aF0fMG1B6a/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pEkweEWFMxLg1GShB7hWe8e0VLSYcNTF/4LL7miwnPiCV96gX7rGrksPnvymGgKncTpnToMb3+tncoroThX3bLNXKksAhFH1n17UUTWbG8EGpltKa4e5WIA4PEntdnW1ShTAIYsiDCsspROLRnnt75BIpejvJDFQWsBpJdaQi8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3NQxvLI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3NQxvLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730106830; x=1761642830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I4XwJFGrNZUG4jP4yhhKS/Yy2+1rJI4aF0fMG1B6a/s=;
  b=g3NQxvLIvvSDUhAxNItfAK6BCLOO/2r6xzrUQXRqm7p0D3UU/T+vC09j
   lACRhlPGYZHSSj9MSdwsLCbYA6DU6CMTiCkP0Gp1/6GUA/PSF7G/6hOPk
   lXvB5I5N3cw8WPGXLbuTuG1ozPK6p2HUQslrfBB4vrkJB2qKadz5Z9gCU
   w/cRBaqe5DuZtdk4jLKzjTIN9EqzCqwZmHvamo9XKFyTGS+s4deUIvnaW
   gHtshOv7tXhEyF/1LSdE9mUvPE1/f66rF1dWFQ/BJym2CQ6QPgGO+yxdQ
   EQe8ezPV6HF+S22AjzQ3vqOdE+2hT2nHEnaCGy3rAat0VnQ6a0hZPWvkA
   g==;
X-CSE-ConnectionGUID: uEbXwHhtTo6SSLU7+ePWWg==
X-CSE-MsgGUID: PCK4FR7pTnOnGtUmW5iGcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33607023"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="33607023"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 02:13:49 -0700
X-CSE-ConnectionGUID: tjLU6wkqS+S5bLyxn69BUw==
X-CSE-MsgGUID: i9JVm09hTpGdGhRnh+cE9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="86130245"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2024 02:13:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Lon-000cFI-35;
	Mon, 28 Oct 2024 09:13:45 +0000
Date: Mon, 28 Oct 2024 17:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-rsslro 63/70]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:4568:12: warning:
 'mtk_change_mtu' defined but not used
Message-ID: <202410281753.sKryHcbW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-rsslro
head:   edb2a7a8be4be71a6502d19afd5b069f6d9fbacc
commit: 581f68b8ee8e130ab90cabf695798606e12711de [63/70] net: lro patch from balika011
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241028/202410281753.sKryHcbW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281753.sKryHcbW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281753.sKryHcbW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_create_page_pool':
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1897:41: error: passing argument 2 of '__xdp_rxq_info_reg' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1897 |         err = __xdp_rxq_info_reg(xdp_q, &eth->dummy_dev, id,
         |                                         ^~~~~~~~~~~~~~~
         |                                         |
         |                                         struct net_device **
   In file included from include/trace/events/xdp.h:12,
                    from include/linux/bpf_trace.h:5,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.h:23,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.c:33:
   include/net/xdp.h:335:43: note: expected 'struct net_device *' but argument is of type 'struct net_device **'
     335 |                        struct net_device *dev, u32 queue_index,
         |                        ~~~~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_probe':
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5694:27: error: passing argument 1 of 'init_dummy_netdev' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5694 |         init_dummy_netdev(&eth->dummy_dev);
         |                           ^~~~~~~~~~~~~~~
         |                           |
         |                           struct net_device **
   In file included from include/linux/if_vlan.h:10,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.c:18:
   include/linux/netdevice.h:3123:43: note: expected 'struct net_device *' but argument is of type 'struct net_device **'
    3123 | void init_dummy_netdev(struct net_device *dev);
         |                        ~~~~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5695:24: error: passing argument 1 of 'netif_napi_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5695 |         netif_napi_add(&eth->dummy_dev, &eth->tx_napi, mtk_napi_tx);
         |                        ^~~~~~~~~~~~~~~
         |                        |
         |                        struct net_device **
   include/linux/netdevice.h:2635:35: note: expected 'struct net_device *' but argument is of type 'struct net_device **'
    2635 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         |                ~~~~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5696:24: error: passing argument 1 of 'netif_napi_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5696 |         netif_napi_add(&eth->dummy_dev, &eth->rx_napi[0].napi, mtk_napi_rx);
         |                        ^~~~~~~~~~~~~~~
         |                        |
         |                        struct net_device **
   include/linux/netdevice.h:2635:35: note: expected 'struct net_device *' but argument is of type 'struct net_device **'
    2635 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         |                ~~~~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5700:40: error: passing argument 1 of 'netif_napi_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5700 |                         netif_napi_add(&eth->dummy_dev, &eth->rx_napi[MTK_RSS_RING(i)].napi,
         |                                        ^~~~~~~~~~~~~~~
         |                                        |
         |                                        struct net_device **
   include/linux/netdevice.h:2635:35: note: expected 'struct net_device *' but argument is of type 'struct net_device **'
    2635 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         |                ~~~~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5706:40: error: passing argument 1 of 'netif_napi_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5706 |                         netif_napi_add(&eth->dummy_dev, &eth->rx_napi[MTK_HW_LRO_RING(i)].napi,
         |                                        ^~~~~~~~~~~~~~~
         |                                        |
         |                                        struct net_device **
   include/linux/netdevice.h:2635:35: note: expected 'struct net_device *' but argument is of type 'struct net_device **'
    2635 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         |                ~~~~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5717:1: warning: label 'err_unreg_netdev' defined but not used [-Wunused-label]
    5717 | err_unreg_netdev:
         | ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: At top level:
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5788:34: error: 'MTK_RX_DONE_INT' undeclared here (not in a function)
    5788 |                 .irq_done_mask = MTK_RX_DONE_INT,
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5998:34: error: 'MTK_RX_DONE_INT_V2' undeclared here (not in a function)
    5998 |                 .irq_done_mask = MTK_RX_DONE_INT_V2,
         |                                  ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:4568:12: warning: 'mtk_change_mtu' defined but not used [-Wunused-function]
    4568 | static int mtk_change_mtu(struct net_device *dev, int new_mtu)
         |            ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/mtk_change_mtu +4568 drivers/net/ethernet/mediatek/mtk_eth_soc.c

656e705243fd0c John Crispin     2016-03-08  4567  
4fd59792097a6b DENG Qingfang    2021-01-25 @4568  static int mtk_change_mtu(struct net_device *dev, int new_mtu)
4fd59792097a6b DENG Qingfang    2021-01-25  4569  {
4fd59792097a6b DENG Qingfang    2021-01-25  4570  	int length = new_mtu + MTK_RX_ETH_HLEN;
4fd59792097a6b DENG Qingfang    2021-01-25  4571  	struct mtk_mac *mac = netdev_priv(dev);
4fd59792097a6b DENG Qingfang    2021-01-25  4572  	struct mtk_eth *eth = mac->hw;
4fd59792097a6b DENG Qingfang    2021-01-25  4573  
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4574  	if (rcu_access_pointer(eth->prog) &&
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4575  	    length > MTK_PP_MAX_BUF_SIZE) {
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4576  		netdev_err(dev, "Invalid MTU for XDP mode\n");
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4577  		return -EINVAL;
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4578  	}
7c26c20da5d420 Lorenzo Bianconi 2022-07-22  4579  
b677d6c7a695da Lorenzo Bianconi 2022-11-17  4580  	mtk_set_mcr_max_rx(mac, length);
1eb2cded45b358 Eric Dumazet     2024-05-06  4581  	WRITE_ONCE(dev->mtu, new_mtu);
4fd59792097a6b DENG Qingfang    2021-01-25  4582  
4fd59792097a6b DENG Qingfang    2021-01-25  4583  	return 0;
4fd59792097a6b DENG Qingfang    2021-01-25  4584  }
4fd59792097a6b DENG Qingfang    2021-01-25  4585  

:::::: The code at line 4568 was first introduced by commit
:::::: 4fd59792097a6b2fb949d41264386a7ecade469e net: ethernet: mediatek: support setting MTU

:::::: TO: DENG Qingfang <dqfext@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
