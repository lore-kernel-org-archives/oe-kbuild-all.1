Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE32223182D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 11:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679388; cv=none; b=r7xYMEFHRri6o77vnxXqrgmhOAmuE0Q3dwNXkdTlXdMj5aJr6oQc2fzjoCnfrAQ55ctUReVlAEAr6lfTpetZGeuXwtqmnFHPyxkJeQPC1Ot/wgsQUmAVUw5zYJ3STYnVYSoZo+veUk0eSbGs3Mg1gM3na9FIqPnYs2dM/xhVoH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679388; c=relaxed/simple;
	bh=dk8kZL+P+EWpV+QHgpSZuJWCZ3bsYyJ+Eq2SsRGlC+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L9wiZ0Cxoz7TmMSQ0ZDHZzq2D02DUQEuq5dOwOqAXRkx3ACris59OJL8ORXQbSgWQH4x9oz4bFpa8H4b8oPWBauShxtL3GfizrUvhF3JPQ6joBmUAt/gn4XQ32LXI3D2cH+Z2E9SWJFVsDmWIreMo2NtPAPynrw5WeauhQhLkXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=md7jgagW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="md7jgagW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750679387; x=1782215387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dk8kZL+P+EWpV+QHgpSZuJWCZ3bsYyJ+Eq2SsRGlC+U=;
  b=md7jgagWw6/G7JRznQLE4qVIrJhbXeWZfGpkLJb/sCAxDEQJKKhPW3bG
   +ZYUWiX09+3Qm1UPXAwWJXxz8++HN9UGM9r3XtMNXUWNRRbgVbQ/tdPaR
   WEcMs3gq4NwI1QnRFezHnqAKlliqe4LE85HmSRQvtBCOWZT2iYMYHX+q8
   bBLl8zJNgNHRj/vN7i+S0VTpLb9Sb3AZ1gnGGas3RuvSJA8DM0zEbSDyw
   Wg/4pjsi3Ek3ON3RyWumbiFbobPNP23SaPvcwC5qPONx0IUn2IRNEX3xT
   1mpUB19jmSs2KKSfFe46l8onCkK5mpXxfw8jioITwTo40g03hHVcrEd2E
   g==;
X-CSE-ConnectionGUID: zkX3FYIuRAOsVMljxTgCXA==
X-CSE-MsgGUID: g0TaRdJUR5yjxP+AYasXYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52954461"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52954461"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 04:49:46 -0700
X-CSE-ConnectionGUID: iePoBsL/QAqJR3ruNVL1BA==
X-CSE-MsgGUID: +LkVU+jMQdGdF3gz2NuwcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="155586488"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jun 2025 04:49:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTfgE-000O1K-32;
	Mon, 23 Jun 2025 11:49:42 +0000
Date: Mon, 23 Jun 2025 19:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhoujiadong <zhoujiadong5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2978/2978]
 drivers/net/ethernet/huawei/hinic3/hinic3_irq.c:22:5: warning: no previous
 prototype for 'hinic3_poll'
Message-ID: <202506231925.HQ2gIERd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   04dbc107e40be138cc70f7d15d50779f5538f412
commit: ebcedbe6ddb7bfcb756769994b3a796c771b43f5 [2978/2978] net/hinic3: Add Huawei Intelligent Network Card Driver: hinic3
config: x86_64-buildonly-randconfig-002-20250623 (https://download.01.org/0day-ci/archive/20250623/202506231925.HQ2gIERd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231925.HQ2gIERd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231925.HQ2gIERd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic3/hinic3_irq.c:22:5: warning: no previous prototype for 'hinic3_poll' [-Wmissing-prototypes]
      22 | int hinic3_poll(struct napi_struct *napi, int budget)
         |     ^~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:76:6: warning: no previous prototype for 'hinic3_uld_lock_init' [-Wmissing-prototypes]
      76 | void hinic3_uld_lock_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic3/hinic3_rx.c:740:5: warning: no previous prototype for 'hinic3_run_xdp' [-Wmissing-prototypes]
     740 | int hinic3_run_xdp(struct hinic3_rxq *rxq, u32 pkt_len)
         |     ^~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hinic3_rx.c:1156:5: warning: no previous prototype for 'rxq_restore' [-Wmissing-prototypes]
    1156 | int rxq_restore(struct hinic3_nic_dev *nic_dev, u16 q_id, u16 hw_ci)
         |     ^~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_rx.c:1254:6: warning: no previous prototype for 'rxq_is_normal' [-Wmissing-prototypes]
    1254 | bool rxq_is_normal(struct hinic3_rxq *rxq, struct rxq_check_info rxq_info)
         |      ^~~~~~~~~~~~~
--
   drivers/net/ethernet/huawei/hinic3/hinic3_ntuple.c:346:6: warning: no previous prototype for 'hinic3_flush_rx_flow_rule' [-Wmissing-prototypes]
     346 | void hinic3_flush_rx_flow_rule(struct hinic3_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hinic3_ntuple.c:785:5: warning: no previous prototype for 'hinic3_ethtool_flow_replace' [-Wmissing-prototypes]
     785 | int hinic3_ethtool_flow_replace(struct hinic3_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_ntuple.c:830:5: warning: no previous prototype for 'hinic3_ethtool_flow_remove' [-Wmissing-prototypes]
     830 | int hinic3_ethtool_flow_remove(struct hinic3_nic_dev *nic_dev, u32 location)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_ntuple.c:852:5: warning: no previous prototype for 'hinic3_ethtool_get_flow' [-Wmissing-prototypes]
     852 | int hinic3_ethtool_get_flow(const struct hinic3_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_ntuple.c:875:5: warning: no previous prototype for 'hinic3_ethtool_get_all_flows' [-Wmissing-prototypes]
     875 | int hinic3_ethtool_get_all_flows(const struct hinic3_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_ntuple.c:893:6: warning: no previous prototype for 'hinic3_validate_channel_setting_in_ntuple' [-Wmissing-prototypes]
     893 | bool hinic3_validate_channel_setting_in_ntuple(const struct hinic3_nic_dev *nic_dev, u32 q_num)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic3/hinic3_nic_dbg.c:19:5: warning: no previous prototype for 'hinic3_dbg_get_wqe_info' [-Wmissing-prototypes]
      19 | int hinic3_dbg_get_wqe_info(void *hwdev, u16 q_id, u16 idx, u16 wqebb_cnt,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_nic_dbg.c:60:5: warning: no previous prototype for 'hinic3_dbg_get_sq_info' [-Wmissing-prototypes]
      60 | int hinic3_dbg_get_sq_info(void *hwdev, u16 q_id, struct nic_sq_info *sq_info,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hinic3_nic_dbg.c:103:5: warning: no previous prototype for 'hinic3_dbg_get_rq_info' [-Wmissing-prototypes]
     103 | int hinic3_dbg_get_rq_info(void *hwdev, u16 q_id, struct nic_rq_info *rq_info,
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/hinic3_poll +22 drivers/net/ethernet/huawei/hinic3/hinic3_irq.c

    21	
  > 22	int hinic3_poll(struct napi_struct *napi, int budget)
    23	{
    24		int tx_pkts, rx_pkts;
    25		struct hinic3_irq *irq_cfg =
    26			container_of(napi, struct hinic3_irq, napi);
    27		struct hinic3_nic_dev *nic_dev = netdev_priv(irq_cfg->netdev);
    28	
    29		rx_pkts = hinic3_rx_poll(irq_cfg->rxq, budget);
    30	
    31		tx_pkts = hinic3_tx_poll(irq_cfg->txq, budget);
    32		if (tx_pkts >= budget || rx_pkts >= budget)
    33			return budget;
    34	
    35		napi_complete(napi);
    36	
    37		hinic3_set_msix_state(nic_dev->hwdev, irq_cfg->msix_entry_idx,
    38				      HINIC3_MSIX_ENABLE);
    39	
    40		return max(tx_pkts, rx_pkts);
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
