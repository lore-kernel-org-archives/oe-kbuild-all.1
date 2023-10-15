Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239F1748C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6YmT2W0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697379783; x=1728915783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kURNYWn2roabg7/C27i4ttr3y5+QJGClfHluw1Znv6U=;
  b=m6YmT2W0KGCD5UxrkQy+I5HNBD6W4asyNWFIyCpO5WN8JqCrzsMdYOkk
   oXHdXceS1exEBYJRgiO0c6qjspFPQo/waqRN9n1PPN2k6dTdY/Zgw7lUR
   J5ISZGnC3CMGih9y8Hvy/LF8PLX96ny4p+X5USFwlKUaKaCEUPIzbKlt3
   jWIRjM1eN9SVg1onsPX5xyg2WqTiahsoRFC5FgW+UgdE9ljuURjRJ9d7V
   ZuqqtjSSYwt+Ay95JPL+U+Z+QYY0jH7S6TE/TZCbBIjCmCYwbzyPuYZ4o
   nkO/r970Th8Sye52rnJBFx0NrkGtg1YIXKTuRh1jxycf9oJ6nAWYXiVO0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375755714"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="375755714"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 07:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="821273005"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="821273005"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Oct 2023 07:22:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs215-0007TP-2i;
	Sun, 15 Oct 2023 14:22:51 +0000
Date: Sun, 15 Oct 2023 22:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2524/30000]
 drivers/staging/fsl-dpaa2/evb/evb.c:764:6: warning: no previous prototype
 for 'evb_port_get_stats'
Message-ID: <202310152208.pk8EelR2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: ee1e0a34412345da149883aabf07fe99a4b863d0 [2524/30000] staging: dpaa2-evb: Fix MC bus include
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231015/202310152208.pk8EelR2-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310152208.pk8EelR2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310152208.pk8EelR2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/fsl-dpaa2/evb/evb.c:764:6: warning: no previous prototype for 'evb_port_get_stats' [-Wmissing-prototypes]
     764 | void evb_port_get_stats(struct net_device *netdev,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/staging/fsl-dpaa2/evb/evb.c: In function 'evb_init':
   drivers/staging/fsl-dpaa2/evb/evb.c:1130:28: warning: comparison is always false due to limited range of data type [-Wtype-limits]
    1130 |              version_minor < DPDMUX_MIN_VER_MINOR)) {
         |                            ^
--
>> drivers/staging/fsl-dpaa2/evb/dpdmux.c:990: warning: Excess function parameter 'if_id' description in 'dpdmux_set_custom_key'


vim +/evb_port_get_stats +764 drivers/staging/fsl-dpaa2/evb/evb.c

08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  763  
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13 @764  void evb_port_get_stats(struct net_device *netdev,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  765  			struct rtnl_link_stats64 *storage)
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  766  {
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  767  	struct evb_port_priv	*port_priv = netdev_priv(netdev);
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  768  	u64			tmp;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  769  	int			err;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  770  
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  771  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  772  				    0,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  773  				    port_priv->evb_priv->mux_handle,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  774  				    port_priv->port_index,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  775  				    DPDMUX_CNT_ING_FRAME, &storage->rx_packets);
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  776  	if (unlikely(err))
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  777  		goto error;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  778  
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  779  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  780  				    0,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  781  				    port_priv->evb_priv->mux_handle,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  782  				    port_priv->port_index,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  783  				    DPDMUX_CNT_ING_BYTE, &storage->rx_bytes);
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  784  	if (unlikely(err))
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  785  		goto error;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  786  
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  787  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  788  				    0,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  789  				    port_priv->evb_priv->mux_handle,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  790  				    port_priv->port_index,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  791  				    DPDMUX_CNT_ING_FLTR_FRAME, &tmp);
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  792  	if (unlikely(err))
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  793  		goto error;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  794  
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  795  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  796  				    0,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  797  				    port_priv->evb_priv->mux_handle,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  798  				    port_priv->port_index,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  799  				    DPDMUX_CNT_ING_FRAME_DISCARD,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  800  				    &storage->rx_dropped);
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  801  	if (unlikely(err)) {
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  802  		storage->rx_dropped = tmp;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  803  		goto error;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  804  	}
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  805  	storage->rx_dropped += tmp;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  806  
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  807  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  808  				    0,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  809  				    port_priv->evb_priv->mux_handle,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  810  				    port_priv->port_index,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  811  				    DPDMUX_CNT_ING_MCAST_FRAME,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  812  				    &storage->multicast);
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  813  	if (unlikely(err))
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  814  		goto error;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  815  
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  816  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  817  				    0,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  818  				    port_priv->evb_priv->mux_handle,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  819  				    port_priv->port_index,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  820  				    DPDMUX_CNT_EGR_FRAME, &storage->tx_packets);
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  821  	if (unlikely(err))
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  822  		goto error;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  823  
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  824  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  825  				    0,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  826  				    port_priv->evb_priv->mux_handle,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  827  				    port_priv->port_index,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  828  				    DPDMUX_CNT_EGR_BYTE, &storage->tx_bytes);
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  829  	if (unlikely(err))
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  830  		goto error;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  831  
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  832  	err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  833  				    0,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  834  				    port_priv->evb_priv->mux_handle,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  835  				    port_priv->port_index,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  836  				    DPDMUX_CNT_EGR_FRAME_DISCARD,
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  837  				    &storage->tx_dropped);
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  838  	if (unlikely(err))
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  839  		goto error;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  840  
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  841  	return;
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  842  
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  843  error:
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  844  	netdev_err(netdev, "dpdmux_if_get_counter err %d\n", err);
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  845  }
08e6dd10bd2d4f Razvan Stefanescu 2017-04-13  846  

:::::: The code at line 764 was first introduced by commit
:::::: 08e6dd10bd2d4fd06e586e0f73d042e9d3d37f15 staging: dpaa2-evb: Add Edge Virtual Bridge driver

:::::: TO: Razvan Stefanescu <razvan.stefanescu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
