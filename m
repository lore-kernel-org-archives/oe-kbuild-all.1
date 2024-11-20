Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5111B5338
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732115771; cv=none; b=CusZi8kAIoUffZErOd52yKy4XjQ5j978euiklpxuslKQaZgEpSI4Fpb6tRWYY07baR4sGKfUxnvIJ3ytAmLSW1STYbQ7ulsvisHgTes1Zo8mF1QBqvc9ksd4TqcV6ad3cummw5I2dgsYmxAqgVZwSO02wU32z212sFjdVu5rUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732115771; c=relaxed/simple;
	bh=MrdjHQ0rTB4YLmCNNfSw1q4hFBsQKMrmm8+142t+kk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UDLBSa6ZhF7s74fY8/45D+9jxDbfrVKsIVX8VJ1NOohagmT6PxjRGefQIXbRLk9PepbF+Ryl7Coi+B0Rp06uQrp3GcGf2WXzFmyXcKbLuxRxvvbFXTn5qKIxZu6XnrRfHLrU76GI327WW+B88ngSH84+sNE01YCavd8SGkG7g1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTkfUaU7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTkfUaU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732115768; x=1763651768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MrdjHQ0rTB4YLmCNNfSw1q4hFBsQKMrmm8+142t+kk4=;
  b=VTkfUaU7T4bsybIQ0YMy/GIEHStx4YM4jWMpAYXCAKc8akefIIgXmpI4
   uyQwvsxElR/SuHEzKw+QZ7cyNat4S2z6HMgdgxwPCKjpC6gZo8ol4OeXR
   6KuOpgCL8xA8MJFF8sSJYkWxKb8/sx2C3Lc0aqgMsjehMu8DwlWIBc9dC
   XMGzKSkB/6vQSVbQpbmJjxwhfguDgtKRpzaRgFwlPhaQ8H9qH+MDSrtTz
   RPh+xg8R+YDOGkB+v27b5N+m+QGFY92FNZlYboyK64b5nQgkh7S2plLOH
   eNr7U65QLeR5T5VZR2gi2v4MphmQ2zTOpj2zcUfv3PoySpVG+sIPDBE+L
   g==;
X-CSE-ConnectionGUID: ogDIWs5QRiSaoFYX0cgCwA==
X-CSE-MsgGUID: Z3L8a9gpTpmfcR6s4ZK3QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="35967030"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="35967030"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 07:16:03 -0800
X-CSE-ConnectionGUID: R9H9SzZsSXCAUwgqRq6iBg==
X-CSE-MsgGUID: oon5fxXUTj+RsZ9f/TFJmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95015610"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2024 07:16:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDmQy-0000x3-2e;
	Wed, 20 Nov 2024 15:16:00 +0000
Date: Wed, 20 Nov 2024 23:15:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1495/1495]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:299:28:
 warning: variable 'netdev' set but not used
Message-ID: <202411202330.F8yFrBR6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cce003012298a00277187319a2527882a18278c1
commit: 2d861e6888256771288076b36aa9beba46c7af67 [1495/1495] Net: nebula_matrix: fix ci compile nbl_ethtool.c warning
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241120/202411202330.F8yFrBR6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411202330.F8yFrBR6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411202330.F8yFrBR6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_serv_adjust_interrpt_param':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:299:28: warning: variable 'netdev' set but not used [-Wunused-but-set-variable]
     299 |         struct net_device *netdev;
         |                            ^~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_set_pause_param':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:1666:43: warning: variable 'net_resource_mgt' set but not used [-Wunused-but-set-variable]
    1666 |         struct nbl_serv_net_resource_mgt *net_resource_mgt;
         |                                           ^~~~~~~~~~~~~~~~


vim +/netdev +299 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c

bad535d287c9c1 Bennie Yan 2024-09-24  293  
2d861e68882567 Bennie Yan 2024-11-19  294  static void nbl_serv_adjust_interrpt_param(struct nbl_service_mgt *serv_mgt, bool ethtool)
bad535d287c9c1 Bennie Yan 2024-09-24  295  {
bad535d287c9c1 Bennie Yan 2024-09-24  296  	struct nbl_serv_net_resource_mgt *net_resource_mgt;
bad535d287c9c1 Bennie Yan 2024-09-24  297  	struct nbl_serv_ring_mgt *ring_mgt;
bad535d287c9c1 Bennie Yan 2024-09-24  298  	struct nbl_dispatch_ops *disp_ops;
bad535d287c9c1 Bennie Yan 2024-09-24 @299  	struct net_device *netdev;
bad535d287c9c1 Bennie Yan 2024-09-24  300  	struct nbl_serv_ring_vsi_info *vsi_info;
bad535d287c9c1 Bennie Yan 2024-09-24  301  	u64 last_tx_packets;
bad535d287c9c1 Bennie Yan 2024-09-24  302  	u64 last_rx_packets;
bad535d287c9c1 Bennie Yan 2024-09-24  303  	u64 last_get_stats_jiffies, time_diff;
bad535d287c9c1 Bennie Yan 2024-09-24  304  	u64 tx_packets, rx_packets;
bad535d287c9c1 Bennie Yan 2024-09-24  305  	u64 tx_rates, rx_rates, pkt_rates;
bad535d287c9c1 Bennie Yan 2024-09-24  306  	u16 local_vector_id, vector_num;
bad535d287c9c1 Bennie Yan 2024-09-24  307  	u16 intr_suppress_level;
bad535d287c9c1 Bennie Yan 2024-09-24  308  
bad535d287c9c1 Bennie Yan 2024-09-24  309  	net_resource_mgt = NBL_SERV_MGT_TO_NET_RES_MGT(serv_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  310  	netdev = net_resource_mgt->netdev;
bad535d287c9c1 Bennie Yan 2024-09-24  311  	ring_mgt = NBL_SERV_MGT_TO_RING_MGT(serv_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  312  	disp_ops = NBL_SERV_MGT_TO_DISP_OPS(serv_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  313  	vsi_info = &ring_mgt->vsi_info[NBL_VSI_DATA];
bad535d287c9c1 Bennie Yan 2024-09-24  314  
bad535d287c9c1 Bennie Yan 2024-09-24  315  	last_tx_packets = net_resource_mgt->stats.tx_packets;
bad535d287c9c1 Bennie Yan 2024-09-24  316  	last_rx_packets = net_resource_mgt->stats.rx_packets;
bad535d287c9c1 Bennie Yan 2024-09-24  317  	last_get_stats_jiffies = net_resource_mgt->get_stats_jiffies;
bad535d287c9c1 Bennie Yan 2024-09-24  318  	disp_ops->get_net_stats(NBL_SERV_MGT_TO_DISP_PRIV(serv_mgt), &net_resource_mgt->stats);
bad535d287c9c1 Bennie Yan 2024-09-24  319  	/* ethtool -S don't adaptive interrupt suppression param */
bad535d287c9c1 Bennie Yan 2024-09-24  320  	if (!vsi_info->itr_dynamic || ethtool)
bad535d287c9c1 Bennie Yan 2024-09-24  321  		return;
bad535d287c9c1 Bennie Yan 2024-09-24  322  
bad535d287c9c1 Bennie Yan 2024-09-24  323  	tx_packets = net_resource_mgt->stats.tx_packets;
bad535d287c9c1 Bennie Yan 2024-09-24  324  	rx_packets = net_resource_mgt->stats.rx_packets;
bad535d287c9c1 Bennie Yan 2024-09-24  325  	time_diff = jiffies - last_get_stats_jiffies;
bad535d287c9c1 Bennie Yan 2024-09-24  326  
bad535d287c9c1 Bennie Yan 2024-09-24  327  	net_resource_mgt->get_stats_jiffies = jiffies;
bad535d287c9c1 Bennie Yan 2024-09-24  328  	tx_rates = (tx_packets - last_tx_packets) / time_diff * HZ;
bad535d287c9c1 Bennie Yan 2024-09-24  329  	rx_rates = (rx_packets - last_rx_packets) / time_diff * HZ;
bad535d287c9c1 Bennie Yan 2024-09-24  330  	pkt_rates = max_t(u64, tx_rates, rx_rates);
bad535d287c9c1 Bennie Yan 2024-09-24  331  
bad535d287c9c1 Bennie Yan 2024-09-24  332  	intr_suppress_level =
bad535d287c9c1 Bennie Yan 2024-09-24  333  		disp_ops->get_intr_suppress_level(NBL_SERV_MGT_TO_DISP_PRIV(serv_mgt), pkt_rates,
bad535d287c9c1 Bennie Yan 2024-09-24  334  						  ring_mgt->vectors->intr_suppress_level);
bad535d287c9c1 Bennie Yan 2024-09-24  335  	if (intr_suppress_level != ring_mgt->vectors->intr_suppress_level) {
bad535d287c9c1 Bennie Yan 2024-09-24  336  		local_vector_id = ring_mgt->vectors[vsi_info->ring_offset].local_vector_id;
bad535d287c9c1 Bennie Yan 2024-09-24  337  		vector_num = vsi_info->ring_num;
bad535d287c9c1 Bennie Yan 2024-09-24  338  		disp_ops->set_intr_suppress_level(NBL_SERV_MGT_TO_DISP_PRIV(serv_mgt),
bad535d287c9c1 Bennie Yan 2024-09-24  339  						  local_vector_id, vector_num,
bad535d287c9c1 Bennie Yan 2024-09-24  340  						  intr_suppress_level);
bad535d287c9c1 Bennie Yan 2024-09-24  341  		ring_mgt->vectors->intr_suppress_level = intr_suppress_level;
bad535d287c9c1 Bennie Yan 2024-09-24  342  	}
bad535d287c9c1 Bennie Yan 2024-09-24  343  }
bad535d287c9c1 Bennie Yan 2024-09-24  344  

:::::: The code at line 299 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
