Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2381EF0B0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 20:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756759162; cv=none; b=kY+iB4TVsKjejzzsZvv8iEkr845/pDIGVVMVm2Bt5Mdi2fqgmXo2+9Jf6RLYiVlJ1yodVQ1I99Ud61Wji3cBvCfA+W+rzIU7+w7Uv3Ugy1yA82tmloxhyiXda/QLFXkHA3MmpSY1d4YRJqB0PTFIAEFhY6KhA34vNnzraxL4OQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756759162; c=relaxed/simple;
	bh=hA9f+dDbOwdTtsQqk4sWtgvyAnK8HlrHXnDkR+sHD9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=my2L8cyUYQ3mexQ0lo5cykghgxiTHtSBx3GVZzhMg41AXOAEJL3E5Ofis05d+mrMuqzd4nIGzuXigEbfw8b+NYK20geO8PgGdSSNQWtQzoaweT65cH509IYVCZbNTvEwEYjGQB2dP3AkfYi3AUls6hyJR6Mrka8zdSBFiKZagk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrHwsi7N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrHwsi7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756759160; x=1788295160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hA9f+dDbOwdTtsQqk4sWtgvyAnK8HlrHXnDkR+sHD9M=;
  b=HrHwsi7N/ObYIAxuPUhgHhOX2llsGkkC2QlK96YNY4ZmcL7Ws/aEVyp3
   NVr2t3YNde/byuKtyAFyqDHj/f6HhjvK0w/8DQpRaOFiuo+P4snpomVta
   tRQt4Gd7y8VAgYPi0IvA1Xhp5KTmwmgy2VF1HAcCPmsZR2Gt2LAmhWBOq
   3oTkzjjTi1bxEW5ra53pluRGmTZ2cJIcQkaVK09NSGBVc3sF+d5XyMkB1
   sCssXDQwAHhigziTjVwYgLa+zE29zGVQXratQ4/YcSxwF3a4DhROe563s
   g1mjnEXJe1yuWKqN/ctH9EhDWpqUT8M7bB58BTMBsXOJvLECmFG58mewG
   w==;
X-CSE-ConnectionGUID: hW5QLDS4Tci5TO4tREVo9g==
X-CSE-MsgGUID: pRc7DEDaQRiBot7+wez4Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70451540"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="70451540"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 13:39:19 -0700
X-CSE-ConnectionGUID: gn7bLG79S4uq+1BpiYJgdQ==
X-CSE-MsgGUID: 8Taifq2ySdiYplBwbA6scw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="176354455"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Sep 2025 13:39:17 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utBIM-00011X-2w;
	Mon, 01 Sep 2025 20:38:44 +0000
Date: Tue, 2 Sep 2025 04:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3190/3190]
 drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:546:5: error: no previous
 prototype for function 'ps3_pci_init'
Message-ID: <202509020441.cS6vg9iy-lkp@intel.com>
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

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   88cb8fef33633f5a6ca50f92d0df88916dda3cc3
commit: 13f748eddc9dfdec8a18922ed601e1906dcb183a [3190/3190] [PATCH] SCSI: Linkdata: Supports Linkdata HBA/RAID Controllers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250902/202509020441.cS6vg9iy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020441.cS6vg9iy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020441.cS6vg9iy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/linkdata/ps3stor/ps3_ioc_manager.c:308:5: error: no previous prototype for function 'ps3_hard_reset_to_ready' [-Werror,-Wmissing-prototypes]
     308 | int ps3_hard_reset_to_ready(struct ps3_instance *instance)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_ioc_manager.c:308:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     308 | int ps3_hard_reset_to_ready(struct ps3_instance *instance)
         | ^
         | static 
   1 error generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:877:6: error: no previous prototype for function 'ps3_set_task_manager_busy' [-Werror,-Wmissing-prototypes]
     877 | void ps3_set_task_manager_busy(struct ps3_instance *instance,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:877:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     877 | void ps3_set_task_manager_busy(struct ps3_instance *instance,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:1111:5: error: no previous prototype for function 'ps3_wait_for_outstanding_complete' [-Werror,-Wmissing-prototypes]
    1111 | int ps3_wait_for_outstanding_complete(struct ps3_instance *instance)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:1111:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1111 | int ps3_wait_for_outstanding_complete(struct ps3_instance *instance)
         | ^
         | static 
   2 errors generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:132:6: error: no previous prototype for function 'ps3_trigger_irq_poll' [-Werror,-Wmissing-prototypes]
     132 | void ps3_trigger_irq_poll(struct ps3_irq *irq)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:132:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     132 | void ps3_trigger_irq_poll(struct ps3_irq *irq)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:244:5: error: no previous prototype for function 'ps3_resp_status_convert' [-Werror,-Wmissing-prototypes]
     244 | int ps3_resp_status_convert(unsigned int resp_status)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:244:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     244 | int ps3_resp_status_convert(unsigned int resp_status)
         | ^
         | static 
   2 errors generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:212:1: error: no previous prototype for function 'ps3_qos_cmd_waitq_get' [-Werror,-Wmissing-prototypes]
     212 | ps3_qos_cmd_waitq_get(struct ps3_qos_tg_context *qos_tg_ctx,
         | ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     211 | struct qos_wait_queue *
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:336:15: error: no previous prototype for function 'ps3_qos_vd_cmdword_get' [-Werror,-Wmissing-prototypes]
     336 | unsigned char ps3_qos_vd_cmdword_get(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:336:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     336 | unsigned char ps3_qos_vd_cmdword_get(struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:352:15: error: no previous prototype for function 'ps3_qos_exclusive_cmdword_get' [-Werror,-Wmissing-prototypes]
     352 | unsigned char ps3_qos_exclusive_cmdword_get(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:352:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     352 | unsigned char ps3_qos_exclusive_cmdword_get(struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:364:15: error: no previous prototype for function 'ps3_qos_tg_decision' [-Werror,-Wmissing-prototypes]
     364 | unsigned char ps3_qos_tg_decision(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:364:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     364 | unsigned char ps3_qos_tg_decision(struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:750:15: error: no previous prototype for function 'ps3_qos_all_pd_rc_get' [-Werror,-Wmissing-prototypes]
     750 | unsigned char ps3_qos_all_pd_rc_get(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:750:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     750 | unsigned char ps3_qos_all_pd_rc_get(struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:877:6: error: no previous prototype for function 'ps3_pd_quota_waitq_clear_all' [-Werror,-Wmissing-prototypes]
     877 | void ps3_pd_quota_waitq_clear_all(struct ps3_qos_pd_mgr *qos_pd_mgr,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:877:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     877 | void ps3_pd_quota_waitq_clear_all(struct ps3_qos_pd_mgr *qos_pd_mgr,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:893:6: error: no previous prototype for function 'ps3_pd_quota_waitq_clean' [-Werror,-Wmissing-prototypes]
     893 | void ps3_pd_quota_waitq_clean(struct ps3_qos_pd_mgr *qos_pd_mgr,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:893:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     893 | void ps3_pd_quota_waitq_clean(struct ps3_qos_pd_mgr *qos_pd_mgr,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:1059:6: error: no previous prototype for function 'ps3_qos_pd_waitq_ratio_update' [-Werror,-Wmissing-prototypes]
    1059 | void ps3_qos_pd_waitq_ratio_update(struct ps3_qos_pd_mgr *qos_pd_mgr)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:1059:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1059 | void ps3_qos_pd_waitq_ratio_update(struct ps3_qos_pd_mgr *qos_pd_mgr)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2020:15: error: no previous prototype for function 'ps3_hba_qos_decision' [-Werror,-Wmissing-prototypes]
    2020 | unsigned char ps3_hba_qos_decision(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2020:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2020 | unsigned char ps3_hba_qos_decision(struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2041:6: error: no previous prototype for function 'ps3_hba_qos_waitq_notify' [-Werror,-Wmissing-prototypes]
    2041 | void ps3_hba_qos_waitq_notify(struct ps3_instance *instance)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2041:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2041 | void ps3_hba_qos_waitq_notify(struct ps3_instance *instance)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2101:6: error: no previous prototype for function 'ps3_cmd_waitq_abort' [-Werror,-Wmissing-prototypes]
    2101 | bool ps3_cmd_waitq_abort(struct ps3_cmd *aborted_cmd)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2101 | bool ps3_cmd_waitq_abort(struct ps3_cmd *aborted_cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2464:6: error: no previous prototype for function 'ps3_hba_qos_waitq_clear_all' [-Werror,-Wmissing-prototypes]
    2464 | void ps3_hba_qos_waitq_clear_all(struct ps3_instance *instance, int resp_status)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2464:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2464 | void ps3_hba_qos_waitq_clear_all(struct ps3_instance *instance, int resp_status)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2828:6: error: no previous prototype for function 'ps3_hba_qos_vd_init' [-Werror,-Wmissing-prototypes]
    2828 | void ps3_hba_qos_vd_init(struct ps3_instance *instance,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2828:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2828 | void ps3_hba_qos_vd_init(struct ps3_instance *instance,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2937:6: error: no previous prototype for function 'ps3_hba_qos_vd_reset' [-Werror,-Wmissing-prototypes]
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
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.c:86:6: error: no previous prototype for function 'ps3_cmd_stat_content_clear' [-Werror,-Wmissing-prototypes]
      86 | void ps3_cmd_stat_content_clear(struct ps3_instance *instance)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.c:86:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      86 | void ps3_cmd_stat_content_clear(struct ps3_instance *instance)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.c:404:6: error: no previous prototype for function 'ps3_io_recv_ok_stat_inc' [-Werror,-Wmissing-prototypes]
     404 | void ps3_io_recv_ok_stat_inc(struct ps3_instance *ins,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.c:404:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     404 | void ps3_io_recv_ok_stat_inc(struct ps3_instance *ins,
         | ^
         | static 
   2 errors generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_ioctl.c:786:6: error: no previous prototype for function 'ps3_clean_mgr_cmd' [-Werror,-Wmissing-prototypes]
     786 | void ps3_clean_mgr_cmd(struct ps3_instance *instance)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_ioctl.c:786:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     786 | void ps3_clean_mgr_cmd(struct ps3_instance *instance)
         | ^
         | static 
   1 error generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:579:5: error: no previous prototype for function 'ps3_r1x_hash_bit_check' [-Werror,-Wmissing-prototypes]
     579 | int ps3_r1x_hash_bit_check(struct ps3_r1x_hash_bit_mgr *hash_mgr,
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:579:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     579 | int ps3_r1x_hash_bit_check(struct ps3_r1x_hash_bit_mgr *hash_mgr,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:679:6: error: no previous prototype for function 'ps3_r1x_conflict_queue_hash_bit_lock' [-Werror,-Wmissing-prototypes]
     679 | void ps3_r1x_conflict_queue_hash_bit_lock(struct ps3_r1x_lock_mgr *mgr,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:679:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     679 | void ps3_r1x_conflict_queue_hash_bit_lock(struct ps3_r1x_lock_mgr *mgr,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:731:5: error: no previous prototype for function 'ps3_r1x_hash_bit_lock' [-Werror,-Wmissing-prototypes]
     731 | int ps3_r1x_hash_bit_lock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:731:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     731 | int ps3_r1x_hash_bit_lock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:989:6: error: no previous prototype for function 'ps3_r1x_hash_bit_unlock' [-Werror,-Wmissing-prototypes]
     989 | void ps3_r1x_hash_bit_unlock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     989 | void ps3_r1x_hash_bit_unlock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1174:5: error: no previous prototype for function 'ps3_range_check_and_insert' [-Werror,-Wmissing-prototypes]
    1174 | int ps3_range_check_and_insert(struct ps3_range_tree_root *range_root,
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1174:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1174 | int ps3_range_check_and_insert(struct ps3_range_tree_root *range_root,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1232:5: error: no previous prototype for function 'ps3_r1x_hash_range_lock' [-Werror,-Wmissing-prototypes]
    1232 | int ps3_r1x_hash_range_lock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1232:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1232 | int ps3_r1x_hash_range_lock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1313:6: error: no previous prototype for function 'ps3_r1x_hash_range_unlock' [-Werror,-Wmissing-prototypes]
    1313 | void ps3_r1x_hash_range_unlock(struct ps3_r1x_lock_mgr *mgr,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1313:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1313 | void ps3_r1x_hash_range_unlock(struct ps3_r1x_lock_mgr *mgr,
         | ^
         | static 
   7 errors generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_debug.c:884:5: error: no previous prototype for function 'ps3_dump_dir_length' [-Werror,-Wmissing-prototypes]
     884 | int ps3_dump_dir_length(const char *buf, size_t count)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_debug.c:884:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     884 | int ps3_dump_dir_length(const char *buf, size_t count)
         | ^
         | static 
   1 error generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_module_para.c:610:14: error: no previous prototype for function 'ps3_cli_ver_query' [-Werror,-Wmissing-prototypes]
     610 | unsigned int ps3_cli_ver_query(void)
         |              ^
   drivers/scsi/linkdata/ps3stor/ps3_module_para.c:610:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     610 | unsigned int ps3_cli_ver_query(void)
         | ^
         | static 
   1 error generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_rb_tree.c:155:6: error: no previous prototype for function 'rbtDelNodeDo' [-Werror,-Wmissing-prototypes]
     155 | void rbtDelNodeDo(struct Ps3RbRoot *pRoot, struct Ps3RbNode *pNode)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_rb_tree.c:155:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     155 | void rbtDelNodeDo(struct Ps3RbRoot *pRoot, struct Ps3RbNode *pNode)
         | ^
         | static 
   1 error generated.
..


vim +/ps3_pci_init +546 drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c

   545	
 > 546	int ps3_pci_init(struct pci_dev *pdev, struct ps3_instance *instance)
   547	{
   548		resource_size_t base_addr = 0;
   549		int ret = PS3_SUCCESS;
   550	
   551		ret = pci_enable_device_mem(pdev);
   552		if (ret != PS3_SUCCESS) {
   553			LOG_ERROR("hno:%u pci id[%u] pci enable failed\n",
   554				  PS3_HOST(instance), pdev->dev.id);
   555			goto l_pci_enable_device_mem_failed;
   556		}
   557	
   558		pci_set_master(pdev);
   559	
   560		instance->reg_bar = PS3_REGISTER_BAR_INDEX;
   561		ret = (pci_resource_flags(pdev, instance->reg_bar) & IORESOURCE_MEM);
   562		if (!ret) {
   563			LOG_ERROR("hno:%u Bar %lu isnot IORESOURCE_MEM\n",
   564				  PS3_HOST(instance), instance->reg_bar);
   565			goto l_bar_check_failed;
   566		}
   567		ret = pci_request_selected_regions(pdev, 1 << instance->reg_bar,
   568						   "PS3 pci regions");
   569		if (ret != PS3_SUCCESS) {
   570			LOG_ERROR("hno:%u IO memory region busy\n", PS3_HOST(instance));
   571			goto l_pci_request_selected_regions_failed;
   572		}
   573	#if defined(PS3_SUPPORT_PCIE_REPORT)
   574		pci_enable_pcie_error_reporting(pdev);
   575	#endif
   576		if (instance->ioc_adpter->reg_set) {
   577			instance->reg_set =
   578				(struct Ps3Fifo __iomem *)instance->ioc_adpter->reg_set(
   579					pdev, instance->reg_bar);
   580		} else {
   581			instance->reg_set = (struct Ps3Fifo __iomem *)ioremap(
   582				pci_resource_start(pdev, instance->reg_bar),
   583				PS3_REGISTER_SET_SIZE);
   584		}
   585		if (instance->reg_set == NULL) {
   586			LOG_ERROR("hno:%u ioremap failed\n", PS3_HOST(instance));
   587			goto l_ioremap_failed;
   588		} else {
   589			pci_set_drvdata(pdev, instance);
   590		}
   591	
   592		ps3_atomic_set(&instance->watchdog_reg_read_fail_count, 0);
   593		LOG_INFO(
   594			"reg_bar_idx = %lu, bar_base_paddr = 0x%llx, reg_set_vaddr = 0x%p\n",
   595			instance->reg_bar, (unsigned long long)base_addr, instance->reg_set);
   596	
   597		return PS3_SUCCESS;
   598	l_ioremap_failed:
   599		pci_release_selected_regions(instance->pdev, 1 << instance->reg_bar);
   600	#if defined(PS3_SUPPORT_PCIE_REPORT)
   601		pci_disable_pcie_error_reporting(pdev);
   602	#endif
   603	l_pci_request_selected_regions_failed:
   604		pci_disable_device(instance->pdev);
   605	l_bar_check_failed:
   606	l_pci_enable_device_mem_failed:
   607		return -PS3_FAILED;
   608	}
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
