Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F9720E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 05:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVIcHv+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704952013; x=1736488013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ihepua8NXr1L49mzW4+uoAd6kM4Qb7urIUfWLAUJa8=;
  b=OVIcHv+YkmfWvGohFmwnTFmCh28KAVxZLWEQ36RU2MnhwCojFqvXAGCO
   Xkh0H9HGOyhjOTs+3giVi1B6D/gt87SK86HiINWwPeVL5+nD4uLfwFJ3q
   y1McFVRXe2Ty+ZHUHOkGLQPamQmtkB4mOu03Y5hNvV/TSK8Scg68XUN9I
   5ZA955xUr/qoG1yDvqawA7gw820qOjUeALZ+9vzmtKy9eckQ2PRbxd2YI
   Hqtj5JgtEP80NlCgGuyva2kCuh3ENxlHBFjd+aWjiu2dtH4LGn/KRGicX
   IIX7skn/2gdJlkYMHldh0GA1ufcCbO3/iYbSh66VmY/bfzOxQdhzopFDl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5491088"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="5491088"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 21:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="872906494"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="872906494"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Jan 2024 21:46:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNntu-0007sc-0M;
	Thu, 11 Jan 2024 05:46:46 +0000
Date: Thu, 11 Jan 2024 13:46:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11934/13245]
 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:362:undefined reference to
 `phylink_start'
Message-ID: <202401111304.AdUdD7sV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
commit: 883b5984a5d2900468af5ab979cae90547a78da4 [11934/13245] net: wangxun: add ethtool_ops for ring parameters
config: arm64-randconfig-r003-20221211 (https://download.01.org/0day-ci/archive/20240111/202401111304.AdUdD7sV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111304.AdUdD7sV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111304.AdUdD7sV-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_nway_reset':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:193:(.text+0x5e0): undefined reference to `phylink_ethtool_nway_reset'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_link_ksettings':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:202:(.text+0x620): undefined reference to `phylink_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_link_ksettings':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:211:(.text+0x660): undefined reference to `phylink_ethtool_ksettings_set'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_pauseparam':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:220:(.text+0x6a0): undefined reference to `phylink_ethtool_get_pauseparam'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_pauseparam':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:229:(.text+0x6e0): undefined reference to `phylink_ethtool_set_pauseparam'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_remove':
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:714:(.text+0x2b4): undefined reference to `phylink_destroy'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_close':
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:339:(.text+0x36c): undefined reference to `phylink_stop'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:433:(.text+0x39c): undefined reference to `phylink_disconnect_phy'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_probe':
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:684:(.text+0xe5c): undefined reference to `phylink_destroy'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_down':
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:339:(.text+0xf68): undefined reference to `phylink_stop'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_up':
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:362:(.text+0x10d0): undefined reference to `phylink_start'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_open':
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:391:(.text+0x1258): undefined reference to `phylink_connect_phy'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:407:(.text+0x1330): undefined reference to `phylink_disconnect_phy'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.o: in function `ngbe_mdio_init':
   drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.c:130:(.text+0x534): undefined reference to `phylink_create'


vim +362 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c

a1cf597b99a727 Mengyuan Lou 2023-01-11  344  
883b5984a5d290 Jiawen Wu    2024-01-03  345  void ngbe_up(struct wx *wx)
a1cf597b99a727 Mengyuan Lou 2023-01-11  346  {
e7956139a6cf9a Mengyuan Lou 2023-02-03  347  	wx_configure_vectors(wx);
e7956139a6cf9a Mengyuan Lou 2023-02-03  348  
b97f955ec47b49 Mengyuan Lou 2023-02-03  349  	/* make sure to complete pre-operations */
b97f955ec47b49 Mengyuan Lou 2023-02-03  350  	smp_mb__before_atomic();
b97f955ec47b49 Mengyuan Lou 2023-02-03  351  	wx_napi_enable_all(wx);
b97f955ec47b49 Mengyuan Lou 2023-02-03  352  	/* enable transmits */
b97f955ec47b49 Mengyuan Lou 2023-02-03  353  	netif_tx_start_all_queues(wx->netdev);
b97f955ec47b49 Mengyuan Lou 2023-02-03  354  
e7956139a6cf9a Mengyuan Lou 2023-02-03  355  	/* clear any pending interrupts, may auto mask */
59513714f66594 Jiawen Wu    2023-03-22  356  	rd32(wx, WX_PX_IC(0));
e7956139a6cf9a Mengyuan Lou 2023-02-03  357  	rd32(wx, WX_PX_MISC_IC);
e7956139a6cf9a Mengyuan Lou 2023-02-03  358  	ngbe_irq_enable(wx, true);
a1cf597b99a727 Mengyuan Lou 2023-01-11  359  	if (wx->gpio_ctrl)
a1cf597b99a727 Mengyuan Lou 2023-01-11  360  		ngbe_sfp_modules_txrx_powerctl(wx, true);
e7956139a6cf9a Mengyuan Lou 2023-02-03  361  
bc2426d74aa35c Jiawen Wu    2024-01-03 @362  	phylink_start(wx->phylink);
a1cf597b99a727 Mengyuan Lou 2023-01-11  363  }
02338c484ab625 Mengyuan Lou 2022-10-31  364  

:::::: The code at line 362 was first introduced by commit
:::::: bc2426d74aa35cd8ec9c97a253ef57c2c5cd730c net: ngbe: convert phylib to phylink

:::::: TO: Jiawen Wu <jiawenwu@trustnetic.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
