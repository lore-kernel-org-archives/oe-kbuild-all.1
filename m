Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CBB34AAE2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525684; cv=none; b=pr1ReolIneEVd+HE6BMLSzCKPumejDN0tycJjxgtTB1ytuI1+PD9XdwksU1WHhahX5dKNtbY37LnYLj7HdF84mkHWlxVjBh1dvJYiQtM8AqFv46I+4k3ipJbccwkeSEbv4HBgnDmBOpyaSL6ehYRVkQC8Pe6Y4smtX3QYtReYe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525684; c=relaxed/simple;
	bh=hvFoMvLubmqx1ErxLewPksN/ccc4nDDAGhkIU3ai/Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5M2mz9sFxJf9fs59X0bfgoih2U2LcQ1GOewFv9/pKRwQh4R4yW+47qiMh6Ok+YAVklABMMbBO/XzabzRDlETVXuo0uA4RdiJaLDS/a9z6Bao4Y3EIfVVWu+BgVs29DjodXMV97sC3P/FCfGCxMVOKRRbHv8uOJ+iuEmAiKxzCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGOlZ01o; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGOlZ01o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755525682; x=1787061682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hvFoMvLubmqx1ErxLewPksN/ccc4nDDAGhkIU3ai/Zk=;
  b=lGOlZ01opcCK4W4iw07OwFIzfxE7ot1YA8r4ztImfsZ38VHTz9kdVJFu
   70cRgJ5zdgMYx3dRAyjjlpibAGXqiyFyp7EVI+rGTC919j0WikfNEoZBV
   zN6D6iFdKfEc89e2u3Cz81jLDzCBFLrlnyaAN4HBp2dKjGa1nRt2xAASt
   DGLTlxtq82l8hnHHLQLjWA6xC9Z0lY9OcpbuSV00grKRmQ8wBfqtVVfvU
   /YbxggbDPhCw3l5xhmwkZV+KGh4tHcob9oN8RUTYigA3W3rn9Risp+tsB
   Q/sXPUximnl0nb4g298L0BqL2JKTdgfa8nkzQEsdNKegXitHJrFHP1RnL
   Q==;
X-CSE-ConnectionGUID: rg/NOAdWRpiBgKhmE/wb4g==
X-CSE-MsgGUID: P0IJ/GnWT8aWBTZq6DBbCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56776217"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="56776217"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 07:01:21 -0700
X-CSE-ConnectionGUID: T/PoWHmtTx+aXho8HdZttA==
X-CSE-MsgGUID: WCbXw01ETeGsm6sGEgQdVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="172008123"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2025 07:01:21 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo0QI-00015n-1o;
	Mon, 18 Aug 2025 14:01:18 +0000
Date: Mon, 18 Aug 2025 16:00:22 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:299:21:
 warning: variable 'netdev' set but not used
Message-ID: <202508181604.dgmSZq8P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bennie,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dc90c923fed4944f134644261022885c12631518
commit: 2d861e6888256771288076b36aa9beba46c7af67 [2687/2687] Net: nebula_matrix: fix ci compile nbl_ethtool.c warning
config: x86_64-buildonly-randconfig-2002-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181604.dgmSZq8P-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181604.dgmSZq8P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181604.dgmSZq8P-lkp@intel.com/

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
