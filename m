Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E5F1EE7D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 22:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742595612; cv=none; b=CP7cqJe42mZPnIn6UQrG5PwWybhQ1NBvQFs+VAAkFDy3Jtdm8nxVHl/BiS9Rr6kEPusKTBdh2epvAm9H0QvbwITx907hzIaqmofsDLIhwzk+vUzxLyknjwd4/OTpn5hDSWVqmrltZoKGWW4ur55M37aJ5FbQFX+YhpA/QuaRuz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742595612; c=relaxed/simple;
	bh=bEsp4hctVeHHEEvEwQGinmvLgEtnos5xWY5BKrcAosc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dc1Lrj52Pt1OosW4C3ZUTreGOQFuoN+xzTG6OdCZc3/mhNHCTCUcvvKIAEg+XNx43tLOud00Xh5Y5DHQMqimxj4XXCWsjqMYEGOKWCBs0zDEHQFTcCpkX412tEq/ObfADcYcltAcReg3s4/1S3Qyu7Ynv8ltfuF5o9Oq3bPrNb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbfIQxqG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbfIQxqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742595609; x=1774131609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bEsp4hctVeHHEEvEwQGinmvLgEtnos5xWY5BKrcAosc=;
  b=dbfIQxqGjPpFvD2Ul7JB+4BWLDR1rjAAIrLZMtbaj55lzZUYdjsX9Ejt
   Z/homb17gU4N3wiweV2X0tzv9HReMXIhkFXEPI+NGv/5XpW6PfhZVK4+0
   twjaLr6/Bs16+Q352Mlbxd7nml9on4a/myNNp8zHlskEeay2qSCuNPKo/
   bmSAlRBXQDRPtBD3og1E8Pjj02sqYo8UXE0PeH7ciE3KWmTn8e/p2FBlr
   9JkAhKacH2em1ESbFkYtMO/l78/ZEirXP4ahXpBTN8rH8YnkCWGuHtUIq
   OVRom6UU6y8HBUJ9eypsdUI1kEfhhRkxcmC5uMeuAsm2Bmum3k5+dH2fh
   A==;
X-CSE-ConnectionGUID: ivDwrCdYRSKmlDviY0o77Q==
X-CSE-MsgGUID: euQ96YrFRkSPmFM7aQ0KNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="66337050"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="66337050"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 15:20:09 -0700
X-CSE-ConnectionGUID: 9qQ1hOUTS56qCzlZE/prew==
X-CSE-MsgGUID: fq7f7DaRSh+ImR8lQ2JznQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="123225552"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Mar 2025 15:20:08 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvkie-0001jE-0o;
	Fri, 21 Mar 2025 22:20:01 +0000
Date: Sat, 22 Mar 2025 06:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2816/2816]
 drivers/scsi/linkdata/ps3stor/ps3_qos.c:3024:6: error: no previous prototype
 for function 'ps3_hba_qos_waitq_poll'
Message-ID: <202503220607.nbhzXKry-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a7973281031cedabf6c66de13ffc2c313a71695f
commit: 13f748eddc9dfdec8a18922ed601e1906dcb183a [2816/2816] [PATCH] SCSI: Linkdata: Supports Linkdata HBA/RAID Controllers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250322/202503220607.nbhzXKry-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220607.nbhzXKry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220607.nbhzXKry-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/linkdata/ps3stor/ps3_qos.c:212:1: error: no previous prototype for function 'ps3_qos_cmd_waitq_get' [-Werror,-Wmissing-prototypes]
     212 | ps3_qos_cmd_waitq_get(struct ps3_qos_tg_context *qos_tg_ctx,
         | ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     211 | struct qos_wait_queue *
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:336:15: error: no previous prototype for function 'ps3_qos_vd_cmdword_get' [-Werror,-Wmissing-prototypes]
     336 | unsigned char ps3_qos_vd_cmdword_get(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:336:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     336 | unsigned char ps3_qos_vd_cmdword_get(struct ps3_cmd *cmd)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:352:15: error: no previous prototype for function 'ps3_qos_exclusive_cmdword_get' [-Werror,-Wmissing-prototypes]
     352 | unsigned char ps3_qos_exclusive_cmdword_get(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:352:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     352 | unsigned char ps3_qos_exclusive_cmdword_get(struct ps3_cmd *cmd)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:364:15: error: no previous prototype for function 'ps3_qos_tg_decision' [-Werror,-Wmissing-prototypes]
     364 | unsigned char ps3_qos_tg_decision(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:364:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     364 | unsigned char ps3_qos_tg_decision(struct ps3_cmd *cmd)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:750:15: error: no previous prototype for function 'ps3_qos_all_pd_rc_get' [-Werror,-Wmissing-prototypes]
     750 | unsigned char ps3_qos_all_pd_rc_get(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:750:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     750 | unsigned char ps3_qos_all_pd_rc_get(struct ps3_cmd *cmd)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:877:6: error: no previous prototype for function 'ps3_pd_quota_waitq_clear_all' [-Werror,-Wmissing-prototypes]
     877 | void ps3_pd_quota_waitq_clear_all(struct ps3_qos_pd_mgr *qos_pd_mgr,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:877:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     877 | void ps3_pd_quota_waitq_clear_all(struct ps3_qos_pd_mgr *qos_pd_mgr,
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:893:6: error: no previous prototype for function 'ps3_pd_quota_waitq_clean' [-Werror,-Wmissing-prototypes]
     893 | void ps3_pd_quota_waitq_clean(struct ps3_qos_pd_mgr *qos_pd_mgr,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:893:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     893 | void ps3_pd_quota_waitq_clean(struct ps3_qos_pd_mgr *qos_pd_mgr,
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:1059:6: error: no previous prototype for function 'ps3_qos_pd_waitq_ratio_update' [-Werror,-Wmissing-prototypes]
    1059 | void ps3_qos_pd_waitq_ratio_update(struct ps3_qos_pd_mgr *qos_pd_mgr)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:1059:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1059 | void ps3_qos_pd_waitq_ratio_update(struct ps3_qos_pd_mgr *qos_pd_mgr)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2020:15: error: no previous prototype for function 'ps3_hba_qos_decision' [-Werror,-Wmissing-prototypes]
    2020 | unsigned char ps3_hba_qos_decision(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2020:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2020 | unsigned char ps3_hba_qos_decision(struct ps3_cmd *cmd)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2041:6: error: no previous prototype for function 'ps3_hba_qos_waitq_notify' [-Werror,-Wmissing-prototypes]
    2041 | void ps3_hba_qos_waitq_notify(struct ps3_instance *instance)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2041:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2041 | void ps3_hba_qos_waitq_notify(struct ps3_instance *instance)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2101:6: error: no previous prototype for function 'ps3_cmd_waitq_abort' [-Werror,-Wmissing-prototypes]
    2101 | bool ps3_cmd_waitq_abort(struct ps3_cmd *aborted_cmd)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2101 | bool ps3_cmd_waitq_abort(struct ps3_cmd *aborted_cmd)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2464:6: error: no previous prototype for function 'ps3_hba_qos_waitq_clear_all' [-Werror,-Wmissing-prototypes]
    2464 | void ps3_hba_qos_waitq_clear_all(struct ps3_instance *instance, int resp_status)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2464:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2464 | void ps3_hba_qos_waitq_clear_all(struct ps3_instance *instance, int resp_status)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2828:6: error: no previous prototype for function 'ps3_hba_qos_vd_init' [-Werror,-Wmissing-prototypes]
    2828 | void ps3_hba_qos_vd_init(struct ps3_instance *instance,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2828:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2828 | void ps3_hba_qos_vd_init(struct ps3_instance *instance,
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2937:6: error: no previous prototype for function 'ps3_hba_qos_vd_reset' [-Werror,-Wmissing-prototypes]
    2937 | void ps3_hba_qos_vd_reset(struct ps3_instance *instance, unsigned short disk_id)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2937:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2937 | void ps3_hba_qos_vd_reset(struct ps3_instance *instance, unsigned short disk_id)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3024:6: error: no previous prototype for function 'ps3_hba_qos_waitq_poll' [-Werror,-Wmissing-prototypes]
    3024 | void ps3_hba_qos_waitq_poll(struct ps3_instance *instance)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3024:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3024 | void ps3_hba_qos_waitq_poll(struct ps3_instance *instance)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3280:15: error: no previous prototype for function 'ps3_raid_qos_decision' [-Werror,-Wmissing-prototypes]
    3280 | unsigned char ps3_raid_qos_decision(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3280:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3280 | unsigned char ps3_raid_qos_decision(struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3335:6: error: no previous prototype for function 'ps3_qos_mgrq_resend' [-Werror,-Wmissing-prototypes]
    3335 | void ps3_qos_mgrq_resend(struct ps3_qos_softq_mgr *softq_mgr)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3335:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3335 | void ps3_qos_mgrq_resend(struct ps3_qos_softq_mgr *softq_mgr)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3479:6: error: no previous prototype for function 'ps3_raid_qos_waitq_notify' [-Werror,-Wmissing-prototypes]
    3479 | void ps3_raid_qos_waitq_notify(struct ps3_instance *instance)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3479:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3479 | void ps3_raid_qos_waitq_notify(struct ps3_instance *instance)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3822:15: error: no previous prototype for function 'ps3_raid_qos_waitq_abort' [-Werror,-Wmissing-prototypes]
    3822 | unsigned char ps3_raid_qos_waitq_abort(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3822:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3822 | unsigned char ps3_raid_qos_waitq_abort(struct ps3_cmd *cmd)
         | ^
         | static 
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1959:1: error: unused function 'ps3_scsih_dev_id_get' [-Werror,-Wunused-function]
    1959 | ps3_scsih_dev_id_get(const struct scsi_cmnd *s_cmd)
         | ^~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:22:27: error: unused variable 'PS3_INTERRUPT_CMD_DISABLE_ALL_MASK' [-Werror,-Wunused-const-variable]
      22 | static const unsigned int PS3_INTERRUPT_CMD_DISABLE_ALL_MASK = 0x02;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:23:27: error: unused variable 'PS3_INTERRUPT_CMD_ENABLE_MSIX' [-Werror,-Wunused-const-variable]
      23 | static const unsigned int PS3_INTERRUPT_CMD_ENABLE_MSIX = 0x01;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:24:27: error: unused variable 'PS3_INTERRUPT_MASK_DISABLE' [-Werror,-Wunused-const-variable]
      24 | static const unsigned int PS3_INTERRUPT_MASK_DISABLE = 0x00000002;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:25:27: error: unused variable 'PS3_INTERRUPT_STATUS_EXIST_IRQ' [-Werror,-Wunused-const-variable]
      25 | static const unsigned int PS3_INTERRUPT_STATUS_EXIST_IRQ = 0x00000001;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:26:27: error: unused variable 'PS3_INTERRUPT_CLEAR_IRQ' [-Werror,-Wunused-const-variable]
      26 | static const unsigned int PS3_INTERRUPT_CLEAR_IRQ = 0x00000001;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:28:27: error: unused variable 'PS3_SSD_IOPS_MSIX_VECTORS' [-Werror,-Wunused-const-variable]
      28 | static const unsigned int PS3_SSD_IOPS_MSIX_VECTORS = 8;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:29:27: error: unused variable 'PS3_HDD_IOPS_MSIX_VECTORS' [-Werror,-Wunused-const-variable]
      29 | static const unsigned int PS3_HDD_IOPS_MSIX_VECTORS = 8;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   7 errors generated.
--
>> drivers/scsi/linkdata/ps3stor/./linux/ps3_driver_log.c:41:19: error: unused function 'time_for_log' [-Werror,-Wunused-function]
      41 | static inline int time_for_log(char *buff, int buf_len)
         |                   ^~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/./linux/ps3_driver_log.c:65:19: error: unused function 'time_for_file_name' [-Werror,-Wunused-function]
      65 | static inline int time_for_file_name(char *buff, int buf_len)
         |                   ^~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/ps3_hba_qos_waitq_poll +3024 drivers/scsi/linkdata/ps3stor/ps3_qos.c

  3023	
> 3024	void ps3_hba_qos_waitq_poll(struct ps3_instance *instance)
  3025	{
  3026		if (!ps3_qos_tg_notify_timeout(instance)) {
  3027			if (!ps3_qos_vd_notify_timeout(instance))
  3028				ps3_qos_pd_notify_timeout(instance);
  3029		}
  3030	}
  3031	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
