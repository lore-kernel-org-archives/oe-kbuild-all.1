Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E8615A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 03:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693451329; x=1724987329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LV5cFWUHQp+Tciwvkgwmh3G1Ia6a/i+nalDEsc5XAJE=;
  b=ZvJb3fpYbtc5WuijgMHa570S8hxRYQO11UIDs6ovXXafgnyhs4NLRUJt
   wl9Baga9VvS5BN42cap6Ty92N68W0bj2Nf18bJqqatCgN0xTUECxeiGxa
   hkGWmM/hWSXRaSK1VGpnRuUhbsY/DSDd2TK371yxmxJOFz+25rjSkSfXM
   di2BHgYk96aVkJa41CndMHPatH/44CIGHUK1fOy3cJA6V2DQD9uoth1HD
   v4TEiFKn2ZJxFzdTprE4jYmMWhVWbKQbFSef/Z4k1fWDfIkl7PJT4opAp
   5MmhoVaQjH//ichf1q4ThVDcmbB5j2Ob1MX/Deo2rOvamD73Y4zEZ4lEn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="462175904"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="462175904"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 20:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="913042868"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="913042868"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Aug 2023 20:08:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbY34-000AWV-1U;
	Thu, 31 Aug 2023 03:08:46 +0000
Date: Thu, 31 Aug 2023 11:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3854/24603]
 drivers/staging/fsl-dpaa2/evb/evb.c:766:6: warning: no previous prototype
 for function 'evb_port_get_stats'
Message-ID: <202308311123.pr8lYiNO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: bf436fb78f79f1a0325c109fa94cdba3c4c1850b [3854/24603] staging: include the fsl-dpaa2 directory in the build system
config: arm64-randconfig-r013-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311123.pr8lYiNO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311123.pr8lYiNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311123.pr8lYiNO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/fsl-dpaa2/evb/evb.c:766:6: warning: no previous prototype for function 'evb_port_get_stats' [-Wmissing-prototypes]
     766 | void evb_port_get_stats(struct net_device *netdev,
         |      ^
   drivers/staging/fsl-dpaa2/evb/evb.c:766:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     766 | void evb_port_get_stats(struct net_device *netdev,
         | ^
         | static 
   1 warning generated.
--
>> drivers/staging/fsl-dpaa2/evb/dpdmux.c:990: warning: Excess function parameter 'if_id' description in 'dpdmux_set_custom_key'


vim +/evb_port_get_stats +766 drivers/staging/fsl-dpaa2/evb/evb.c

a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  765  
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13 @766  void evb_port_get_stats(struct net_device *netdev,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  767  			struct rtnl_link_stats64 *storage)
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  768  {
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  769  	struct evb_port_priv	*port_priv = netdev_priv(netdev);
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  770  	u64			tmp;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  771  	int			err;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  772  
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  773  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  774  				    0,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  775  				    port_priv->evb_priv->mux_handle,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  776  				    port_priv->port_index,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  777  				    DPDMUX_CNT_ING_FRAME, &storage->rx_packets);
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  778  	if (unlikely(err))
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  779  		goto error;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  780  
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  781  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  782  				    0,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  783  				    port_priv->evb_priv->mux_handle,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  784  				    port_priv->port_index,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  785  				    DPDMUX_CNT_ING_BYTE, &storage->rx_bytes);
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  786  	if (unlikely(err))
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  787  		goto error;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  788  
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  789  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  790  				    0,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  791  				    port_priv->evb_priv->mux_handle,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  792  				    port_priv->port_index,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  793  				    DPDMUX_CNT_ING_FLTR_FRAME, &tmp);
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  794  	if (unlikely(err))
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  795  		goto error;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  796  
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  797  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  798  				    0,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  799  				    port_priv->evb_priv->mux_handle,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  800  				    port_priv->port_index,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  801  				    DPDMUX_CNT_ING_FRAME_DISCARD,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  802  				    &storage->rx_dropped);
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  803  	if (unlikely(err)) {
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  804  		storage->rx_dropped = tmp;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  805  		goto error;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  806  	}
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  807  	storage->rx_dropped += tmp;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  808  
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  809  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  810  				    0,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  811  				    port_priv->evb_priv->mux_handle,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  812  				    port_priv->port_index,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  813  				    DPDMUX_CNT_ING_MCAST_FRAME,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  814  				    &storage->multicast);
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  815  	if (unlikely(err))
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  816  		goto error;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  817  
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  818  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  819  				    0,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  820  				    port_priv->evb_priv->mux_handle,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  821  				    port_priv->port_index,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  822  				    DPDMUX_CNT_EGR_FRAME, &storage->tx_packets);
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  823  	if (unlikely(err))
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  824  		goto error;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  825  
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  826  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  827  				    0,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  828  				    port_priv->evb_priv->mux_handle,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  829  				    port_priv->port_index,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  830  				    DPDMUX_CNT_EGR_BYTE, &storage->tx_bytes);
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  831  	if (unlikely(err))
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  832  		goto error;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  833  
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  834  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  835  				    0,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  836  				    port_priv->evb_priv->mux_handle,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  837  				    port_priv->port_index,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  838  				    DPDMUX_CNT_EGR_FRAME_DISCARD,
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  839  				    &storage->tx_dropped);
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  840  	if (unlikely(err))
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  841  		goto error;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  842  
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  843  	return;
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  844  
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  845  error:
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  846  	netdev_err(netdev, "dpdmux_if_get_counter err %d\n", err);
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  847  }
a204f6a81b6cb9 Razvan Stefanescu 2017-04-13  848  

:::::: The code at line 766 was first introduced by commit
:::::: a204f6a81b6cb95d4291e14b38d5f71edae69680 staging: dpaa2-evb: Add Edge Virtual Bridge driver

:::::: TO: Razvan Stefanescu <razvan.stefanescu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
