Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB207192B90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Jun 2025 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750923106; cv=none; b=e4jyLumYx2bFT0C1Ksqq0H4jKnXj/tCFcotRFEoK9yb1RCXv3ojKLVsQsOyrmzQE+3Avk/irZg7PV87FEJDW+jyZj4HbqClVfx0fAH2sXvJFYW5UXcJZPwnlaPFWzBfC342HTNVLQYq2RKogd58sj9PxHbCtBsvuMrsy4ZAFlcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750923106; c=relaxed/simple;
	bh=dLYtNCwMgLMQpWAmBQgRSzfRgzhB/9j+yndtDZfbNU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d3+sw6F8uc7Gc+kFx7YKkOGNSZy2EsJ6679Ga7c5CqIh+jQ2kwEMTCOwdrbZAnchoVxkeWDhQPXS5DCRkp6pqnnW5Sro8fMq6a+7Ufwhl54UJOAx+XYIGyUCvKfNQVjRGTVwxqyGXHSxFJqr8poyA3q6Dym8NgBmMpmamhQHg+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lj1WRlWb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lj1WRlWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750923104; x=1782459104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dLYtNCwMgLMQpWAmBQgRSzfRgzhB/9j+yndtDZfbNU4=;
  b=lj1WRlWb+6IpKRB1HUMOm5411Wdr/6sLVLAxBIcYZiNdQfCCbqk6vUOY
   ryf1jPKm1+gzK5fhG5zD8LEjPBkxa76Dn5uGG68SbSuMXVYypXrLe5kkq
   47hoaPQniW8IzPIkSIPhbV2NWXTq8j9Q1D6lM2PQd62MCoFxLqWg/RQAo
   8NnA9q1nhrHaks01C7HO1CGe/ig1ibiPZiG2hX2QcLKCa0ES3SCwzEMuD
   Aj6oimtGM0sTHwFqVZq9CiWpwd3cIh+EcrjIG22bw414HyOiVOiAMMkva
   QUyV7+xdMnLS7y8sqRzbpEH/HkYF1zHWyMqCI0x4/oKEFzjAzM4FeX9+3
   A==;
X-CSE-ConnectionGUID: lbFAgH6sRle7z6ozv+/DBg==
X-CSE-MsgGUID: 5IapcfT3QrOxSTX6Q2BndA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53079670"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53079670"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 00:31:43 -0700
X-CSE-ConnectionGUID: nmA8oXl1T6ehbus0WAFwQA==
X-CSE-MsgGUID: PDzXnm9MQbqVKlhbugiUog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="151859461"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 26 Jun 2025 00:31:41 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUh58-0000FP-1c;
	Thu, 26 Jun 2025 07:31:38 +0000
Date: Thu, 26 Jun 2025 09:30:48 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:299:21:
 warning: variable 'netdev' set but not used
Message-ID: <202506261533.YYy68pzU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 2d861e6888256771288076b36aa9beba46c7af67 [2195/2195] Net: nebula_matrix: fix ci compile nbl_ethtool.c warning
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250626/202506261533.YYy68pzU-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506261533.YYy68pzU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506261533.YYy68pzU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.h:10:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:299:21: warning: variable 'netdev' set but not used [-Wunused-but-set-variable]
     299 |         struct net_device *netdev;
         |                            ^
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:1666:36: warning: variable 'net_resource_mgt' set but not used [-Wunused-but-set-variable]
    1666 |         struct nbl_serv_net_resource_mgt *net_resource_mgt;
         |                                           ^
   3 warnings generated.


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
