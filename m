Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DD61B299
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 15:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727537662; cv=none; b=odawzeP0XApLGhLMVNZrp32wJs3zSZBir6mLFEC7mWMTzoqrSQEfz9K/yBjBj085xtFUFlV8ZV4yX2I7Jh9h7e9OqReI7UeiVwjs8hFuJNJN94POxP2J5S94tu7H11S7Jc+ZdY00vEKEyOMGk6vKMq1Vry0M/ifUPj22IfGawOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727537662; c=relaxed/simple;
	bh=sFWZXbSvBMhxy5RqOSBRb0Yk7sRXTqfR5ObNoMVgRnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CSu+bCgyFuBjT7fciINgR96JktGU0HW1ijbCp424K8OjohFofqKRfQilySJSTOI5eBVnzQpEFqCStXDnvy3K4yyLbKwDVyy92PUJmWLETmEsJNwnhfzU5EDCiOXdeAV/iUx6E0FoWpb/MmqRg5El+NjUA+31XW2AFAOx6PQrkxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csFN1DY5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csFN1DY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727537660; x=1759073660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sFWZXbSvBMhxy5RqOSBRb0Yk7sRXTqfR5ObNoMVgRnk=;
  b=csFN1DY5+XIrz6Eo4MQ75it8OUN0fERFbmjEbAUIuPDfhLfk1qzyMuZd
   BuymWbGpyyz9GW2Lz94m8/Zm7H/YvtWMWeJSQtP3HPyld5eWZCkEChAeM
   0cWLljP96yQ5M2sykr5t7tniNDGUyWVtPy6eugyiw3l4VX7MEbHhDzwcI
   PnE04Qa/lAztepe4KRvScDdXTnTMkTdeWYD/R3pdpcrNDQC/5olY6LMD+
   LU4PE+edVdTXdtQKNYwEsSXQyxpi3xLGXYJeyTXwIlUurnirU70Ko2Vnm
   TyJcZqCNg5bQX+bDIv670YTY9tbzIUZgkfCLgVpXYY46IQiUWU3tNi3J6
   w==;
X-CSE-ConnectionGUID: SGwtKv8BRQWSxxuGCcXA6g==
X-CSE-MsgGUID: UqCKhQw2QReIjeR9L4EDzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26797331"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26797331"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 08:34:20 -0700
X-CSE-ConnectionGUID: DiXzmQKaQrelwbMHYixgcg==
X-CSE-MsgGUID: zZw9CKsTRc68yqmtx6ZEBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72990536"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Sep 2024 08:34:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suZSa-000NN9-1Z;
	Sat, 28 Sep 2024 15:34:16 +0000
Date: Sat, 28 Sep 2024 23:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4728/16788]
 drivers/staging/fsl-dpaa2/evb/evb.c:767:6: warning: no previous prototype
 for 'evb_port_get_stats'
Message-ID: <202409282357.GYPcqXPM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 4566b0c3ecd0e12fba132e31b76adca9fe8e875d [4728/16788] staging: dpaa2-evb: Add Edge Virtual Bridge driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240928/202409282357.GYPcqXPM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282357.GYPcqXPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282357.GYPcqXPM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/fsl-dpaa2/evb/evb.c:767:6: warning: no previous prototype for 'evb_port_get_stats' [-Wmissing-prototypes]
     767 | void evb_port_get_stats(struct net_device *netdev,
         |      ^~~~~~~~~~~~~~~~~~
--
>> drivers/staging/fsl-dpaa2/evb/dpdmux.c:990: warning: Excess function parameter 'if_id' description in 'dpdmux_set_custom_key'


vim +/evb_port_get_stats +767 drivers/staging/fsl-dpaa2/evb/evb.c

   766	
 > 767	void evb_port_get_stats(struct net_device *netdev,
   768				struct rtnl_link_stats64 *storage)
   769	{
   770		struct evb_port_priv	*port_priv = netdev_priv(netdev);
   771		u64			tmp;
   772		int			err;
   773	
   774		err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
   775					    0,
   776					    port_priv->evb_priv->mux_handle,
   777					    port_priv->port_index,
   778					    DPDMUX_CNT_ING_FRAME, &storage->rx_packets);
   779		if (unlikely(err))
   780			goto error;
   781	
   782		err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
   783					    0,
   784					    port_priv->evb_priv->mux_handle,
   785					    port_priv->port_index,
   786					    DPDMUX_CNT_ING_BYTE, &storage->rx_bytes);
   787		if (unlikely(err))
   788			goto error;
   789	
   790		err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
   791					    0,
   792					    port_priv->evb_priv->mux_handle,
   793					    port_priv->port_index,
   794					    DPDMUX_CNT_ING_FLTR_FRAME, &tmp);
   795		if (unlikely(err))
   796			goto error;
   797	
   798		err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
   799					    0,
   800					    port_priv->evb_priv->mux_handle,
   801					    port_priv->port_index,
   802					    DPDMUX_CNT_ING_FRAME_DISCARD,
   803					    &storage->rx_dropped);
   804		if (unlikely(err)) {
   805			storage->rx_dropped = tmp;
   806			goto error;
   807		}
   808		storage->rx_dropped += tmp;
   809	
   810		err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
   811					    0,
   812					    port_priv->evb_priv->mux_handle,
   813					    port_priv->port_index,
   814					    DPDMUX_CNT_ING_MCAST_FRAME,
   815					    &storage->multicast);
   816		if (unlikely(err))
   817			goto error;
   818	
   819		err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
   820					    0,
   821					    port_priv->evb_priv->mux_handle,
   822					    port_priv->port_index,
   823					    DPDMUX_CNT_EGR_FRAME, &storage->tx_packets);
   824		if (unlikely(err))
   825			goto error;
   826	
   827		err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
   828					    0,
   829					    port_priv->evb_priv->mux_handle,
   830					    port_priv->port_index,
   831					    DPDMUX_CNT_EGR_BYTE, &storage->tx_bytes);
   832		if (unlikely(err))
   833			goto error;
   834	
   835		err = dpdmux_if_get_counter(port_priv->evb_priv->mc_io,
   836					    0,
   837					    port_priv->evb_priv->mux_handle,
   838					    port_priv->port_index,
   839					    DPDMUX_CNT_EGR_FRAME_DISCARD,
   840					    &storage->tx_dropped);
   841		if (unlikely(err))
   842			goto error;
   843	
   844		return;
   845	
   846	error:
   847		netdev_err(netdev, "dpdmux_if_get_counter err %d\n", err);
   848	}
   849	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
