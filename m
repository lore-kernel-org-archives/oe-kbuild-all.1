Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE22257AD1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 21:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762550189; cv=none; b=TuiDrp/on3YIRlix5NhUUmpJz+4/mabrWvFSD9rq7+LCi8/84utbtp/ScUNifW0zxTuhxrfocTb90SsqRGLm5jO1GKu/wvuvS4p6MKd3A1DIrhhSXVq9qc8+UjykcgKZutl13/0o4qRifO8klPcoRrbACC6uUTxeSaxqREqUieU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762550189; c=relaxed/simple;
	bh=nNRoSYdPQ51kfSTiYmZP4rz+UFe0Eah6sY1AWP6/5/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tBMCozOgkQNkgIIUt/wtBfYEMJFLJ9uMZDGm3tC46grqC0DrFo1W9cT/xi/A9yV4sWP92g42q2SmR0LJEhga2BaEaGb4/mhsAd40LQWA992wCp8oa5wcA94NzZWGpPF3pT1t+BIIiKN1TwCdnf6FjAOsPE200D8SUEFoJT3dpyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpJZIRDl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpJZIRDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762550187; x=1794086187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nNRoSYdPQ51kfSTiYmZP4rz+UFe0Eah6sY1AWP6/5/g=;
  b=BpJZIRDlgHBhjf6qJQIPZW8a1uXEz/ekT1sbP4MiGijuOFq/Uljpuc3Z
   uD+xxTChh8zerOsbPvwCf9T5J/lTSQY5jwD+GOG41p0Z/pYeerg1QwoGY
   LefecIFO+cwRY2ry1WL/nrTU1+PRQUKZ6OKNlmG8QCDEtDNpI8tZt1pHu
   sAWIYnHWPVWUZq8mo1ZLIDxQy1wmsm5hJoW+ZOZ3DO1kYhrErCDsbgpMj
   mYdBPzKgpwuoFCQuJJlFICJHGr4W/5nEceJQI5LRwqEqdRUDTQ5zaKjFV
   SGaBZ5g32ccWoJXmmPcR8VlVLJWyPPEIVCEmD2rUsF01sfVO6UJhI1iv5
   g==;
X-CSE-ConnectionGUID: ADe/q0QfTZe1uKuFpqgdvg==
X-CSE-MsgGUID: 8oRbf2D3SYKWxZMzmm4dLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64621385"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="64621385"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 13:16:26 -0800
X-CSE-ConnectionGUID: jyJ3b/H3Ta6hBJgATJuo2w==
X-CSE-MsgGUID: DJbLW0MsSCqOFjTNS/Bblw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="225394094"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Nov 2025 13:16:25 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHTok-0000NH-2E;
	Fri, 07 Nov 2025 21:16:22 +0000
Date: Sat, 8 Nov 2025 05:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-EDAC-ANBZ25520 16/16]
 drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:545:5: error: no previous
 prototype for 'ps3_pci_init'
Message-ID: <202511080528.uSfDue2u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-EDAC-ANBZ25520
head:   1ab97dd0d1ee295351a5123c2ab5d073aac3548b
commit: 4e26f605716a88a00d0e51dfd7da55198b13d759 [16/16] anolis: scsi: support linkdata HBA/RAID controllers
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20251108/202511080528.uSfDue2u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080528.uSfDue2u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080528.uSfDue2u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/linkdata/ps3stor/ps3_ioc_manager.c:307:5: error: no previous prototype for 'ps3_hard_reset_to_ready' [-Werror=missing-prototypes]
     307 | int ps3_hard_reset_to_ready(struct ps3_instance *instance)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:131:6: error: no previous prototype for 'ps3_trigger_irq_poll' [-Werror=missing-prototypes]
     131 | void ps3_trigger_irq_poll(struct ps3_irq *irq)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:243:5: error: no previous prototype for 'ps3_resp_status_convert' [-Werror=missing-prototypes]
     243 | int ps3_resp_status_convert(unsigned int resp_status)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:211:1: error: no previous prototype for 'ps3_qos_cmd_waitq_get' [-Werror=missing-prototypes]
     211 | ps3_qos_cmd_waitq_get(struct ps3_qos_tg_context *qos_tg_ctx,
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:335:15: error: no previous prototype for 'ps3_qos_vd_cmdword_get' [-Werror=missing-prototypes]
     335 | unsigned char ps3_qos_vd_cmdword_get(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:351:15: error: no previous prototype for 'ps3_qos_exclusive_cmdword_get' [-Werror=missing-prototypes]
     351 | unsigned char ps3_qos_exclusive_cmdword_get(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:363:15: error: no previous prototype for 'ps3_qos_tg_decision' [-Werror=missing-prototypes]
     363 | unsigned char ps3_qos_tg_decision(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:749:15: error: no previous prototype for 'ps3_qos_all_pd_rc_get' [-Werror=missing-prototypes]
     749 | unsigned char ps3_qos_all_pd_rc_get(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:876:6: error: no previous prototype for 'ps3_pd_quota_waitq_clear_all' [-Werror=missing-prototypes]
     876 | void ps3_pd_quota_waitq_clear_all(struct ps3_qos_pd_mgr *qos_pd_mgr,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:892:6: error: no previous prototype for 'ps3_pd_quota_waitq_clean' [-Werror=missing-prototypes]
     892 | void ps3_pd_quota_waitq_clean(struct ps3_qos_pd_mgr *qos_pd_mgr,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:1058:6: error: no previous prototype for 'ps3_qos_pd_waitq_ratio_update' [-Werror=missing-prototypes]
    1058 | void ps3_qos_pd_waitq_ratio_update(struct ps3_qos_pd_mgr *qos_pd_mgr)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2019:15: error: no previous prototype for 'ps3_hba_qos_decision' [-Werror=missing-prototypes]
    2019 | unsigned char ps3_hba_qos_decision(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2040:6: error: no previous prototype for 'ps3_hba_qos_waitq_notify' [-Werror=missing-prototypes]
    2040 | void ps3_hba_qos_waitq_notify(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2100:6: error: no previous prototype for 'ps3_cmd_waitq_abort' [-Werror=missing-prototypes]
    2100 | bool ps3_cmd_waitq_abort(struct ps3_cmd *aborted_cmd)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2463:6: error: no previous prototype for 'ps3_hba_qos_waitq_clear_all' [-Werror=missing-prototypes]
    2463 | void ps3_hba_qos_waitq_clear_all(struct ps3_instance *instance, int resp_status)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2827:6: error: no previous prototype for 'ps3_hba_qos_vd_init' [-Werror=missing-prototypes]
    2827 | void ps3_hba_qos_vd_init(struct ps3_instance *instance,
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2936:6: error: no previous prototype for 'ps3_hba_qos_vd_reset' [-Werror=missing-prototypes]
    2936 | void ps3_hba_qos_vd_reset(struct ps3_instance *instance, unsigned short disk_id)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3023:6: error: no previous prototype for 'ps3_hba_qos_waitq_poll' [-Werror=missing-prototypes]
    3023 | void ps3_hba_qos_waitq_poll(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3279:15: error: no previous prototype for 'ps3_raid_qos_decision' [-Werror=missing-prototypes]
    3279 | unsigned char ps3_raid_qos_decision(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3334:6: error: no previous prototype for 'ps3_qos_mgrq_resend' [-Werror=missing-prototypes]
    3334 | void ps3_qos_mgrq_resend(struct ps3_qos_softq_mgr *softq_mgr)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3478:6: error: no previous prototype for 'ps3_raid_qos_waitq_notify' [-Werror=missing-prototypes]
    3478 | void ps3_raid_qos_waitq_notify(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3821:15: error: no previous prototype for 'ps3_raid_qos_waitq_abort' [-Werror=missing-prototypes]
    3821 | unsigned char ps3_raid_qos_waitq_abort(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:4022:6: error: no previous prototype for 'ps3_raid_qos_waitq_clear_all' [-Werror=missing-prototypes]
    4022 | void ps3_raid_qos_waitq_clear_all(struct ps3_instance *instance,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:4083:6: error: no previous prototype for 'ps3_raid_qos_waitq_poll' [-Werror=missing-prototypes]
    4083 | void ps3_raid_qos_waitq_poll(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_ioctl.c:785:6: error: no previous prototype for 'ps3_clean_mgr_cmd' [-Werror=missing-prototypes]
     785 | void ps3_clean_mgr_cmd(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_debug.c:883:5: error: no previous prototype for 'ps3_dump_dir_length' [-Werror=missing-prototypes]
     883 | int ps3_dump_dir_length(const char *buf, size_t count)
         |     ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_module_para.c:609:14: error: no previous prototype for 'ps3_cli_ver_query' [-Werror=missing-prototypes]
     609 | unsigned int ps3_cli_ver_query(void)
         |              ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_rb_tree.c:154:6: error: no previous prototype for 'rbtDelNodeDo' [-Werror=missing-prototypes]
     154 | void rbtDelNodeDo(struct Ps3RbRoot *pRoot, struct Ps3RbNode *pNode)
         |      ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:28:27: error: 'PS3_HDD_IOPS_MSIX_VECTORS' defined but not used [-Werror=unused-const-variable=]
      28 | static const unsigned int PS3_HDD_IOPS_MSIX_VECTORS = 8;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:27:27: error: 'PS3_SSD_IOPS_MSIX_VECTORS' defined but not used [-Werror=unused-const-variable=]
      27 | static const unsigned int PS3_SSD_IOPS_MSIX_VECTORS = 8;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:25:27: error: 'PS3_INTERRUPT_CLEAR_IRQ' defined but not used [-Werror=unused-const-variable=]
      25 | static const unsigned int PS3_INTERRUPT_CLEAR_IRQ = 0x00000001;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:24:27: error: 'PS3_INTERRUPT_STATUS_EXIST_IRQ' defined but not used [-Werror=unused-const-variable=]
      24 | static const unsigned int PS3_INTERRUPT_STATUS_EXIST_IRQ = 0x00000001;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:23:27: error: 'PS3_INTERRUPT_MASK_DISABLE' defined but not used [-Werror=unused-const-variable=]
      23 | static const unsigned int PS3_INTERRUPT_MASK_DISABLE = 0x00000002;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:22:27: error: 'PS3_INTERRUPT_CMD_ENABLE_MSIX' defined but not used [-Werror=unused-const-variable=]
      22 | static const unsigned int PS3_INTERRUPT_CMD_ENABLE_MSIX = 0x01;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_irq.c:21:27: error: 'PS3_INTERRUPT_CMD_DISABLE_ALL_MASK' defined but not used [-Werror=unused-const-variable=]
      21 | static const unsigned int PS3_INTERRUPT_CMD_DISABLE_ALL_MASK = 0x02;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_recovery.c:72:30: error: no previous prototype for 'ps3_recovery_context_alloc' [-Werror=missing-prototypes]
      72 | struct ps3_recovery_context *ps3_recovery_context_alloc(void)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_recovery.c:82:6: error: no previous prototype for 'ps3_recovery_context_free' [-Werror=missing-prototypes]
      82 | void ps3_recovery_context_free(struct ps3_recovery_context *context)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_recovery.c:88:6: error: no previous prototype for 'ps3_recovery_context_delete' [-Werror=missing-prototypes]
      88 | void ps3_recovery_context_delete(struct ps3_recovery_context *context)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_recovery.c:204:6: error: no previous prototype for 'ps3_recovery_irq_queue_destroy' [-Werror=missing-prototypes]
     204 | void ps3_recovery_irq_queue_destroy(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_recovery.c:363:5: error: no previous prototype for 'ps3_recovery_state_transfer' [-Werror=missing-prototypes]
     363 | int ps3_recovery_state_transfer(struct ps3_instance *instance,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_recovery.c:2700:6: error: no previous prototype for 'ps3_hard_recovery_state_finish' [-Werror=missing-prototypes]
    2700 | void ps3_hard_recovery_state_finish(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:545:5: error: no previous prototype for 'ps3_pci_init' [-Werror=missing-prototypes]
     545 | int ps3_pci_init(struct pci_dev *pdev, struct ps3_instance *instance)
         |     ^~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:899:5: error: no previous prototype for 'ps3_pci_init_complete' [-Werror=missing-prototypes]
     899 | int ps3_pci_init_complete(struct ps3_instance *instance)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:945:6: error: no previous prototype for 'ps3_pci_init_complete_exit' [-Werror=missing-prototypes]
     945 | void ps3_pci_init_complete_exit(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/./linux/ps3_dump.c:28:5: error: no previous prototype for 'ps3_dump_local_time' [-Werror=missing-prototypes]
      28 | int ps3_dump_local_time(struct rtc_time *tm)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/./linux/ps3_dump.c:50:5: error: no previous prototype for 'ps3_dump_filename_build' [-Werror=missing-prototypes]
      50 | int ps3_dump_filename_build(struct ps3_instance *instance, char *filename,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/./linux/ps3_dump.c:76:5: error: no previous prototype for 'ps3_dump_file_open' [-Werror=missing-prototypes]
      76 | int ps3_dump_file_open(struct ps3_dump_context *ctxt, unsigned int dump_type)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/./linux/ps3_dump.c:159:5: error: no previous prototype for 'ps3_dump_file_write' [-Werror=missing-prototypes]
     159 | int ps3_dump_file_write(struct ps3_dump_file_info *file_info, unsigned char *buf, unsigned int len)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/./linux/ps3_dump.c:200:5: error: no previous prototype for 'ps3_dump_file_close' [-Werror=missing-prototypes]
     200 | int ps3_dump_file_close(struct ps3_dump_file_info *file_info)
         |     ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/ps3_pci_init +545 drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c

   544	
 > 545	int ps3_pci_init(struct pci_dev *pdev, struct ps3_instance *instance)
   546	{
   547		resource_size_t base_addr = 0;
   548		int ret = PS3_SUCCESS;
   549	
   550		ret = pci_enable_device_mem(pdev);
   551		if (ret != PS3_SUCCESS) {
   552			LOG_ERROR("hno:%u pci id[%u] pci enable failed\n",
   553				  PS3_HOST(instance), pdev->dev.id);
   554			goto l_pci_enable_device_mem_failed;
   555		}
   556	
   557		pci_set_master(pdev);
   558	
   559		instance->reg_bar = PS3_REGISTER_BAR_INDEX;
   560		ret = (pci_resource_flags(pdev, instance->reg_bar) & IORESOURCE_MEM);
   561		if (!ret) {
   562			LOG_ERROR("hno:%u Bar %lu isnot IORESOURCE_MEM\n",
   563				  PS3_HOST(instance), instance->reg_bar);
   564			goto l_bar_check_failed;
   565		}
   566		ret = pci_request_selected_regions(pdev, 1 << instance->reg_bar,
   567						   "PS3 pci regions");
   568		if (ret != PS3_SUCCESS) {
   569			LOG_ERROR("hno:%u IO memory region busy\n", PS3_HOST(instance));
   570			goto l_pci_request_selected_regions_failed;
   571		}
   572	#if defined(PS3_SUPPORT_PCIE_REPORT)
   573		pci_enable_pcie_error_reporting(pdev);
   574	#endif
   575		if (instance->ioc_adpter->reg_set) {
   576			instance->reg_set =
   577				(struct Ps3Fifo __iomem *)instance->ioc_adpter->reg_set(
   578					pdev, instance->reg_bar);
   579		} else {
   580			instance->reg_set = (struct Ps3Fifo __iomem *)ioremap(
   581				pci_resource_start(pdev, instance->reg_bar),
   582				PS3_REGISTER_SET_SIZE);
   583		}
   584		if (instance->reg_set == NULL) {
   585			LOG_ERROR("hno:%u ioremap failed\n", PS3_HOST(instance));
   586			goto l_ioremap_failed;
   587		} else {
   588			pci_set_drvdata(pdev, instance);
   589		}
   590	
   591		ps3_atomic_set(&instance->watchdog_reg_read_fail_count, 0);
   592		LOG_INFO(
   593			"reg_bar_idx = %lu, bar_base_paddr = 0x%llx, reg_set_vaddr = 0x%p\n",
   594			instance->reg_bar, (unsigned long long)base_addr, instance->reg_set);
   595	
   596		return PS3_SUCCESS;
   597	l_ioremap_failed:
   598		pci_release_selected_regions(instance->pdev, 1 << instance->reg_bar);
   599	#if defined(PS3_SUPPORT_PCIE_REPORT)
   600		pci_disable_pcie_error_reporting(pdev);
   601	#endif
   602	l_pci_request_selected_regions_failed:
   603		pci_disable_device(instance->pdev);
   604	l_bar_check_failed:
   605	l_pci_enable_device_mem_failed:
   606		return -PS3_FAILED;
   607	}
   608	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
