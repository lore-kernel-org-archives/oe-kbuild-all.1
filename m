Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE862F90C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760563796; cv=none; b=UmJuILiF1ttPFbZHFlXlob3DJO8kbb9jGLtxqpnB9aD+LY6j9iqDDlfC3k8MLiqBO1hFPRp7OFMoZyreRwOEGJ9Q1vsXvBxaP6wo17wv/WmMGm6QSu/ZzADkUWqQwiQZJUeYLxKDrG2hJ43ZAQE0CoMUzdhpF3wEtwSI6E/2uoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760563796; c=relaxed/simple;
	bh=5QxGLMh2IJn/Vxu8dN6pV0CPnHKrpD+McuC1un7YBPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AiLzPQgeK5lcRY6MlwF/nAUFsAM4dUva5DeGWZ6mE1zLxU9wjy1ys/Z8Mx4hajKwTveYkH7Fd263LOSckOh0gKTGIDrwC2dHGkWUWcmjqGukBW/ZmA9hqODyImx+2fmejiN8NIhYRS8QjMs/lTVjJPMk3SOzrGS4SwGi3foTkXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6v92eNN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6v92eNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760563795; x=1792099795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5QxGLMh2IJn/Vxu8dN6pV0CPnHKrpD+McuC1un7YBPI=;
  b=f6v92eNNg6dr0Zp5uk90JeXHsY+PNlKeJiaRjZHmUS2WDEsGRcRwZbxv
   w/G/H4NrzWSdlvyj4BVuxPVNr+BSTgnQjC73ArVi3CNx5orSPjvYAfVbv
   +M5KR2PyhfuWtmZ90/7eHn/zHgdNeaXWF/TeDqa3ZeUYqj21rYFImKg+H
   Nh4qWAPciKyjdBR1bjdWIP2YhciSRSXTwO2bUJ9MRAeKdjWHQxBVnIVKZ
   UJbUOKE/cgNi0QmlS4giwqugeFXGC9jRTgHDRR1ue/Buu4/rSKXSNGQnm
   UZpq2A2k1UdUHhx37dvt+5M4LxrYXz4Xz0YA34MUV0Exl2BlvM2cMdQXD
   w==;
X-CSE-ConnectionGUID: n+62NMprRpWPazebcFWAoA==
X-CSE-MsgGUID: jQXos4UYSCGWIDyEIF9QSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="80190419"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="80190419"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 14:29:55 -0700
X-CSE-ConnectionGUID: Njx47FeWRTmRPkmmUoz/Pw==
X-CSE-MsgGUID: 10tzqqmXSMqnY+n8tUn0CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="182267180"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 Oct 2025 14:29:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9947-0004FB-13;
	Wed, 15 Oct 2025 21:29:47 +0000
Date: Thu, 16 Oct 2025 05:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Kirsher <jeff.kirsher@gmail.com>,
	Roger Quadros <rogerq@kernel.org>,
	MD Danish Anwar <danishanwar@ti.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [jkirsher-net-queue:master 2/4]
 drivers/net/ethernet/ti/icssg/icssg_prueth.c:814:17: error: implicit
 declaration of function 'emac_adjust_link'
Message-ID: <202510160525.veMm1Xyw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git master
head:   c9a8544415241209a476e56cc98a09ab074e29a8
commit: a0b07da0d5c468fbcbfcb2a394cf89b9bb12feee [2/4] net: ti: icssg-prueth: Fix signedness bug in prueth_init_rx_chns()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251016/202510160525.veMm1Xyw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160525.veMm1Xyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160525.veMm1Xyw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/ti/icssg/icssg_prueth.c:55:13: error: static declaration of 'prueth_cleanup_rx_chns' follows non-static declaration
      55 | static void prueth_cleanup_rx_chns(struct prueth_emac *emac,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/ti/icssg/icssg_prueth.c:34:
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:449:6: note: previous declaration of 'prueth_cleanup_rx_chns' with type 'void(struct prueth_emac *, struct prueth_rx_chn *, int)'
     449 | void prueth_cleanup_rx_chns(struct prueth_emac *emac,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:66:13: error: static declaration of 'prueth_cleanup_tx_chns' follows non-static declaration
      66 | static void prueth_cleanup_tx_chns(struct prueth_emac *emac)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:452:6: note: previous declaration of 'prueth_cleanup_tx_chns' with type 'void(struct prueth_emac *)'
     452 | void prueth_cleanup_tx_chns(struct prueth_emac *emac);
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:86:13: error: static declaration of 'prueth_ndev_del_tx_napi' follows non-static declaration
      86 | static void prueth_ndev_del_tx_napi(struct prueth_emac *emac, int num)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:453:6: note: previous declaration of 'prueth_ndev_del_tx_napi' with type 'void(struct prueth_emac *, int)'
     453 | void prueth_ndev_del_tx_napi(struct prueth_emac *emac, int num);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:99:13: error: static declaration of 'prueth_xmit_free' follows non-static declaration
      99 | static void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
         |             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:454:6: note: previous declaration of 'prueth_xmit_free' with type 'void(struct prueth_tx_chn *, struct cppi5_host_desc_t *)'
     454 | void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:135:12: error: conflicting types for 'emac_tx_complete_packets'; have 'int(struct prueth_emac *, int,  int)'
     135 | static int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:456:5: note: previous declaration of 'emac_tx_complete_packets' with type 'int(struct prueth_emac *, int,  int,  bool *)' {aka 'int(struct prueth_emac *, int,  int,  _Bool *)'}
     456 | int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:225:12: error: static declaration of 'prueth_ndev_add_tx_napi' follows non-static declaration
     225 | static int prueth_ndev_add_tx_napi(struct prueth_emac *emac)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:458:5: note: previous declaration of 'prueth_ndev_add_tx_napi' with type 'int(struct prueth_emac *)'
     458 | int prueth_ndev_add_tx_napi(struct prueth_emac *emac);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:251:12: error: static declaration of 'prueth_init_tx_chns' follows non-static declaration
     251 | static int prueth_init_tx_chns(struct prueth_emac *emac)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:459:5: note: previous declaration of 'prueth_init_tx_chns' with type 'int(struct prueth_emac *)'
     459 | int prueth_init_tx_chns(struct prueth_emac *emac);
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:331:12: error: static declaration of 'prueth_init_rx_chns' follows non-static declaration
     331 | static int prueth_init_rx_chns(struct prueth_emac *emac,
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:460:5: note: previous declaration of 'prueth_init_rx_chns' with type 'int(struct prueth_emac *, struct prueth_rx_chn *, char *, u32,  u32)' {aka 'int(struct prueth_emac *, struct prueth_rx_chn *, char *, unsigned int,  unsigned int)'}
     460 | int prueth_init_rx_chns(struct prueth_emac *emac,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:472:12: error: static declaration of 'icssg_ts_to_ns' follows non-static declaration
     472 | static u64 icssg_ts_to_ns(u32 hi_sw, u32 hi, u32 lo, u32 cycle_time_ns)
         |            ^~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:495:5: note: previous declaration of 'icssg_ts_to_ns' with type 'u64(u32,  u32,  u32,  u32)' {aka 'long long unsigned int(unsigned int,  unsigned int,  unsigned int,  unsigned int)'}
     495 | u64 icssg_ts_to_ns(u32 hi_sw, u32 hi, u32 lo, u32 cycle_time_ns);
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:487:13: error: static declaration of 'emac_rx_timestamp' follows non-static declaration
     487 | static void emac_rx_timestamp(struct prueth_emac *emac,
         |             ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:468:6: note: previous declaration of 'emac_rx_timestamp' with type 'void(struct prueth_emac *, struct sk_buff *, u32 *)' {aka 'void(struct prueth_emac *, struct sk_buff *, unsigned int *)'}
     468 | void emac_rx_timestamp(struct prueth_emac *emac,
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c: In function 'prueth_emac_common_start':
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:814:17: error: implicit declaration of function 'emac_adjust_link' [-Wimplicit-function-declaration]
     814 |                 emac_adjust_link(emac->ndev);
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c: At top level:
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:863:13: warning: conflicting types for 'emac_adjust_link'; have 'void(struct net_device *)'
     863 | static void emac_adjust_link(struct net_device *ndev)
         |             ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:863:13: error: static declaration of 'emac_adjust_link' follows non-static declaration
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:814:17: note: previous implicit declaration of 'emac_adjust_link' with type 'void(struct net_device *)'
     814 |                 emac_adjust_link(emac->ndev);
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:573:13: warning: 'prueth_rx_cleanup' defined but not used [-Wunused-function]
     573 | static void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
         |             ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.c:503:12: warning: 'emac_rx_packet' defined but not used [-Wunused-function]
     503 | static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
         |            ^~~~~~~~~~~~~~


vim +/emac_adjust_link +814 drivers/net/ethernet/ti/icssg/icssg_prueth.c

01792bc3e5bdaf MD Danish Anwar 2025-08-14  783  
9facce84f4062f MD Danish Anwar 2024-12-23  784  static int prueth_emac_common_start(struct prueth *prueth)
9facce84f4062f MD Danish Anwar 2024-12-23  785  {
9facce84f4062f MD Danish Anwar 2024-12-23  786  	struct prueth_emac *emac;
9facce84f4062f MD Danish Anwar 2024-12-23  787  	int ret = 0;
9facce84f4062f MD Danish Anwar 2024-12-23  788  	int slice;
9facce84f4062f MD Danish Anwar 2024-12-23  789  
9facce84f4062f MD Danish Anwar 2024-12-23  790  	if (!prueth->emac[ICSS_SLICE0] && !prueth->emac[ICSS_SLICE1])
9facce84f4062f MD Danish Anwar 2024-12-23  791  		return -EINVAL;
9facce84f4062f MD Danish Anwar 2024-12-23  792  
9facce84f4062f MD Danish Anwar 2024-12-23  793  	/* clear SMEM and MSMC settings for all slices */
9facce84f4062f MD Danish Anwar 2024-12-23  794  	memset_io(prueth->msmcram.va, 0, prueth->msmcram.size);
9facce84f4062f MD Danish Anwar 2024-12-23  795  	memset_io(prueth->shram.va, 0, ICSSG_CONFIG_OFFSET_SLICE1 * PRUETH_NUM_MACS);
9facce84f4062f MD Danish Anwar 2024-12-23  796  
9facce84f4062f MD Danish Anwar 2024-12-23  797  	icssg_class_default(prueth->miig_rt, ICSS_SLICE0, 0, false);
9facce84f4062f MD Danish Anwar 2024-12-23  798  	icssg_class_default(prueth->miig_rt, ICSS_SLICE1, 0, false);
9facce84f4062f MD Danish Anwar 2024-12-23  799  
9facce84f4062f MD Danish Anwar 2024-12-23  800  	if (prueth->is_switch_mode || prueth->is_hsr_offload_mode)
9facce84f4062f MD Danish Anwar 2024-12-23  801  		icssg_init_fw_offload_mode(prueth);
9facce84f4062f MD Danish Anwar 2024-12-23  802  	else
9facce84f4062f MD Danish Anwar 2024-12-23  803  		icssg_init_emac_mode(prueth);
9facce84f4062f MD Danish Anwar 2024-12-23  804  
9facce84f4062f MD Danish Anwar 2024-12-23  805  	for (slice = 0; slice < PRUETH_NUM_MACS; slice++) {
9facce84f4062f MD Danish Anwar 2024-12-23  806  		emac = prueth->emac[slice];
9facce84f4062f MD Danish Anwar 2024-12-23  807  		if (!emac)
9facce84f4062f MD Danish Anwar 2024-12-23  808  			continue;
9facce84f4062f MD Danish Anwar 2024-12-23  809  		ret = icssg_config(prueth, emac, slice);
9facce84f4062f MD Danish Anwar 2024-12-23  810  		if (ret)
9facce84f4062f MD Danish Anwar 2024-12-23  811  			goto disable_class;
06feac15406f4f MD Danish Anwar 2025-08-05  812  
06feac15406f4f MD Danish Anwar 2025-08-05  813  		mutex_lock(&emac->ndev->phydev->lock);
06feac15406f4f MD Danish Anwar 2025-08-05 @814  		emac_adjust_link(emac->ndev);
06feac15406f4f MD Danish Anwar 2025-08-05  815  		mutex_unlock(&emac->ndev->phydev->lock);
9facce84f4062f MD Danish Anwar 2024-12-23  816  	}
9facce84f4062f MD Danish Anwar 2024-12-23  817  
9facce84f4062f MD Danish Anwar 2024-12-23  818  	ret = prueth_emac_start(prueth);
9facce84f4062f MD Danish Anwar 2024-12-23  819  	if (ret)
9facce84f4062f MD Danish Anwar 2024-12-23  820  		goto disable_class;
9facce84f4062f MD Danish Anwar 2024-12-23  821  
9facce84f4062f MD Danish Anwar 2024-12-23  822  	emac = prueth->emac[ICSS_SLICE0] ? prueth->emac[ICSS_SLICE0] :
9facce84f4062f MD Danish Anwar 2024-12-23  823  	       prueth->emac[ICSS_SLICE1];
9facce84f4062f MD Danish Anwar 2024-12-23  824  	ret = icss_iep_init(emac->iep, &prueth_iep_clockops,
9facce84f4062f MD Danish Anwar 2024-12-23  825  			    emac, IEP_DEFAULT_CYCLE_TIME_NS);
9facce84f4062f MD Danish Anwar 2024-12-23  826  	if (ret) {
9facce84f4062f MD Danish Anwar 2024-12-23  827  		dev_err(prueth->dev, "Failed to initialize IEP module\n");
9facce84f4062f MD Danish Anwar 2024-12-23  828  		goto stop_pruss;
9facce84f4062f MD Danish Anwar 2024-12-23  829  	}
9facce84f4062f MD Danish Anwar 2024-12-23  830  
9facce84f4062f MD Danish Anwar 2024-12-23  831  	return 0;
9facce84f4062f MD Danish Anwar 2024-12-23  832  
9facce84f4062f MD Danish Anwar 2024-12-23  833  stop_pruss:
9facce84f4062f MD Danish Anwar 2024-12-23  834  	prueth_emac_stop(prueth);
9facce84f4062f MD Danish Anwar 2024-12-23  835  
9facce84f4062f MD Danish Anwar 2024-12-23  836  disable_class:
9facce84f4062f MD Danish Anwar 2024-12-23  837  	icssg_class_disable(prueth->miig_rt, ICSS_SLICE0);
9facce84f4062f MD Danish Anwar 2024-12-23  838  	icssg_class_disable(prueth->miig_rt, ICSS_SLICE1);
128d5874c08221 Roger Quadros   2023-08-01  839  
128d5874c08221 Roger Quadros   2023-08-01  840  	return ret;
128d5874c08221 Roger Quadros   2023-08-01  841  }
128d5874c08221 Roger Quadros   2023-08-01  842  
9facce84f4062f MD Danish Anwar 2024-12-23  843  static int prueth_emac_common_stop(struct prueth *prueth)
9facce84f4062f MD Danish Anwar 2024-12-23  844  {
9facce84f4062f MD Danish Anwar 2024-12-23  845  	struct prueth_emac *emac;
9facce84f4062f MD Danish Anwar 2024-12-23  846  
9facce84f4062f MD Danish Anwar 2024-12-23  847  	if (!prueth->emac[ICSS_SLICE0] && !prueth->emac[ICSS_SLICE1])
9facce84f4062f MD Danish Anwar 2024-12-23  848  		return -EINVAL;
9facce84f4062f MD Danish Anwar 2024-12-23  849  
9facce84f4062f MD Danish Anwar 2024-12-23  850  	icssg_class_disable(prueth->miig_rt, ICSS_SLICE0);
9facce84f4062f MD Danish Anwar 2024-12-23  851  	icssg_class_disable(prueth->miig_rt, ICSS_SLICE1);
9facce84f4062f MD Danish Anwar 2024-12-23  852  
9facce84f4062f MD Danish Anwar 2024-12-23  853  	prueth_emac_stop(prueth);
9facce84f4062f MD Danish Anwar 2024-12-23  854  
9facce84f4062f MD Danish Anwar 2024-12-23  855  	emac = prueth->emac[ICSS_SLICE0] ? prueth->emac[ICSS_SLICE0] :
9facce84f4062f MD Danish Anwar 2024-12-23  856  	       prueth->emac[ICSS_SLICE1];
9facce84f4062f MD Danish Anwar 2024-12-23  857  	icss_iep_exit(emac->iep);
9facce84f4062f MD Danish Anwar 2024-12-23  858  
9facce84f4062f MD Danish Anwar 2024-12-23  859  	return 0;
9facce84f4062f MD Danish Anwar 2024-12-23  860  }
9facce84f4062f MD Danish Anwar 2024-12-23  861  
128d5874c08221 Roger Quadros   2023-08-01  862  /* called back by PHY layer if there is change in link state of hw port*/
128d5874c08221 Roger Quadros   2023-08-01 @863  static void emac_adjust_link(struct net_device *ndev)
128d5874c08221 Roger Quadros   2023-08-01  864  {
128d5874c08221 Roger Quadros   2023-08-01  865  	struct prueth_emac *emac = netdev_priv(ndev);
128d5874c08221 Roger Quadros   2023-08-01  866  	struct phy_device *phydev = ndev->phydev;
128d5874c08221 Roger Quadros   2023-08-01  867  	struct prueth *prueth = emac->prueth;
128d5874c08221 Roger Quadros   2023-08-01  868  	bool new_state = false;
128d5874c08221 Roger Quadros   2023-08-01  869  	unsigned long flags;
128d5874c08221 Roger Quadros   2023-08-01  870  
128d5874c08221 Roger Quadros   2023-08-01  871  	if (phydev->link) {
128d5874c08221 Roger Quadros   2023-08-01  872  		/* check the mode of operation - full/half duplex */
128d5874c08221 Roger Quadros   2023-08-01  873  		if (phydev->duplex != emac->duplex) {
128d5874c08221 Roger Quadros   2023-08-01  874  			new_state = true;
128d5874c08221 Roger Quadros   2023-08-01  875  			emac->duplex = phydev->duplex;
128d5874c08221 Roger Quadros   2023-08-01  876  		}
128d5874c08221 Roger Quadros   2023-08-01  877  		if (phydev->speed != emac->speed) {
128d5874c08221 Roger Quadros   2023-08-01  878  			new_state = true;
128d5874c08221 Roger Quadros   2023-08-01  879  			emac->speed = phydev->speed;
128d5874c08221 Roger Quadros   2023-08-01  880  		}
128d5874c08221 Roger Quadros   2023-08-01  881  		if (!emac->link) {
128d5874c08221 Roger Quadros   2023-08-01  882  			new_state = true;
128d5874c08221 Roger Quadros   2023-08-01  883  			emac->link = 1;
128d5874c08221 Roger Quadros   2023-08-01  884  		}
128d5874c08221 Roger Quadros   2023-08-01  885  	} else if (emac->link) {
128d5874c08221 Roger Quadros   2023-08-01  886  		new_state = true;
128d5874c08221 Roger Quadros   2023-08-01  887  		emac->link = 0;
128d5874c08221 Roger Quadros   2023-08-01  888  
128d5874c08221 Roger Quadros   2023-08-01  889  		/* f/w should support 100 & 1000 */
128d5874c08221 Roger Quadros   2023-08-01  890  		emac->speed = SPEED_1000;
128d5874c08221 Roger Quadros   2023-08-01  891  
128d5874c08221 Roger Quadros   2023-08-01  892  		/* half duplex may not be supported by f/w */
128d5874c08221 Roger Quadros   2023-08-01  893  		emac->duplex = DUPLEX_FULL;
128d5874c08221 Roger Quadros   2023-08-01  894  	}
128d5874c08221 Roger Quadros   2023-08-01  895  
128d5874c08221 Roger Quadros   2023-08-01  896  	if (new_state) {
128d5874c08221 Roger Quadros   2023-08-01  897  		phy_print_status(phydev);
128d5874c08221 Roger Quadros   2023-08-01  898  
128d5874c08221 Roger Quadros   2023-08-01  899  		/* update RGMII and MII configuration based on PHY negotiated
128d5874c08221 Roger Quadros   2023-08-01  900  		 * values
128d5874c08221 Roger Quadros   2023-08-01  901  		 */
128d5874c08221 Roger Quadros   2023-08-01  902  		if (emac->link) {
0a205f0fe8dd2a MD Danish Anwar 2023-09-13  903  			if (emac->duplex == DUPLEX_HALF)
0a205f0fe8dd2a MD Danish Anwar 2023-09-13  904  				icssg_config_half_duplex(emac);
128d5874c08221 Roger Quadros   2023-08-01  905  			/* Set the RGMII cfg for gig en and full duplex */
128d5874c08221 Roger Quadros   2023-08-01  906  			icssg_update_rgmii_cfg(prueth->miig_rt, emac);
128d5874c08221 Roger Quadros   2023-08-01  907  
128d5874c08221 Roger Quadros   2023-08-01  908  			/* update the Tx IPG based on 100M/1G speed */
128d5874c08221 Roger Quadros   2023-08-01  909  			spin_lock_irqsave(&emac->lock, flags);
128d5874c08221 Roger Quadros   2023-08-01  910  			icssg_config_ipg(emac);
128d5874c08221 Roger Quadros   2023-08-01  911  			spin_unlock_irqrestore(&emac->lock, flags);
128d5874c08221 Roger Quadros   2023-08-01  912  			icssg_config_set_speed(emac);
a8ea8d531d1edf MD Danish Anwar 2024-07-12  913  			icssg_set_port_state(emac, ICSSG_EMAC_PORT_FORWARD);
128d5874c08221 Roger Quadros   2023-08-01  914  
128d5874c08221 Roger Quadros   2023-08-01  915  		} else {
a8ea8d531d1edf MD Danish Anwar 2024-07-12  916  			icssg_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
128d5874c08221 Roger Quadros   2023-08-01  917  		}
128d5874c08221 Roger Quadros   2023-08-01  918  	}
128d5874c08221 Roger Quadros   2023-08-01  919  
128d5874c08221 Roger Quadros   2023-08-01  920  	if (emac->link) {
128d5874c08221 Roger Quadros   2023-08-01  921  		/* reactivate the transmit queue */
128d5874c08221 Roger Quadros   2023-08-01  922  		netif_tx_wake_all_queues(ndev);
128d5874c08221 Roger Quadros   2023-08-01  923  	} else {
128d5874c08221 Roger Quadros   2023-08-01  924  		netif_tx_stop_all_queues(ndev);
186734c1588657 Roger Quadros   2023-08-24  925  		prueth_cleanup_tx_ts(emac);
128d5874c08221 Roger Quadros   2023-08-01  926  	}
128d5874c08221 Roger Quadros   2023-08-01  927  }
128d5874c08221 Roger Quadros   2023-08-01  928  

:::::: The code at line 814 was first introduced by commit
:::::: 06feac15406f4f66f4c0c6ea60b10d44775d4133 net: ti: icssg-prueth: Fix emac link speed handling

:::::: TO: MD Danish Anwar <danishanwar@ti.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
