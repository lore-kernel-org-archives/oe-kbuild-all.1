Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1686D7FD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 00:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708820285; cv=none; b=cGXFCS7DH1z/bddx3lr3I+sC1DrqMsypfuCaVcm3Y1Yc9h3k2hHYLJX7i0C7ZhSj/mjI9n29C5VlYfBdj9+dByfzOsu3QE1KyLmMS+cs/IidBrzzuG+x+SXA13R14E1cYoggCP99tSPHn6VcM0u67keEw+uIB3fJRvREKdXwEB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708820285; c=relaxed/simple;
	bh=NiHuvPSASksv0UMi29umpqs0AbPUBKv0mV0EQCTrfLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hYDNTfyysW84/s9+qawRFarG4YowxzQ8ZG7g2IXK7qG9JH0YCQ8R/khZ0MAX1FUyXWBi3LbIOa922V25Rvwm4jKRUBtqJWI9LURN7ERob4FmujfZjfwNBWsN3pte1c8f/emkI7ndLQaO2fKwkDJ4QlC76obyNyQJPttDMdQaWz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIT59vON; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIT59vON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708820282; x=1740356282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NiHuvPSASksv0UMi29umpqs0AbPUBKv0mV0EQCTrfLA=;
  b=PIT59vONwxNHxxoXJtRH71/7qpXyYVMowsfUE12nC+a5CTnVkSJhsfPZ
   m1gywZmn9FB2gwKoeUgppfNduKcCOmWt5CLCMps7cdbVnu5s1F2ak3KDy
   c7JhYBGzbxZ6g10bYsLFMHB63J6PEfL/lkGskAIDCIUsbdkA65nJh+Skl
   K3x0ylFpfvoZkcZtAzuTq5mLnTidHQHK6sh+tAmfhJOu6cApR3SspVfCB
   YEZ+0FRsbf70DwUzqHAD29R3r0NWYWQ5Y4AAya1qverzyO+TrS7htlcgV
   13zAAD7N7rajg3doWqbI+jSPqZWPS40mpO44lyEarCpsaNMqFZyKr/zPG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3269348"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="3269348"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 16:18:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="37069524"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Feb 2024 16:17:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re2DK-00092C-3C;
	Sun, 25 Feb 2024 00:17:54 +0000
Date: Sun, 25 Feb 2024 08:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/scsi/megaraid/megaraid_sas_fusion.c:3892:6: warning: no
 previous prototype for function 'megasas_enable_irq_poll'
Message-ID: <202402250840.DnEKGs6r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 66d5176831fdaf15f3fc3690a5a9047dec2a0cfc driver: update megaraid_sas to 07.721.02.00
date:   1 year, 2 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240225/202402250840.DnEKGs6r-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402250840.DnEKGs6r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402250840.DnEKGs6r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/megaraid/megaraid_sas_fusion.c:197:1: warning: no previous prototype for function 'megasas_enable_intr_fusion' [-Wmissing-prototypes]
     197 | megasas_enable_intr_fusion(struct megasas_instance *instance)
         | ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:196:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     196 | void
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_fusion.c:220:1: warning: no previous prototype for function 'megasas_disable_intr_fusion' [-Wmissing-prototypes]
     220 | megasas_disable_intr_fusion(struct megasas_instance *instance)
         | ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:219:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     219 | void
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_fusion.c:411:39: warning: variable 'reg_set' set but not used [-Wunused-but-set-variable]
     411 |         struct megasas_register_set __iomem *reg_set;
         |                                              ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:3681:1: warning: no previous prototype for function 'complete_cmd_fusion' [-Wmissing-prototypes]
    3681 | complete_cmd_fusion(struct megasas_instance *instance, u32 MSIxIndex,
         | ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:3680:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3680 | int
         | ^
         | static 
>> drivers/scsi/megaraid/megaraid_sas_fusion.c:3892:6: warning: no previous prototype for function 'megasas_enable_irq_poll' [-Wmissing-prototypes]
    3892 | void megasas_enable_irq_poll(struct megasas_instance *instance)
         |      ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:3892:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3892 | void megasas_enable_irq_poll(struct megasas_instance *instance)
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_fusion.c:3911:6: warning: no previous prototype for function 'megasas_sync_irqs' [-Wmissing-prototypes]
    3911 | void megasas_sync_irqs(unsigned long instance_addr)
         |      ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:3911:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3911 | void megasas_sync_irqs(unsigned long instance_addr)
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_fusion.c:3977:1: warning: no previous prototype for function 'megasas_complete_cmd_dpc_fusion' [-Wmissing-prototypes]
    3977 | megasas_complete_cmd_dpc_fusion(unsigned long instance_addr)
         | ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:3976:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3976 | void
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_fusion.c:3999:13: warning: no previous prototype for function 'megasas_isr_fusion' [-Wmissing-prototypes]
    3999 | irqreturn_t megasas_isr_fusion(int irq, void *devp)
         |             ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:3999:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3999 | irqreturn_t megasas_isr_fusion(int irq, void *devp)
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_fusion.c:4035:1: warning: no previous prototype for function 'build_mpt_mfi_pass_thru' [-Wmissing-prototypes]
    4035 | build_mpt_mfi_pass_thru(struct megasas_instance *instance,
         | ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:4034:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4034 | void
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_fusion.c:4093:1: warning: no previous prototype for function 'build_mpt_cmd' [-Wmissing-prototypes]
    4093 | build_mpt_cmd(struct megasas_instance *instance, struct megasas_cmd *cmd)
         | ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:4092:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4092 | union MEGASAS_REQUEST_DESCRIPTOR_UNION *
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_fusion.c:4119:1: warning: no previous prototype for function 'megasas_issue_dcmd_fusion' [-Wmissing-prototypes]
    4119 | megasas_issue_dcmd_fusion(struct megasas_instance *instance,
         | ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:4118:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4118 | void
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_fusion.c:4318:5: warning: no previous prototype for function 'megasas_wait_for_outstanding_fusion' [-Wmissing-prototypes]
    4318 | int megasas_wait_for_outstanding_fusion(struct megasas_instance *instance,
         |     ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:4318:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4318 | int megasas_wait_for_outstanding_fusion(struct megasas_instance *instance,
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_fusion.c:4449:6: warning: no previous prototype for function 'megasas_refire_mgmt_cmd' [-Wmissing-prototypes]
    4449 | void megasas_refire_mgmt_cmd(struct megasas_instance *instance, bool return_ioctl)
         |      ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:4449:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4449 | void megasas_refire_mgmt_cmd(struct megasas_instance *instance, bool return_ioctl)
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_fusion.c:5020:26: warning: no previous prototype for function 'megasas_get_peer_instance' [-Wmissing-prototypes]
    5020 | struct megasas_instance *megasas_get_peer_instance(struct megasas_instance *instance)
         |                          ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:5020:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5020 | struct megasas_instance *megasas_get_peer_instance(struct megasas_instance *instance)
         | ^
         | static 
   14 warnings generated.
--
   drivers/scsi/megaraid/megaraid_sas_base.c:294:5: warning: no previous prototype for function 'megasas_readl' [-Wmissing-prototypes]
     294 | u32 megasas_readl(struct megasas_instance *instance,
         |     ^
   drivers/scsi/megaraid/megaraid_sas_base.c:294:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     294 | u32 megasas_readl(struct megasas_instance *instance,
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_base.c:356:21: warning: no previous prototype for function 'megasas_get_cmd' [-Wmissing-prototypes]
     356 | struct megasas_cmd *megasas_get_cmd(struct megasas_instance
         |                     ^
   drivers/scsi/megaraid/megaraid_sas_base.c:356:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     356 | struct megasas_cmd *megasas_get_cmd(struct megasas_instance
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_base.c:382:1: warning: no previous prototype for function 'megasas_return_cmd' [-Wmissing-prototypes]
     382 | megasas_return_cmd(struct megasas_instance *instance, struct megasas_cmd *cmd)
         | ^
   drivers/scsi/megaraid/megaraid_sas_base.c:381:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     381 | void
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_base.c:1155:1: warning: no previous prototype for function 'megasas_issue_polled' [-Wmissing-prototypes]
    1155 | megasas_issue_polled(struct megasas_instance *instance, struct megasas_cmd *cmd)
         | ^
   drivers/scsi/megaraid/megaraid_sas_base.c:1154:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1154 | int
         | ^
         | static 
>> drivers/scsi/megaraid/megaraid_sas_base.c:1997:6: warning: no previous prototype for function 'megasas_blk_limits_max_hw_sectors' [-Wmissing-prototypes]
    1997 | void megasas_blk_limits_max_hw_sectors(struct queue_limits *limits, unsigned int max_hw_sectors)
         |      ^
   drivers/scsi/megaraid/megaraid_sas_base.c:1997:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1997 | void megasas_blk_limits_max_hw_sectors(struct queue_limits *limits, unsigned int max_hw_sectors)
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_base.c:2312:6: warning: no previous prototype for function 'megaraid_sas_kill_hba' [-Wmissing-prototypes]
    2312 | void megaraid_sas_kill_hba(struct megasas_instance *instance)
         |      ^
   drivers/scsi/megaraid/megaraid_sas_base.c:2312:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2312 | void megaraid_sas_kill_hba(struct megasas_instance *instance)
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_base.c:2353:1: warning: no previous prototype for function 'megasas_check_and_restore_queue_depth' [-Wmissing-prototypes]
    2353 | megasas_check_and_restore_queue_depth(struct megasas_instance *instance)
         | ^
   drivers/scsi/megaraid/megaraid_sas_base.c:2352:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2352 | void
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_base.c:2434:6: warning: no previous prototype for function 'megasas_start_timer' [-Wmissing-prototypes]
    2434 | void megasas_start_timer(struct megasas_instance *instance)
         |      ^
   drivers/scsi/megaraid/megaraid_sas_base.c:2434:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2434 | void megasas_start_timer(struct megasas_instance *instance)
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_base.c:2759:5: warning: no previous prototype for function 'megasas_sriov_start_heartbeat' [-Wmissing-prototypes]
    2759 | int megasas_sriov_start_heartbeat(struct megasas_instance *instance,
         |     ^
   drivers/scsi/megaraid/megaraid_sas_base.c:2759:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2759 | int megasas_sriov_start_heartbeat(struct megasas_instance *instance,
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_base.c:4607:6: warning: no previous prototype for function 'megasas_free_cmds' [-Wmissing-prototypes]
    4607 | void megasas_free_cmds(struct megasas_instance *instance)
         |      ^
   drivers/scsi/megaraid/megaraid_sas_base.c:4607:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4607 | void megasas_free_cmds(struct megasas_instance *instance)
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_base.c:4644:5: warning: no previous prototype for function 'megasas_alloc_cmds' [-Wmissing-prototypes]
    4644 | int megasas_alloc_cmds(struct megasas_instance *instance)
         |     ^
   drivers/scsi/megaraid/megaraid_sas_base.c:4644:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4644 | int megasas_alloc_cmds(struct megasas_instance *instance)
         | ^
         | static 
   drivers/scsi/megaraid/megaraid_sas_base.c:5928:18: warning: variable 'pdev' set but not used [-Wunused-but-set-variable]
    5928 |         struct pci_dev *pdev;
         |                         ^
   drivers/scsi/megaraid/megaraid_sas_base.c:6021:18: warning: variable 'pdev' set but not used [-Wunused-but-set-variable]
    6021 |         struct pci_dev *pdev;
         |                         ^
>> drivers/scsi/megaraid/megaraid_sas_base.c:6588:5: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
    6588 |                                 if (!intr_coalescing)
         |                                 ^
   drivers/scsi/megaraid/megaraid_sas_base.c:6581:4: note: previous statement is here
    6581 |                         if ((perf_mode >= MR_BALANCED_PERF_MODE) &&
         |                         ^
   drivers/scsi/megaraid/megaraid_sas_base.c:2017:1: warning: unused function 'megasas_queue_flag_set' [-Wunused-function]
    2017 | megasas_queue_flag_set(unsigned int flag, struct request_queue *q)
         | ^~~~~~~~~~~~~~~~~~~~~~
   15 warnings generated.
--
   drivers/scsi/megaraid/megaraid_sas_base.c:495: warning: Incorrect use of kernel-doc format:  * megasas_enable_intr_xscale - Enables interrupts
   drivers/scsi/megaraid/megaraid_sas_base.c:500: warning: Function parameter or member 'instance' not described in 'megasas_enable_intr_xscale'
   drivers/scsi/megaraid/megaraid_sas_base.c:516: warning: Function parameter or member 'instance' not described in 'megasas_disable_intr_xscale'
   drivers/scsi/megaraid/megaraid_sas_base.c:516: warning: Excess function parameter 'regs' description in 'megasas_disable_intr_xscale'
   drivers/scsi/megaraid/megaraid_sas_base.c:532: warning: Function parameter or member 'instance' not described in 'megasas_read_fw_status_reg_xscale'
   drivers/scsi/megaraid/megaraid_sas_base.c:532: warning: Excess function parameter 'regs' description in 'megasas_read_fw_status_reg_xscale'
   drivers/scsi/megaraid/megaraid_sas_base.c:541: warning: Function parameter or member 'instance' not described in 'megasas_clear_intr_xscale'
   drivers/scsi/megaraid/megaraid_sas_base.c:541: warning: Excess function parameter 'regs' description in 'megasas_clear_intr_xscale'
   drivers/scsi/megaraid/megaraid_sas_base.c:580: warning: Function parameter or member 'instance' not described in 'megasas_fire_cmd_xscale'
   drivers/scsi/megaraid/megaraid_sas_base.c:596: warning: Function parameter or member 'instance' not described in 'megasas_adp_reset_xscale'
   drivers/scsi/megaraid/megaraid_sas_base.c:637: warning: Function parameter or member 'instance' not described in 'megasas_check_reset_xscale'
   drivers/scsi/megaraid/megaraid_sas_base.c:667: warning: Incorrect use of kernel-doc format: *       The following functions are defined for ppc (deviceid : 0x60)
   drivers/scsi/megaraid/megaraid_sas_base.c:672: warning: Incorrect use of kernel-doc format:  * megasas_enable_intr_ppc -    Enables interrupts
   drivers/scsi/megaraid/megaraid_sas_base.c:677: warning: Function parameter or member 'instance' not described in 'megasas_enable_intr_ppc'
   drivers/scsi/megaraid/megaraid_sas_base.c:695: warning: Function parameter or member 'instance' not described in 'megasas_disable_intr_ppc'
   drivers/scsi/megaraid/megaraid_sas_base.c:695: warning: Excess function parameter 'regs' description in 'megasas_disable_intr_ppc'
   drivers/scsi/megaraid/megaraid_sas_base.c:711: warning: Function parameter or member 'instance' not described in 'megasas_read_fw_status_reg_ppc'
   drivers/scsi/megaraid/megaraid_sas_base.c:711: warning: Excess function parameter 'regs' description in 'megasas_read_fw_status_reg_ppc'
   drivers/scsi/megaraid/megaraid_sas_base.c:721: warning: Function parameter or member 'instance' not described in 'megasas_clear_intr_ppc'
   drivers/scsi/megaraid/megaraid_sas_base.c:721: warning: Excess function parameter 'regs' description in 'megasas_clear_intr_ppc'
   drivers/scsi/megaraid/megaraid_sas_base.c:759: warning: Function parameter or member 'instance' not described in 'megasas_fire_cmd_ppc'
   drivers/scsi/megaraid/megaraid_sas_base.c:775: warning: Function parameter or member 'instance' not described in 'megasas_check_reset_ppc'
   drivers/scsi/megaraid/megaraid_sas_base.c:804: warning: Function parameter or member 'instance' not described in 'megasas_enable_intr_skinny'
   drivers/scsi/megaraid/megaraid_sas_base.c:804: warning: Excess function parameter 'regs' description in 'megasas_enable_intr_skinny'
   drivers/scsi/megaraid/megaraid_sas_base.c:822: warning: Function parameter or member 'instance' not described in 'megasas_disable_intr_skinny'
   drivers/scsi/megaraid/megaraid_sas_base.c:822: warning: Excess function parameter 'regs' description in 'megasas_disable_intr_skinny'
   drivers/scsi/megaraid/megaraid_sas_base.c:838: warning: Function parameter or member 'instance' not described in 'megasas_read_fw_status_reg_skinny'
   drivers/scsi/megaraid/megaraid_sas_base.c:838: warning: Excess function parameter 'regs' description in 'megasas_read_fw_status_reg_skinny'
   drivers/scsi/megaraid/megaraid_sas_base.c:848: warning: Function parameter or member 'instance' not described in 'megasas_clear_intr_skinny'
   drivers/scsi/megaraid/megaraid_sas_base.c:848: warning: Excess function parameter 'regs' description in 'megasas_clear_intr_skinny'
   drivers/scsi/megaraid/megaraid_sas_base.c:896: warning: Function parameter or member 'instance' not described in 'megasas_fire_cmd_skinny'
   drivers/scsi/megaraid/megaraid_sas_base.c:918: warning: Function parameter or member 'instance' not described in 'megasas_check_reset_skinny'
   drivers/scsi/megaraid/megaraid_sas_base.c:948: warning: Incorrect use of kernel-doc format:  * megasas_enable_intr_gen2 -  Enables interrupts
   drivers/scsi/megaraid/megaraid_sas_base.c:953: warning: Function parameter or member 'instance' not described in 'megasas_enable_intr_gen2'
   drivers/scsi/megaraid/megaraid_sas_base.c:972: warning: Function parameter or member 'instance' not described in 'megasas_disable_intr_gen2'
   drivers/scsi/megaraid/megaraid_sas_base.c:972: warning: Excess function parameter 'regs' description in 'megasas_disable_intr_gen2'
   drivers/scsi/megaraid/megaraid_sas_base.c:988: warning: Function parameter or member 'instance' not described in 'megasas_read_fw_status_reg_gen2'
   drivers/scsi/megaraid/megaraid_sas_base.c:988: warning: Excess function parameter 'regs' description in 'megasas_read_fw_status_reg_gen2'
   drivers/scsi/megaraid/megaraid_sas_base.c:998: warning: Function parameter or member 'instance' not described in 'megasas_clear_intr_gen2'
   drivers/scsi/megaraid/megaraid_sas_base.c:998: warning: Excess function parameter 'regs' description in 'megasas_clear_intr_gen2'
   drivers/scsi/megaraid/megaraid_sas_base.c:1038: warning: Function parameter or member 'instance' not described in 'megasas_fire_cmd_gen2'
   drivers/scsi/megaraid/megaraid_sas_base.c:1054: warning: Function parameter or member 'instance' not described in 'megasas_adp_reset_gen2'
   drivers/scsi/megaraid/megaraid_sas_base.c:1054: warning: Function parameter or member 'reg_set' not described in 'megasas_adp_reset_gen2'
   drivers/scsi/megaraid/megaraid_sas_base.c:1054: warning: Excess function parameter 'regs' description in 'megasas_adp_reset_gen2'
   drivers/scsi/megaraid/megaraid_sas_base.c:1114: warning: Function parameter or member 'instance' not described in 'megasas_check_reset_gen2'
   drivers/scsi/megaraid/megaraid_sas_base.c:1145: warning: cannot understand function prototype: 'struct megasas_instance_template megasas_instance_template_fusion; '
   drivers/scsi/megaraid/megaraid_sas_base.c:1678: warning: Function parameter or member 'cmd' not described in 'megasas_cmd_type'
   drivers/scsi/megaraid/megaraid_sas_base.c:1678: warning: Excess function parameter 'scmd' description in 'megasas_cmd_type'
   drivers/scsi/megaraid/megaraid_sas_base.c:1819: warning: Function parameter or member 'shost' not described in 'megasas_queue_command'
   drivers/scsi/megaraid/megaraid_sas_base.c:1819: warning: Excess function parameter 'done' description in 'megasas_queue_command'
>> drivers/scsi/megaraid/megaraid_sas_base.c:3092: warning: Function parameter or member 'buf' not described in 'megasas_dump'
>> drivers/scsi/megaraid/megaraid_sas_base.c:3092: warning: Function parameter or member 'sz' not described in 'megasas_dump'
>> drivers/scsi/megaraid/megaraid_sas_base.c:3092: warning: Function parameter or member 'format' not described in 'megasas_dump'
>> drivers/scsi/megaraid/megaraid_sas_base.c:3132: warning: Function parameter or member 'scmd' not described in 'megasas_dump_fusion_io'
   drivers/scsi/megaraid/megaraid_sas_base.c:3190: warning: Function parameter or member 'scmd' not described in 'megasas_reset_bus_host'
   drivers/scsi/megaraid/megaraid_sas_base.c:4103: warning: Function parameter or member 'instance' not described in 'megasas_internal_reset_defer_cmds'
   drivers/scsi/megaraid/megaraid_sas_base.c:4280: warning: Function parameter or member 'irq' not described in 'megasas_isr'
   drivers/scsi/megaraid/megaraid_sas_base.c:4280: warning: Function parameter or member 'devp' not described in 'megasas_isr'
   drivers/scsi/megaraid/megaraid_sas_base.c:4307: warning: Function parameter or member 'ocr' not described in 'megasas_transition_to_ready'
   drivers/scsi/megaraid/megaraid_sas_base.c:5064: warning: Function parameter or member 'query_type' not described in 'megasas_ld_list_query'
   drivers/scsi/megaraid/megaraid_sas_base.c:5064: warning: Excess function parameter 'ld_list' description in 'megasas_ld_list_query'
>> drivers/scsi/megaraid/megaraid_sas_base.c:5372: warning: Function parameter or member 'instance' not described in 'megasas_get_snapdump_properties'
>> drivers/scsi/megaraid/megaraid_sas_base.c:5889: warning: Function parameter or member 'instance' not described in 'megasas_irq_set_affinity_hint'
   drivers/scsi/megaraid/megaraid_sas_base.c:6101: warning: Excess function parameter 'is_probe' description in 'megasas_setup_jbod_map'
   drivers/scsi/megaraid/megaraid_sas_base.c:6981: warning: Function parameter or member 'class_locale_word' not described in 'megasas_register_aen'
   drivers/scsi/megaraid/megaraid_sas_base.c:6981: warning: Excess function parameter 'class_locale' description in 'megasas_register_aen'
>> drivers/scsi/megaraid/megaraid_sas_base.c:7379: warning: Function parameter or member 'dev' not described in 'megasas_dma_set_mask_and_coherent'
>> drivers/scsi/megaraid/megaraid_sas_base.c:7379: warning: Function parameter or member 'mask' not described in 'megasas_dma_set_mask_and_coherent'
   drivers/scsi/megaraid/megaraid_sas_base.c:7604: warning: Function parameter or member 'instance' not described in 'megasas_alloc_ctrl_dma_buffers'
   drivers/scsi/megaraid/megaraid_sas_base.c:8610: warning: Function parameter or member 'pdev' not described in 'megasas_shutdown'
   drivers/scsi/megaraid/megaraid_sas_base.c:8610: warning: Excess function parameter 'device' description in 'megasas_shutdown'
   drivers/scsi/megaraid/megaraid_sas_base.c:8634: warning: Function parameter or member 'inode' not described in 'megasas_mgmt_open'
   drivers/scsi/megaraid/megaraid_sas_base.c:8634: warning: Function parameter or member 'filep' not described in 'megasas_mgmt_open'
>> drivers/scsi/megaraid/megaraid_sas_base.c:8648: warning: Function parameter or member 'inode' not described in 'megasas_mgmt_release'
>> drivers/scsi/megaraid/megaraid_sas_base.c:8648: warning: Function parameter or member 'filep' not described in 'megasas_mgmt_release'
   drivers/scsi/megaraid/megaraid_sas_base.c:8662: warning: Function parameter or member 'fd' not described in 'megasas_mgmt_fasync'
   drivers/scsi/megaraid/megaraid_sas_base.c:8662: warning: Function parameter or member 'filep' not described in 'megasas_mgmt_fasync'
   drivers/scsi/megaraid/megaraid_sas_base.c:8662: warning: Function parameter or member 'mode' not described in 'megasas_mgmt_fasync'
   drivers/scsi/megaraid/megaraid_sas_base.c:8686: warning: Function parameter or member 'file' not described in 'megasas_mgmt_poll'
   drivers/scsi/megaraid/megaraid_sas_base.c:8686: warning: Function parameter or member 'wait' not described in 'megasas_mgmt_poll'
   drivers/scsi/megaraid/megaraid_sas_base.c:8748: warning: Function parameter or member 'user_ioc' not described in 'megasas_mgmt_fw_ioctl'
   drivers/scsi/megaraid/megaraid_sas_base.c:8748: warning: Function parameter or member 'ioc' not described in 'megasas_mgmt_fw_ioctl'
   drivers/scsi/megaraid/megaraid_sas_base.c:8748: warning: Excess function parameter 'argp' description in 'megasas_mgmt_fw_ioctl'
   drivers/scsi/megaraid/megaraid_sas_base.c:9089: warning: Function parameter or member 'file' not described in 'megasas_mgmt_ioctl'
   drivers/scsi/megaraid/megaraid_sas_base.c:9089: warning: Function parameter or member 'cmd' not described in 'megasas_mgmt_ioctl'
   drivers/scsi/megaraid/megaraid_sas_base.c:9089: warning: Function parameter or member 'arg' not described in 'megasas_mgmt_ioctl'


vim +/megasas_enable_irq_poll +3892 drivers/scsi/megaraid/megaraid_sas_fusion.c

  3888	
  3889	/*
  3890	 * megasas_enable_irq_poll() - enable irqpoll
  3891	 */
> 3892	void megasas_enable_irq_poll(struct megasas_instance *instance)
  3893	{
  3894	#if defined(ENABLE_IRQ_POLL)
  3895		u32 count, i;
  3896		struct megasas_irq_context *irq_ctx;
  3897	
  3898		count = instance->msix_vectors > 0 ? instance->msix_vectors : 1;
  3899	
  3900		for (i = 0; i < count; i++) {
  3901			irq_ctx = &instance->irq_context[i];
  3902			irq_poll_enable(&irq_ctx->irqpoll);
  3903		}
  3904	#endif
  3905	}
  3906	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
