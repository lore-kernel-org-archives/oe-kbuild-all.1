Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526D50244
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 22:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVwc1vQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704927421; x=1736463421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dGWc6Kh4TnyN8QwqKWvG3s8fLACZdznEGQINtfqefQA=;
  b=BVwc1vQuiehJaCa29mJMrXad7iryGO0UUqL4yG24WXRqQZj8PBNQR0PW
   Q93iOj7llg5NTmQtJlviObBJShblD0JgIinea+Uf7iTUrKD0/FXDgtK2i
   yivAZMGM+ZFiGoRc89Tzo+AI2ffMUn8Y8O88FuOJm1lfctupHcO8ukXwF
   gS3WlikRpUMJh1re4EjuQVwHsSYTs5dQl+Q4HptAOG2TZ4+8RZBJ2f+ie
   F2wCeLc1jD0jxBdgZRITpk64am8OQHraVPl815cJdjknmpJ6LnOdgUvjL
   g8T/SdM0+/h7TvVNqWndSxXiInJrSeeOh2plg89muPaabRM9SB732gFFy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="395825131"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="395825131"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 14:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="24411061"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2024 14:56:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNhUw-0007Za-2x;
	Wed, 10 Jan 2024 22:56:34 +0000
Date: Thu, 11 Jan 2024 06:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [linux-next:master 11985/13109]
 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:339:undefined reference to
 `phylink_stop'
Message-ID: <202401110606.hnUEDCxw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8cb47d7cd090a690c1785385b2f3d407d4a53ad0
commit: bc2426d74aa35cd8ec9c97a253ef57c2c5cd730c [11985/13109] net: ngbe: convert phylib to phylink
config: arm64-randconfig-r003-20221211 (https://download.01.org/0day-ci/archive/20240111/202401110606.hnUEDCxw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401110606.hnUEDCxw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401110606.hnUEDCxw-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_nway_reset':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:193:(.text+0x560): undefined reference to `phylink_ethtool_nway_reset'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_link_ksettings':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:202:(.text+0x5a0): undefined reference to `phylink_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_link_ksettings':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:211:(.text+0x5e0): undefined reference to `phylink_ethtool_ksettings_set'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_close':
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:339:(.text+0x26c): undefined reference to `phylink_stop'
>> aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:433:(.text+0x29c): undefined reference to `phylink_disconnect_phy'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_remove':
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:714:(.text+0x374): undefined reference to `phylink_destroy'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_probe':
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:684:(.text+0xe5c): undefined reference to `phylink_destroy'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_open':
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:391:(.text+0x1098): undefined reference to `phylink_connect_phy'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:362:(.text+0x1250): undefined reference to `phylink_start'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:407:(.text+0x1260): undefined reference to `phylink_disconnect_phy'
   aarch64-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.o: in function `ngbe_mdio_init':
   drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.c:128:(.text+0x4f4): undefined reference to `phylink_create'


vim +339 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c

   336	
   337	static void ngbe_down(struct wx *wx)
   338	{
 > 339		phylink_stop(wx->phylink);
   340		ngbe_disable_device(wx);
   341		wx_clean_all_tx_rings(wx);
   342		wx_clean_all_rx_rings(wx);
   343	}
   344	
   345	static void ngbe_up(struct wx *wx)
   346	{
   347		wx_configure_vectors(wx);
   348	
   349		/* make sure to complete pre-operations */
   350		smp_mb__before_atomic();
   351		wx_napi_enable_all(wx);
   352		/* enable transmits */
   353		netif_tx_start_all_queues(wx->netdev);
   354	
   355		/* clear any pending interrupts, may auto mask */
   356		rd32(wx, WX_PX_IC(0));
   357		rd32(wx, WX_PX_MISC_IC);
   358		ngbe_irq_enable(wx, true);
   359		if (wx->gpio_ctrl)
   360			ngbe_sfp_modules_txrx_powerctl(wx, true);
   361	
   362		phylink_start(wx->phylink);
   363	}
   364	
   365	/**
   366	 * ngbe_open - Called when a network interface is made active
   367	 * @netdev: network interface device structure
   368	 *
   369	 * Returns 0 on success, negative value on failure
   370	 *
   371	 * The open entry point is called when a network interface is made
   372	 * active by the system (IFF_UP).
   373	 **/
   374	static int ngbe_open(struct net_device *netdev)
   375	{
   376		struct wx *wx = netdev_priv(netdev);
   377		int err;
   378	
   379		wx_control_hw(wx, true);
   380	
   381		err = wx_setup_resources(wx);
   382		if (err)
   383			return err;
   384	
   385		wx_configure(wx);
   386	
   387		err = ngbe_request_irq(wx);
   388		if (err)
   389			goto err_free_resources;
   390	
 > 391		err = phylink_connect_phy(wx->phylink, wx->phydev);
   392		if (err)
   393			goto err_free_irq;
   394	
   395		err = netif_set_real_num_tx_queues(netdev, wx->num_tx_queues);
   396		if (err)
   397			goto err_dis_phy;
   398	
   399		err = netif_set_real_num_rx_queues(netdev, wx->num_rx_queues);
   400		if (err)
   401			goto err_dis_phy;
   402	
   403		ngbe_up(wx);
   404	
   405		return 0;
   406	err_dis_phy:
   407		phylink_disconnect_phy(wx->phylink);
   408	err_free_irq:
   409		wx_free_irq(wx);
   410	err_free_resources:
   411		wx_free_resources(wx);
   412		return err;
   413	}
   414	
   415	/**
   416	 * ngbe_close - Disables a network interface
   417	 * @netdev: network interface device structure
   418	 *
   419	 * Returns 0, this is not allowed to fail
   420	 *
   421	 * The close entry point is called when an interface is de-activated
   422	 * by the OS.  The hardware is still under the drivers control, but
   423	 * needs to be disabled.  A global MAC reset is issued to stop the
   424	 * hardware, and all transmit and receive resources are freed.
   425	 **/
   426	static int ngbe_close(struct net_device *netdev)
   427	{
   428		struct wx *wx = netdev_priv(netdev);
   429	
   430		ngbe_down(wx);
   431		wx_free_irq(wx);
   432		wx_free_resources(wx);
 > 433		phylink_disconnect_phy(wx->phylink);
   434		wx_control_hw(wx, false);
   435	
   436		return 0;
   437	}
   438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
