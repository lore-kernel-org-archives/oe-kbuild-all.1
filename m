Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9782C3255
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756569954; cv=none; b=tuaHUOmBJzrhvuuFPAiNVbk9u49oxIApVZwK3yRjW5ljGS7qilsn2HB72qgVgnEwre6V7T+smbg0bzyQtTji6vg1DOwq9izhyZUAhZcXoxWfIhNkur8KQaZBSddQz2XOK9IIt0pprzHnV6hrp8+uI4YFKavALf7XxkWEceIwBmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756569954; c=relaxed/simple;
	bh=IuOkwO7M0w9mSvkzo5AYnHLQs3HLi5/7D8RebZAbo80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CKWfEfsMSoUsr/JJJARFT53VFPk6ZboDIQvXpCDFnbk9vFB/KQgiCo+xYM9tqppA1L4Dl60eiAoFfDlm3g2/07yGMXaGjCHfrn/zh3Aumd4HKYtWRvxDDJzKeuFYwI9DvLWPN7MbUDAy+w+zzRjEazKOvHwB75MkYTyyTGNnSwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lW/Oy1o3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lW/Oy1o3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756569952; x=1788105952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IuOkwO7M0w9mSvkzo5AYnHLQs3HLi5/7D8RebZAbo80=;
  b=lW/Oy1o3OEmciuyP/QwI197V6GUD8mMFJzKl9DETkBeEoa6daeYB8pGL
   O+kcJyD7/pfJuFBVOx/3foTaBiP6Vcc233Q3UcljPqWIazxwDWG2MF47l
   abQRcJgHo3NlGzpPH2nOdXDFSH3qiVffDRq8V5L7g2Eh4w6f1LSkAHRmi
   95BVVe1ZEZzTPyVXcW35RFN82PEe4F/qDD/cGAhXAr8KoHkTeotff4pHE
   LOKgC+bIIRcF5palwcfB6k0lueH1o97z4ZUgPIlsOY8l4b68rC7fc1Nak
   goGm+BtTWB9SP+vqWET4p54hH98VGET5Yx8cv/n6/ZekdsuL8mkD+1q1u
   A==;
X-CSE-ConnectionGUID: NMk1EWXMTHW3+AVA8cN6vw==
X-CSE-MsgGUID: sp2etEdlSPWFFtu3SUUkiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58897031"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58897031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 09:05:51 -0700
X-CSE-ConnectionGUID: lK4XH+yPS2iDOnLN1J1BZw==
X-CSE-MsgGUID: GVESCUelQiOJoHuscs3ZTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="169866526"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 30 Aug 2025 09:05:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usO5H-000VUn-14;
	Sat, 30 Aug 2025 16:05:47 +0000
Date: Sun, 31 Aug 2025 00:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3]
 drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:876:6: error: no
 previous prototype for 'sss_nic_port_module_cable_plug'
Message-ID: <202508302359.kRlp9Jbu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8e12165d6df78775dd82a4aed1c6863d33740bcf
commit: 3f63e55de387ff1ef9405747ecd67ea49dd18ed9 [3/3] Net: ethernet: Support 3snic 3s9xx network card
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250830/202508302359.kRlp9Jbu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508302359.kRlp9Jbu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508302359.kRlp9Jbu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:876:6: error: no previous prototype for 'sss_nic_port_module_cable_plug' [-Werror=missing-prototypes]
     876 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:882:6: error: no previous prototype for 'sss_nic_port_module_cable_unplug' [-Werror=missing-prototypes]
     882 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:888:6: error: no previous prototype for 'sss_nic_port_module_link_err' [-Werror=missing-prototypes]
     888 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1026:22: error: no previous prototype for 'get_nic_uld_info' [-Werror=missing-prototypes]
    1026 | struct sss_uld_info *get_nic_uld_info(void)
         |                      ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:42:5: error: no previous prototype for 'sss_nic_alloc_sq_resource' [-Werror=missing-prototypes]
      42 | int sss_nic_alloc_sq_resource(struct sss_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:87:6: error: no previous prototype for 'sss_nic_free_sq_resource' [-Werror=missing-prototypes]
      87 | void sss_nic_free_sq_resource(struct sss_nic_dev *nic_dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:104:6: error: no previous prototype for 'sss_nic_init_all_sq' [-Werror=missing-prototypes]
     104 | void sss_nic_init_all_sq(struct sss_nic_dev *nic_dev,
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:128:5: error: no previous prototype for 'sss_nic_alloc_sq_desc_group' [-Werror=missing-prototypes]
     128 | int sss_nic_alloc_sq_desc_group(struct sss_nic_dev *nic_dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:153:6: error: no previous prototype for 'sss_nic_free_sq_desc_group' [-Werror=missing-prototypes]
     153 | void sss_nic_free_sq_desc_group(struct sss_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:200:6: error: no previous prototype for 'sss_nic_flush_all_sq' [-Werror=missing-prototypes]
     200 | void sss_nic_flush_all_sq(struct sss_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx.c: In function 'sss_nic_recv_one_packet':
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx.c:718:13: error: variable '_wqe_num' set but not used [-Werror=unused-but-set-variable]
     718 |         u16 _wqe_num = 1; \
         |             ^~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx.c:805:9: note: in expansion of macro 'sss_nic_bpf_prog_run_xdp'
     805 |         sss_nic_bpf_prog_run_xdp(rq_desc, pkt_len, &xdp_result);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:80:5: error: no previous prototype for 'sss_nic_alloc_rq_res_group' [-Werror=missing-prototypes]
      80 | int sss_nic_alloc_rq_res_group(struct sss_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:136:6: error: no previous prototype for 'sss_nic_free_rq_res_group' [-Werror=missing-prototypes]
     136 | void sss_nic_free_rq_res_group(struct sss_nic_dev *nic_dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:208:5: error: no previous prototype for 'sss_nic_init_rq_desc_group' [-Werror=missing-prototypes]
     208 | int sss_nic_init_rq_desc_group(struct sss_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:235:6: error: no previous prototype for 'sss_nic_free_rq_desc_group' [-Werror=missing-prototypes]
     235 | void sss_nic_free_rq_desc_group(struct sss_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:241:5: error: no previous prototype for 'sss_nic_alloc_rq_desc_group' [-Werror=missing-prototypes]
     241 | int sss_nic_alloc_rq_desc_group(struct sss_nic_dev *nic_dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:267:5: error: no previous prototype for 'sss_nic_update_rx_rss' [-Werror=missing-prototypes]
     267 | int sss_nic_update_rx_rss(struct sss_nic_dev *nic_dev)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:282:6: error: no previous prototype for 'sss_nic_reset_rx_rss' [-Werror=missing-prototypes]
     282 | void sss_nic_reset_rx_rss(struct net_device *netdev)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:179:6: error: no previous prototype for 'sss_nic_rq_watchdog_handler' [-Werror=missing-prototypes]
     179 | void sss_nic_rq_watchdog_handler(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:350:6: error: no previous prototype for 'sss_nic_flush_tcam_list' [-Werror=missing-prototypes]
     350 | void sss_nic_flush_tcam_list(struct sss_nic_tcam_info *tcam_info)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:366:6: error: no previous prototype for 'sss_nic_flush_tcam_node_list' [-Werror=missing-prototypes]
     366 | void sss_nic_flush_tcam_node_list(struct sss_nic_tcam_info *tcam_info)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:382:6: error: no previous prototype for 'sss_nic_flush_rx_flow_rule' [-Werror=missing-prototypes]
     382 | void sss_nic_flush_rx_flow_rule(struct sss_nic_rx_rule *rx_flow_rule)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:397:6: error: no previous prototype for 'sss_nic_flush_tcam' [-Werror=missing-prototypes]
     397 | void sss_nic_flush_tcam(struct sss_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:797:5: error: no previous prototype for 'sss_nic_ethtool_update_flow' [-Werror=missing-prototypes]
     797 | int sss_nic_ethtool_update_flow(struct sss_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:842:5: error: no previous prototype for 'sss_nic_ethtool_delete_flow' [-Werror=missing-prototypes]
     842 | int sss_nic_ethtool_delete_flow(struct sss_nic_dev *nic_dev, u32 location)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:864:5: error: no previous prototype for 'sss_nic_ethtool_get_flow' [-Werror=missing-prototypes]
     864 | int sss_nic_ethtool_get_flow(const struct sss_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:887:5: error: no previous prototype for 'sss_nic_ethtool_get_all_flows' [-Werror=missing-prototypes]
     887 | int sss_nic_ethtool_get_all_flows(const struct sss_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ntuple.c:905:6: error: no previous prototype for 'sss_nic_validate_channel_setting_in_ntuple' [-Werror=missing-prototypes]
     905 | bool sss_nic_validate_channel_setting_in_ntuple(const struct sss_nic_dev *nic_dev, u32 q_num)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_api.c:629:5: error: no previous prototype for 'sss_nic_finish_loop_test' [-Werror=missing-prototypes]
     629 | int sss_nic_finish_loop_test(struct sss_nic_dev *nic_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:44:5: error: no previous prototype for 'sss_nic_get_sset_count' [-Werror=missing-prototypes]
      44 | int sss_nic_get_sset_count(struct net_device *netdev, int settings)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:62:6: error: no previous prototype for 'sss_nic_get_ethtool_stats' [-Werror=missing-prototypes]
      62 | void sss_nic_get_ethtool_stats(struct net_device *netdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:78:6: error: no previous prototype for 'sss_nic_get_strings' [-Werror=missing-prototypes]
      78 | void sss_nic_get_strings(struct net_device *netdev, u32 stringset, u8 *buf)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:98:5: error: no previous prototype for 'sss_nic_get_link_ksettings' [-Werror=missing-prototypes]
      98 | int sss_nic_get_link_ksettings(struct net_device *net_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_ethtool_stats.c:120:5: error: no previous prototype for 'sss_nic_set_link_ksettings' [-Werror=missing-prototypes]
     120 | int sss_nic_set_link_ksettings(struct net_device *netdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_filter.c:67:6: error: no previous prototype for 'sss_nic_clean_mac_list_filter' [-Werror=missing-prototypes]
      67 | void sss_nic_clean_mac_list_filter(struct sss_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_filter.c:468:6: error: no previous prototype for 'sss_nic_set_rx_mode_work' [-Werror=missing-prototypes]
     468 | void sss_nic_set_rx_mode_work(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:297:5: error: no previous prototype for 'sss_nic_ndo_vlan_rx_add_vid' [-Werror=missing-prototypes]
     297 | int sss_nic_ndo_vlan_rx_add_vid(struct net_device *netdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:318:5: error: no previous prototype for 'sss_nic_ndo_vlan_rx_kill_vid' [-Werror=missing-prototypes]
     318 | int sss_nic_ndo_vlan_rx_kill_vid(struct net_device *netdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:506:5: error: no previous prototype for 'sss_nic_ndo_set_vf_link_state' [-Werror=missing-prototypes]
     506 | int sss_nic_ndo_set_vf_link_state(struct net_device *netdev, int vf_id, int link)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:787:6: error: no previous prototype for 'sss_nic_set_netdev_ops' [-Werror=missing-prototypes]
     787 | void sss_nic_set_netdev_ops(struct sss_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_netdev_ops.c:795:6: error: no previous prototype for 'sss_nic_is_netdev_ops_match' [-Werror=missing-prototypes]
     795 | bool sss_nic_is_netdev_ops_match(const struct net_device *netdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/sss_nic_port_module_cable_plug +876 drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c

   875	
 > 876	void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
   877	{
   878		nicif_info(nic_dev, link, nic_dev->netdev,
   879			   "Port module event: Cable plugged\n");
   880	}
   881	
 > 882	void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
   883	{
   884		nicif_info(nic_dev, link, nic_dev->netdev,
   885			   "Port module event: Cable unplugged\n");
   886	}
   887	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
