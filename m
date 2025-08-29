Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C67242D7C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 20:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756500318; cv=none; b=Goy47fpmReaw2PVywBttSP/6Q+8AQgdNQodfGT1+dFf32adrkhE8degXvvcd+KDdgm1micjPNkdCdaK8ytr+lmScOXLd7epNa/67T1+JWftXAkmBrENCp/wo48lIm88UTGEuWsE4S1OWNewiMF4w7Jwid3LGfAeOiF3nG2LQmCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756500318; c=relaxed/simple;
	bh=I+OtvSXkgCd2PzNqtbowyIFDXdHtLAyH7dWkpsHvQd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y27X4wQbEygr9OrpjrjPN71GkFtk1eqhOI02C0oHa4MpWbXBlnnRlRVvCr8bfzen4pFVCQdvE1vPWFlC7KgvPWBpFCgVolXdG1LmR7xfHJ4UB/DECtSx5O0GlVDphJHmzO1hanag7irI3vJMxcvu37UE9KQcz53O1n4hC6yuLvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGnBwTGU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGnBwTGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756500317; x=1788036317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+OtvSXkgCd2PzNqtbowyIFDXdHtLAyH7dWkpsHvQd4=;
  b=kGnBwTGUGVBPQiF/jvsvERjoh/B+zee1C+9HnNFr+/uBsIg0ICTKOEy9
   AtXLSz79HjChWVe/mtd1g3HGfiFoCUSNY3JNEcTXJoTG/bGuMzTjI64WF
   tOFg7osN2dIY+atnhLtLtW91BnEljMzM60fUtqPYaOmHYiEOJ+yCi2hN1
   GwIK7nKWi1Z6BAT6TWYa2ayAR6VOCNVE+pZ3b0xNPZaJBtvxfQZR3pOgH
   GWRD7eFNvbEXCg3VC45HevtMRj1NPStHxP5rqtuuQksSddjK/1gwURNx4
   qI8HEFTlbuX5gER4Qstl58p8bxb8kw/4TvYHfY4A1vagnyV6KU0odC6N5
   A==;
X-CSE-ConnectionGUID: o9Qe00GiQ1aW+OOCPkGksQ==
X-CSE-MsgGUID: GIqwralyRjGh0fOONmT42g==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69502334"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="69502334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 13:45:16 -0700
X-CSE-ConnectionGUID: 20YNEdYjTdK3qS8zfkVy9g==
X-CSE-MsgGUID: VrA8AmhXSdyJo8sOmcNQyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="207617939"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Aug 2025 13:45:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us5yC-000Uxf-1P;
	Fri, 29 Aug 2025 20:45:12 +0000
Date: Sat, 30 Aug 2025 04:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-perf-core-ANBZ23411 0/26]
 drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:545:5: error: no previous
 prototype for 'ps3_pci_init'
Message-ID: <202508300418.9BENPRUu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-perf-core-ANBZ23411
head:   ca90878d49ef2c923d72947e387bfafc2c6d1b89
commit: b94b04b8f028da64ee7ab3215f07ca548cb261dd [0/26] anolis: scsi: support linkdata HBA/RAID controllers
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250830/202508300418.9BENPRUu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508300418.9BENPRUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508300418.9BENPRUu-lkp@intel.com/

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
