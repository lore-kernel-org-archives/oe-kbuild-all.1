Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192C91078B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715422986; cv=none; b=dRgf0NB1kF3F21oE7BlmzYHAo9anr8T3FNUSeLgCcFPrn6br8Wc02kTnOCthL/xmO0BAj+o1VAn6wUdPDJa0MGK2/Wm0OGVbF7JndftuKflLdK19uO83xV/FZxIT4hUR1yra/BsniBK/f5h4yt3r+FpW9ibgGUmzYqQKZVqveP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715422986; c=relaxed/simple;
	bh=jUBuHP5F8jcadyyNnBo/6ZJJazFUfPZJ5Ckc8Xjt1HY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GF2Ny5DVh9XvoT/EFXKXQWX3WGZYf3S0INrumhwgpw+eh63WlG8Qghd+KOdbbobENIDWhhxBDo/vrh2hUQrlSuSvLeY2qMCp0U3E4pguW1H5CGckkGk8437eg2GX6k7nzwtwP/HCz2GLXPjQdh5MI1OnwdlIvKfiYiKCqDh3PLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHVD2L9R; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHVD2L9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715422982; x=1746958982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jUBuHP5F8jcadyyNnBo/6ZJJazFUfPZJ5Ckc8Xjt1HY=;
  b=GHVD2L9RmRhGd9KVOTXO5U76yJ1g0AF2BFyUmk0lNYmtFCT07vah3IQ5
   P7BwLx8Qt7JKC6FErx0LmyeMDnornARjggdIcDNIsUqJPG+Smi9pE/5cG
   Zl64tazvtHLwOIGgDmJIAGWBJCQ4rIDgQbZdT89+VFzjEfFC7h7gNWcF9
   UcgBhOEDjXAZtiMHCON+sjUJpgVLsfxqX2yvgiM7uhBjuEAnCe06w53rC
   QXxd0ClcdyRHxld1WFo5LHjNvJsyEUh+r6IT+WCoF0O5VtUviLadFRWOy
   GFHdkprwbub+wJFIbml9E2nUGXqFcU0Ma752pnLbgeML4DYUlaxn9dOo0
   g==;
X-CSE-ConnectionGUID: 6KF7oTRLTB2CcN0CLYqFsQ==
X-CSE-MsgGUID: rKIAjy9JT+m7yqxYBgTM0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="15249630"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="15249630"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 03:23:02 -0700
X-CSE-ConnectionGUID: oBhTmOaNT6mMFeBvSHoOOA==
X-CSE-MsgGUID: IKHuyoxkTrWmzGu4aspgvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="29944550"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 May 2024 03:22:59 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5jsX-0007Ez-1x;
	Sat, 11 May 2024 10:22:57 +0000
Date: Sat, 11 May 2024 18:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Simon Horman <horms@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: [morimoto:renesas-bsp/v6.1.90-2024-05-09 597/604]
 drivers/net/ethernet/renesas/rswitch.c:1807:38: error: implicit declaration
 of function 'clk_get_rate'
Message-ID: <202405111810.eB7Bxcw8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.90-2024-05-09
head:   9dcc7c4d1e870ab0e3bbf05bdc7eb271ddef057d
commit: 857c8f33e1b10d27251b58342781e19b9ec9b678 [597/604] net: ethernet: renesas: rcar_gen4_ptp: Get clock increment from clock rate
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240511/202405111810.eB7Bxcw8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111810.eB7Bxcw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111810.eB7Bxcw8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/renesas/rswitch.c: In function 'rswitch_init':
>> drivers/net/ethernet/renesas/rswitch.c:1807:38: error: implicit declaration of function 'clk_get_rate' [-Werror=implicit-function-declaration]
    1807 |                                      clk_get_rate(priv->clk));
         |                                      ^~~~~~~~~~~~
>> drivers/net/ethernet/renesas/rswitch.c:1807:55: error: 'struct rswitch_private' has no member named 'clk'
    1807 |                                      clk_get_rate(priv->clk));
         |                                                       ^~
   cc1: some warnings being treated as errors


vim +/clk_get_rate +1807 drivers/net/ethernet/renesas/rswitch.c

  1764	
  1765	static int rswitch_init(struct rswitch_private *priv)
  1766	{
  1767		int i, err;
  1768	
  1769		for (i = 0; i < RSWITCH_NUM_PORTS; i++)
  1770			rswitch_etha_init(priv, i);
  1771	
  1772		rswitch_clock_enable(priv);
  1773		for (i = 0; i < RSWITCH_NUM_PORTS; i++)
  1774			rswitch_etha_read_mac_address(&priv->etha[i]);
  1775	
  1776		rswitch_reset(priv);
  1777	
  1778		rswitch_clock_enable(priv);
  1779		rswitch_top_init(priv);
  1780		err = rswitch_bpool_config(priv);
  1781		if (err < 0)
  1782			return err;
  1783	
  1784		err = rswitch_gwca_linkfix_alloc(priv);
  1785		if (err < 0)
  1786			return -ENOMEM;
  1787	
  1788		err = rswitch_gwca_ts_queue_alloc(priv);
  1789		if (err < 0)
  1790			goto err_ts_queue_alloc;
  1791	
  1792		rswitch_gwca_ts_queue_fill(priv, 0, TS_RING_SIZE);
  1793		INIT_LIST_HEAD(&priv->gwca.ts_info_list);
  1794	
  1795		for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
  1796			err = rswitch_device_alloc(priv, i);
  1797			if (err < 0) {
  1798				for (i--; i >= 0; i--)
  1799					rswitch_device_free(priv, i);
  1800				goto err_device_alloc;
  1801			}
  1802		}
  1803	
  1804		rswitch_fwd_init(priv);
  1805	
  1806		err = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT,
> 1807					     clk_get_rate(priv->clk));
  1808		if (err < 0)
  1809			goto err_ptp_register;
  1810	
  1811		err = rswitch_gwca_request_irqs(priv);
  1812		if (err < 0)
  1813			goto err_gwca_request_irq;
  1814	
  1815		err = rswitch_gwca_ts_request_irqs(priv);
  1816		if (err < 0)
  1817			goto err_gwca_ts_request_irq;
  1818	
  1819		err = rswitch_gwca_hw_init(priv);
  1820		if (err < 0)
  1821			goto err_gwca_hw_init;
  1822	
  1823		err = rswitch_ether_port_init_all(priv);
  1824		if (err)
  1825			goto err_ether_port_init_all;
  1826	
  1827		rswitch_for_each_enabled_port(priv, i) {
  1828			err = register_netdev(priv->rdev[i]->ndev);
  1829			if (err) {
  1830				rswitch_for_each_enabled_port_continue_reverse(priv, i)
  1831					unregister_netdev(priv->rdev[i]->ndev);
  1832				goto err_register_netdev;
  1833			}
  1834		}
  1835	
  1836		rswitch_for_each_enabled_port(priv, i)
  1837			netdev_info(priv->rdev[i]->ndev, "MAC address %pM\n",
  1838				    priv->rdev[i]->ndev->dev_addr);
  1839	
  1840		return 0;
  1841	
  1842	err_register_netdev:
  1843		rswitch_ether_port_deinit_all(priv);
  1844	
  1845	err_ether_port_init_all:
  1846		rswitch_gwca_hw_deinit(priv);
  1847	
  1848	err_gwca_hw_init:
  1849	err_gwca_ts_request_irq:
  1850	err_gwca_request_irq:
  1851		rcar_gen4_ptp_unregister(priv->ptp_priv);
  1852	
  1853	err_ptp_register:
  1854		for (i = 0; i < RSWITCH_NUM_PORTS; i++)
  1855			rswitch_device_free(priv, i);
  1856	
  1857	err_device_alloc:
  1858		rswitch_gwca_ts_queue_free(priv);
  1859	
  1860	err_ts_queue_alloc:
  1861		rswitch_gwca_linkfix_free(priv);
  1862	
  1863		return err;
  1864	}
  1865	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
