Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E72A137E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 01:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727659301; cv=none; b=P0tUouFiUT8V/ngdJwq0a6IHePeKqz0GAniw2a3E9utP11FXaaQ6815IywU+1AhnUJdbE4+4uUJcK/r3Enz9xVpYPDb4lV2Nh/uYFRkFBYSwaAx5e/qlruH+ECoMUIBZcG36/wMOn1+8B96iDBIib/qpojJ3EesSsjSFWFqbGtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727659301; c=relaxed/simple;
	bh=o71pn76boEu/2daZiWdbaGmxc3JfiTlcxAFe/Dw2mK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i0fFHDGe7+GT3kt7PRS7ZcuV582l3GWUlr0pRwfivZ+Cv47oftE3HyEGCPhrSJl2EVDE80//dJokW8hBn8dtafZkf/mPq2LUfqz9hmW/vCx51j0ULWpoqSwnVpTItK96l3a7MJk1DtMDdpUcxuvP6V6iSXgHgs59UgxZIGoMWVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=US0dg5YI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="US0dg5YI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727659298; x=1759195298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o71pn76boEu/2daZiWdbaGmxc3JfiTlcxAFe/Dw2mK4=;
  b=US0dg5YIUbdPmVUPxauK4Xg/K54Mqz8N1ZCaHW2AcDaJw/4e8/ytTRJC
   NI3wRSgW7wH5T5bPqahZ2r2bb9UJaJmOeIpsWXqQ+E3xK6Gpeapjjcbbp
   9/YWur2IynsE7999K/vh9S2kpi+/5FoM8IaeGdR7Bz7233c/a5Ro8O3fU
   utLj5iGqbDGykSRdTzP9SjqujVE14BPWkjWNIwgVUsvi7tyj/4ER4VWhW
   8ze6l0ltsd/5W/+PRWg73qKvu2p9DlvuFqEETEh4k8QeAjkEpKAucxHr0
   CfuQ2CHJFlxkXEphZxfK+iuiTP19gLKQqKvHWIoQdqW/SqaIV2rTG2OJW
   Q==;
X-CSE-ConnectionGUID: M0YP2wFJTtWVhsnlrSj9HQ==
X-CSE-MsgGUID: R/qrlIwZTQSn+LrJLLL5CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26609273"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26609273"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 18:21:37 -0700
X-CSE-ConnectionGUID: 7d3uh286SrONYoYDBBLCRg==
X-CSE-MsgGUID: FpZ2dmELRzuukfOQASdcvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="77640166"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Sep 2024 18:21:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv56U-000OsH-0h;
	Mon, 30 Sep 2024 01:21:34 +0000
Date: Mon, 30 Sep 2024 09:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3876/14244]
 drivers/net/ethernet/mucse/rnp/rnp_main.c:7167:24: warning: unused variable
 'hw'
Message-ID: <202409300942.x0IJXSvT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   91ff8f4b711382909faa289c49735e0514af6f76
commit: 455d45ae080810ae554f5e586adb9004230f9f70 [3876/14244] drivers: initial support for rnp drivers from Mucse Technology
config: loongarch-randconfig-001-20240930 (https://download.01.org/0day-ci/archive/20240930/202409300942.x0IJXSvT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300942.x0IJXSvT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300942.x0IJXSvT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:305:6: warning: no previous prototype for 'check_ari_mode' [-Wmissing-prototypes]
     305 | bool check_ari_mode(struct pci_dev *dev)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c: In function 'rnp_pci_sriov_disable':
>> drivers/net/ethernet/mucse/rnp/rnp_sriov.c:397:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     397 |         int err;
         |             ^~~
>> drivers/net/ethernet/mucse/rnp/rnp_sriov.c:411:9: warning: no return statement in function returning non-void [-Wreturn-type]
     411 |         }
         |         ^
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c: At top level:
>> drivers/net/ethernet/mucse/rnp/rnp_sriov.c:413:9: error: expected identifier or '(' before 'return'
     413 |         return err;
         |         ^~~~~~
>> drivers/net/ethernet/mucse/rnp/rnp_sriov.c:414:1: error: expected identifier or '(' before '}' token
     414 | }
         | ^
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1140:5: warning: no previous prototype for 'rnp_msg_post_status_signle_link' [-Wmissing-prototypes]
    1140 | int rnp_msg_post_status_signle_link(struct rnp_adapter *adapter, int vf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/mucse/rnp/rnp_main.c:175:6: warning: no previous prototype for 'rnp_unmap_and_free_tx_resource' [-Wmissing-prototypes]
     175 | void rnp_unmap_and_free_tx_resource(struct rnp_ring *ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:670:5: warning: no previous prototype for 'rnp_rx_ring_reinit' [-Wmissing-prototypes]
     670 | int rnp_rx_ring_reinit(struct rnp_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2012:6: warning: no previous prototype for 'rnp_write_eitr_rx' [-Wmissing-prototypes]
    2012 | void rnp_write_eitr_rx(struct rnp_q_vector *q_vector)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3176:6: warning: no previous prototype for 'rnp_vlan_stags_flag' [-Wmissing-prototypes]
    3176 | void rnp_vlan_stags_flag(struct rnp_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3580:5: warning: no previous prototype for 'rnp_xmit_nop_frame_ring' [-Wmissing-prototypes]
    3580 | int rnp_xmit_nop_frame_ring(struct rnp_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4842:6: warning: no previous prototype for 'rnp_service_timer' [-Wmissing-prototypes]
    4842 | void rnp_service_timer(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4950:6: warning: no previous prototype for 'rnp_service_task' [-Wmissing-prototypes]
    4950 | void rnp_service_task(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5972:5: warning: no previous prototype for 'rnp_delete_knode' [-Wmissing-prototypes]
    5972 | int rnp_delete_knode(struct net_device *dev,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6061:5: warning: no previous prototype for 'rnp_config_knode' [-Wmissing-prototypes]
    6061 | int rnp_config_knode(struct net_device *dev, __be16 protocol,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6120:5: warning: no previous prototype for 'rnp_setup_tc_cls_u32' [-Wmissing-prototypes]
    6120 | int rnp_setup_tc_cls_u32(struct net_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6197:6: warning: no previous prototype for 'rnp_do_reset' [-Wmissing-prototypes]
    6197 | void rnp_do_reset(struct net_device *netdev)
         |      ^~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6452:6: warning: no previous prototype for 'rnp_assign_netdev_ops' [-Wmissing-prototypes]
    6452 | void rnp_assign_netdev_ops(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6628:5: warning: no previous prototype for 'rnp_can_rpu_start' [-Wmissing-prototypes]
    6628 | int rnp_can_rpu_start(struct rnp_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c: In function 'rnp_io_error_detected':
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:7167:24: warning: unused variable 'hw' [-Wunused-variable]
    7167 |         struct rnp_hw *hw = &adapter->hw;
         |                        ^~
   drivers/net/ethernet/mucse/rnp/rnp_main.c: In function 'rnp_request_msix_irqs':
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2402:71: warning: '-' directive output may be truncated writing 1 byte into a region of size between 0 and 17 [-Wformat-truncation=]
    2402 |                                  sizeof(q_vector->name) - 1, "%s-%s-%d-%d",
         |                                                                       ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2401:25: note: 'snprintf' output between 10 and 37 bytes into a destination of size 24
    2401 |                         snprintf(q_vector->name,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
    2402 |                                  sizeof(q_vector->name) - 1, "%s-%s-%d-%d",
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2403 |                                  netdev->name, "TxRx", i, q_vector->v_idx);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hw +7167 drivers/net/ethernet/mucse/rnp/rnp_main.c

  7153	
  7154	/**
  7155	 * rnp_io_error_detected - called when PCI error is detected
  7156	 * @pdev: Pointer to PCI device
  7157	 * @state: The current pci connection state
  7158	 *
  7159	 * This function is called after a PCI bus error affecting
  7160	 * this device has been detected.
  7161	 */
  7162	static pci_ers_result_t rnp_io_error_detected(struct pci_dev *pdev,
  7163			pci_channel_state_t state)
  7164	{
  7165		struct rnp_adapter *adapter = pci_get_drvdata(pdev);
  7166		struct net_device *netdev = adapter->netdev;
> 7167		struct rnp_hw *hw = &adapter->hw;
  7168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
