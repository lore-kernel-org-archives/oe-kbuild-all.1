Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC10215F42
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 00:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763080171; cv=none; b=Ucc5qvU5OEEKvNKEUl8YaL2h4k4hES5Lcfi390GmAwX8TOwrV+7HygpGAHuEa7MsfGBat8PeZpIrCaVIwukN1byy9EaskpLmhYNRwQAO+hv9d3bbUnGdIufRn28RZoQXD0ioKDXrwE+MCxRjwO4/E4Adkgc/KnvoCNk4HqL4Al8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763080171; c=relaxed/simple;
	bh=pR64Yg33KGPWjf1+r1Dj5VV1dSmpv10KFqBWgYnznp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pp2sxLBLw9WhXMu8F5iW3UPIJYG2oDxJAdDt0Dy/7lHTeQoZ1tNfmmpkiEsydZIyX/dzQLT5fzNDtqKnRjHRITSr9PPrmi1S0+wX+W8A33Hi0JM5iB9C+tNpJoEll54r5MUIOGjP/rqUEcM6hDTP8YTscSghPA33p+ok6tD0yTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQMfg058; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQMfg058"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763080169; x=1794616169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pR64Yg33KGPWjf1+r1Dj5VV1dSmpv10KFqBWgYnznp0=;
  b=BQMfg0587rrvWmxf/MEywf7OdKL0uiUkKscmKDQ25oTDiz2VyMtG+PJ5
   W6XiNkzpfXssrEf5LonG9myF/jYAG4IKwdBNaMaeHmlWhIEuZsNRoscF4
   sUyMl5BZqq4f/EF0la/69WOEGdq4/mAJCTMN+H+yd9KiQCvNi9H89wWcz
   L3ad2F1JQZvNpYxemQ+xEvpU7XHJVsR8mMugPTFeM9VOzPTM59cX+yrDK
   jUEkFwQbsooybBo2GGHGfcfR1TsyTAQlhHkvV8TXvDa4h/L9CcCvh6Cui
   VQCNhNqTMV47z2einzrU1ly8uXgYQHxj77WbEsyDKHFHM54Hr9EA1hFt+
   A==;
X-CSE-ConnectionGUID: nYLukJe4SmqYKaTqeXOMqw==
X-CSE-MsgGUID: WGVgGxLQQuCEyv6i8CAcOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="67774338"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="67774338"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 16:29:27 -0800
X-CSE-ConnectionGUID: 0ZncsH84Q16C2j66+NonZw==
X-CSE-MsgGUID: rHLLRCvbTPie0joaQbuOHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="190064799"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 16:29:26 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJhgq-00061B-05;
	Fri, 14 Nov 2025 00:29:24 +0000
Date: Fri, 14 Nov 2025 08:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-numa-sched-domain-ANBZ26672 3/3]
 drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:945:6: error: no previous
 prototype for 'ps3_pci_init_complete_exit'
Message-ID: <202511140832.iIsvAWlq-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-numa-sched-domain-ANBZ26672
head:   bf45c63d740e8e294a0a11035769798525015c5c
commit: b94b04b8f028da64ee7ab3215f07ca548cb261dd [3/3] anolis: scsi: support linkdata HBA/RAID controllers
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251114/202511140832.iIsvAWlq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140832.iIsvAWlq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140832.iIsvAWlq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:876:6: error: no previous prototype for 'ps3_set_task_manager_busy' [-Werror=missing-prototypes]
     876 | void ps3_set_task_manager_busy(struct ps3_instance *instance,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:1110:5: error: no previous prototype for 'ps3_wait_for_outstanding_complete' [-Werror=missing-prototypes]
    1110 | int ps3_wait_for_outstanding_complete(struct ps3_instance *instance)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:131:6: error: no previous prototype for 'ps3_trigger_irq_poll' [-Werror=missing-prototypes]
     131 | void ps3_trigger_irq_poll(struct ps3_irq *irq)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:243:5: error: no previous prototype for 'ps3_resp_status_convert' [-Werror=missing-prototypes]
     243 | int ps3_resp_status_convert(unsigned int resp_status)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/scsi/linkdata/ps3stor/ps3_device_manager.c:1581:5: error: no previous prototype for 'ps3_scsi_private_init_pd' [-Werror=missing-prototypes]
    1581 | int ps3_scsi_private_init_pd(struct scsi_device *sdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_device_manager.c:1663:5: error: no previous prototype for 'ps3_scsi_private_init_vd' [-Werror=missing-prototypes]
    1663 | int ps3_scsi_private_init_vd(struct scsi_device *sdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/scsi/linkdata/ps3stor/ps3_irq.c:28:27: error: 'PS3_HDD_IOPS_MSIX_VECTORS' defined but not used [-Werror=unused-const-variable=]
      28 | static const unsigned int PS3_HDD_IOPS_MSIX_VECTORS = 8;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_irq.c:27:27: error: 'PS3_SSD_IOPS_MSIX_VECTORS' defined but not used [-Werror=unused-const-variable=]
      27 | static const unsigned int PS3_SSD_IOPS_MSIX_VECTORS = 8;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_irq.c:25:27: error: 'PS3_INTERRUPT_CLEAR_IRQ' defined but not used [-Werror=unused-const-variable=]
      25 | static const unsigned int PS3_INTERRUPT_CLEAR_IRQ = 0x00000001;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_irq.c:24:27: error: 'PS3_INTERRUPT_STATUS_EXIST_IRQ' defined but not used [-Werror=unused-const-variable=]
      24 | static const unsigned int PS3_INTERRUPT_STATUS_EXIST_IRQ = 0x00000001;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_irq.c:23:27: error: 'PS3_INTERRUPT_MASK_DISABLE' defined but not used [-Werror=unused-const-variable=]
      23 | static const unsigned int PS3_INTERRUPT_MASK_DISABLE = 0x00000002;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_irq.c:22:27: error: 'PS3_INTERRUPT_CMD_ENABLE_MSIX' defined but not used [-Werror=unused-const-variable=]
      22 | static const unsigned int PS3_INTERRUPT_CMD_ENABLE_MSIX = 0x01;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:21:27: error: 'PS3_INTERRUPT_CMD_DISABLE_ALL_MASK' defined but not used [-Werror=unused-const-variable=]
      21 | static const unsigned int PS3_INTERRUPT_CMD_DISABLE_ALL_MASK = 0x02;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/scsi/linkdata/ps3stor/ps3_recovery.c:72:30: error: no previous prototype for 'ps3_recovery_context_alloc' [-Werror=missing-prototypes]
      72 | struct ps3_recovery_context *ps3_recovery_context_alloc(void)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_recovery.c:82:6: error: no previous prototype for 'ps3_recovery_context_free' [-Werror=missing-prototypes]
      82 | void ps3_recovery_context_free(struct ps3_recovery_context *context)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_recovery.c:88:6: error: no previous prototype for 'ps3_recovery_context_delete' [-Werror=missing-prototypes]
      88 | void ps3_recovery_context_delete(struct ps3_recovery_context *context)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_recovery.c:204:6: error: no previous prototype for 'ps3_recovery_irq_queue_destroy' [-Werror=missing-prototypes]
     204 | void ps3_recovery_irq_queue_destroy(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_recovery.c:363:5: error: no previous prototype for 'ps3_recovery_state_transfer' [-Werror=missing-prototypes]
     363 | int ps3_recovery_state_transfer(struct ps3_instance *instance,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_recovery.c:2700:6: error: no previous prototype for 'ps3_hard_recovery_state_finish' [-Werror=missing-prototypes]
    2700 | void ps3_hard_recovery_state_finish(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_device_manager_sas.c:1632:5: error: no previous prototype for 'ps3_sas_expander_phys_refresh' [-Werror=missing-prototypes]
    1632 | int ps3_sas_expander_phys_refresh(struct ps3_instance *instance,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_adp.c:36:6: error: no previous prototype for 'ps3_ioc_resource_prepare_switch' [-Werror=missing-prototypes]
      36 | void ps3_ioc_resource_prepare_switch(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_adp.c:88:6: error: no previous prototype for 'ps3_ioc_resource_prepare_raid' [-Werror=missing-prototypes]
      88 | void ps3_ioc_resource_prepare_raid(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_adp.c:147:6: error: no previous prototype for 'ps3_ioc_resource_prepare_hba' [-Werror=missing-prototypes]
     147 | void ps3_ioc_resource_prepare_hba(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/scsi/linkdata/ps3stor/ps3_sas_transport.c:407:5: error: no previous prototype for 'ps3_sas_update_phy_info' [-Werror=missing-prototypes]
     407 | int ps3_sas_update_phy_info(struct sas_phy *phy)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:545:5: error: no previous prototype for 'ps3_pci_init' [-Werror=missing-prototypes]
     545 | int ps3_pci_init(struct pci_dev *pdev, struct ps3_instance *instance)
         |     ^~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:899:5: error: no previous prototype for 'ps3_pci_init_complete' [-Werror=missing-prototypes]
     899 | int ps3_pci_init_complete(struct ps3_instance *instance)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:945:6: error: no previous prototype for 'ps3_pci_init_complete_exit' [-Werror=missing-prototypes]
     945 | void ps3_pci_init_complete_exit(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
..


vim +/ps3_pci_init_complete_exit +945 drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c

   944	
 > 945	void ps3_pci_init_complete_exit(struct ps3_instance *instance)
   946	{
   947		ps3_irqs_exit(instance);
   948	
   949		instance->is_pci_reset = PS3_TRUE;
   950		mb(); /* in order to force CPU ordering */
   951		if (ps3_wait_reg_access_done(instance) != PS3_SUCCESS) {
   952			LOG_ERROR("hno:%u wait reg access done NOK\n",
   953				  PS3_HOST(instance));
   954			return;
   955		}
   956	
   957		ps3_pci_exit(instance);
   958	
   959		if (!ps3_pci_err_recovery_get(instance) &&
   960		    !instance->state_machine.is_suspend) {
   961			pci_set_drvdata(instance->pdev, NULL);
   962		}
   963	
   964		ps3_irq_context_exit(instance);
   965	}
   966	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
