Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88428DB49
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766323641; cv=none; b=VNyP/5rumG+6B+zMWJcaGs/+s6MOFTa4jt6s6XalaK0TGujVFDcexM/GwjTmBWPmc5SEpW7hIDaOek5Jf/LuD5ImBY8RpUwRsrDgYhVjLa6/HCTxTEGgBv+EzZf4SMLkHXLpSHVrD21A2+0oYb7XMYgOmMAQN3o0G/HDmtgxvs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766323641; c=relaxed/simple;
	bh=4vmCMNsIySU2uqeGfq5hF2y3EMtVjRzJ+LiOL9MVeGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cfm+Eef063SgKV7uhA3zgDbamFg97I2pbQUSRkRSHSRfUm8PAjRK94/C/xVH9f8pWmuJlGNmNHPKAbe4H7ffzr1cxNCYXLwHbuVzACqFjuDfcnDCPqPiwjjQqsDviGK9rXwHhAm8hhq1uhEw/4ZNzDazaDDIsO4Xi5eikVqt2Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hveRZYda; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hveRZYda"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766323639; x=1797859639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4vmCMNsIySU2uqeGfq5hF2y3EMtVjRzJ+LiOL9MVeGY=;
  b=hveRZYda2JHNxL9sV6P72/+Z2c9ydgpgxIyk90/vbt3+5CLf4Q6TYcek
   GlfSUUjmGWmkQO5pBIu8MkiK856t2ZYPKfFnl/PK0QQucdR4Tai0yQ2rS
   tFAqL885wU7BL5DHzpJhHygyZER0I7UaDM2H34D6OWbDEZInDd/sPqGzI
   iyxdfuNvSWfoVVV0yk2LnZ5X+a/wbRl4EGoVn4pWGdD28bcTPjoY1eRor
   GXZV1+J+IPhOtia30u+ex0TNzBsIn90H4ChzExzv+7egvLu6Cb/4gxhYM
   vW4Q0PExUNied7WEjZYYJIojaIXzerMhBkZPRTnxcJzvry8aZ/wVw/BzL
   A==;
X-CSE-ConnectionGUID: aGXjJKvTQr6nKzPaqHF0ww==
X-CSE-MsgGUID: gY4zljrURQuGRfQj3FcgCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72066741"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="72066741"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 05:27:19 -0800
X-CSE-ConnectionGUID: CbG8j8D9RsC9K9M2DrYmBA==
X-CSE-MsgGUID: 8Umf5yUJQfm7KYUkSXjkXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199267491"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Dec 2025 05:27:18 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXJSs-000000005h7-3ORz;
	Sun, 21 Dec 2025 13:27:14 +0000
Date: Sun, 21 Dec 2025 21:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-Uncore-sysfs-ANBZ26617 18/18]
 drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:545:5: error: no previous
 prototype for 'ps3_pci_init'
Message-ID: <202512212148.kJXTmm89-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liujie_answer,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-Uncore-sysfs-ANBZ26617
head:   ca5ab61a687caf05d0e5c5b4a24434fa6fe362b0
commit: b94b04b8f028da64ee7ab3215f07ca548cb261dd [18/18] anolis: scsi: support linkdata HBA/RAID controllers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251221/202512212148.kJXTmm89-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212148.kJXTmm89-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212148.kJXTmm89-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/linkdata/ps3stor/ps3_ioc_manager.c:307:5: error: no previous prototype for 'ps3_hard_reset_to_ready' [-Werror=missing-prototypes]
     307 | int ps3_hard_reset_to_ready(struct ps3_instance *instance)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:876:6: error: no previous prototype for 'ps3_set_task_manager_busy' [-Werror=missing-prototypes]
     876 | void ps3_set_task_manager_busy(struct ps3_instance *instance,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:1110:5: error: no previous prototype for 'ps3_wait_for_outstanding_complete' [-Werror=missing-prototypes]
    1110 | int ps3_wait_for_outstanding_complete(struct ps3_instance *instance)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:131:6: error: no previous prototype for 'ps3_trigger_irq_poll' [-Werror=missing-prototypes]
     131 | void ps3_trigger_irq_poll(struct ps3_irq *irq)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:243:5: error: no previous prototype for 'ps3_resp_status_convert' [-Werror=missing-prototypes]
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
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.c:85:6: error: no previous prototype for 'ps3_cmd_stat_content_clear' [-Werror=missing-prototypes]
      85 | void ps3_cmd_stat_content_clear(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.c:403:6: error: no previous prototype for 'ps3_io_recv_ok_stat_inc' [-Werror=missing-prototypes]
     403 | void ps3_io_recv_ok_stat_inc(struct ps3_instance *ins,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_ioctl.c:785:6: error: no previous prototype for 'ps3_clean_mgr_cmd' [-Werror=missing-prototypes]
     785 | void ps3_clean_mgr_cmd(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:578:5: error: no previous prototype for 'ps3_r1x_hash_bit_check' [-Werror=missing-prototypes]
     578 | int ps3_r1x_hash_bit_check(struct ps3_r1x_hash_bit_mgr *hash_mgr,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:678:6: error: no previous prototype for 'ps3_r1x_conflict_queue_hash_bit_lock' [-Werror=missing-prototypes]
     678 | void ps3_r1x_conflict_queue_hash_bit_lock(struct ps3_r1x_lock_mgr *mgr,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:730:5: error: no previous prototype for 'ps3_r1x_hash_bit_lock' [-Werror=missing-prototypes]
     730 | int ps3_r1x_hash_bit_lock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:988:6: error: no previous prototype for 'ps3_r1x_hash_bit_unlock' [-Werror=missing-prototypes]
     988 | void ps3_r1x_hash_bit_unlock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1173:5: error: no previous prototype for 'ps3_range_check_and_insert' [-Werror=missing-prototypes]
    1173 | int ps3_range_check_and_insert(struct ps3_range_tree_root *range_root,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1231:5: error: no previous prototype for 'ps3_r1x_hash_range_lock' [-Werror=missing-prototypes]
    1231 | int ps3_r1x_hash_range_lock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1312:6: error: no previous prototype for 'ps3_r1x_hash_range_unlock' [-Werror=missing-prototypes]
    1312 | void ps3_r1x_hash_range_unlock(struct ps3_r1x_lock_mgr *mgr,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/scsi/linkdata/ps3stor/ps3_device_manager.c:1581:5: error: no previous prototype for 'ps3_scsi_private_init_pd' [-Werror=missing-prototypes]
    1581 | int ps3_scsi_private_init_pd(struct scsi_device *sdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_device_manager.c:1663:5: error: no previous prototype for 'ps3_scsi_private_init_vd' [-Werror=missing-prototypes]
    1663 | int ps3_scsi_private_init_vd(struct scsi_device *sdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
..


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
