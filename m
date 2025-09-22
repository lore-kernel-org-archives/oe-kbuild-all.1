Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF598192B66
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758539826; cv=none; b=RvQ/U8O3AejizBGMSoPoqUK4kHMtHMkw0IYDBSKRV30cWwAD/poAzwJ6xGm9Oysx3X/lkM48JhHrM7Le2n21t0NawwpRV9XPl32pkgCoc7eL+MkZHpzIF55xWefihdoHIUHuAyb41sSqrh8H4WcOBE2FlFZ2riTQUUuBqfgXmXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758539826; c=relaxed/simple;
	bh=woEGV/6lBd0jmo2AWAsq0NY4h+VYF6+/NZ3SMm5Phwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DVHttmShSOsFpEU7aaVzQ6SdeAke7J3HdKV5bEJ0gvDCvsijierCrhTP9QfEasb7KHx7juNtsEHPSE+Kiu9ufhpetH1ZAm/Y6LfZCjRO065yz5yC20zMotZbGmmfSox7lCBSONmjlpzNfKGU8T1UdNujvpdknfHyEoB4KOmPedo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAWHu8aj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAWHu8aj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758539824; x=1790075824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=woEGV/6lBd0jmo2AWAsq0NY4h+VYF6+/NZ3SMm5Phwo=;
  b=oAWHu8ajKXoSPjGRL6RHYVpikvKMRDPztC0G5ngpjsqQu8Q4ul4mLIfn
   DnzoNUxjZo2bK/NKPYpDmOsTHvw2Fvn+bw5W43cNT7HxYmc7B7XgsiKFi
   jxHxnAoQeac+9Kv8fLQXaIqKMt1zpuoaeQDmazYFuHiCcdggWljqwHhY5
   cqIQ114KE3ORtuNVl7pOx7XAXd/XrBq1I+a2BtQqcP5S9R4t/4zroagSZ
   /VeO2pq3zOeL57vHkHmLXVWkPWMQUSOOwdZpcwjWx8RnH2sVdRES4CfzH
   UIjYAmnB+fd/mTm437VrBOWnWwycZr+ZBrRv/uG5pbGVfrX27oCvWaUSb
   A==;
X-CSE-ConnectionGUID: RwQTuNYdTHehm6E1CrWjNw==
X-CSE-MsgGUID: 03kbA7eORY+HyO8sI5rFJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="48376609"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="48376609"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 04:17:03 -0700
X-CSE-ConnectionGUID: J7bYvJBCTgKsNmFadmeucw==
X-CSE-MsgGUID: hyuXZ9jlSYqnWy6aN+uQrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="207406789"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Sep 2025 04:17:02 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0eXU-0001af-0e;
	Mon, 22 Sep 2025 11:17:00 +0000
Date: Mon, 22 Sep 2025 19:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2908/2908]
 drivers/scsi/linkdata/ps3stor/ps3_qos.c:3023:6: error: no previous prototype
 for function 'ps3_hba_qos_waitq_poll'
Message-ID: <202509221934.quy4NA6c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi openeuler-ci-bot,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1f1c00e79b5b7cd4202a28c0fcd645c3c92c0df5
commit: 663a9a1c191fd26f1d8cb44edb6e0e50dd0536b2 [2908/2908] !14287 [OLK-6.6] SCSI: Support Linkdata HBA/RAID Controllers
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250922/202509221934.quy4NA6c-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221934.quy4NA6c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221934.quy4NA6c-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/linkdata/ps3stor/ps3_qos.c:211:1: error: no previous prototype for function 'ps3_qos_cmd_waitq_get' [-Werror,-Wmissing-prototypes]
     211 | ps3_qos_cmd_waitq_get(struct ps3_qos_tg_context *qos_tg_ctx,
         | ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     210 | struct qos_wait_queue *
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:335:15: error: no previous prototype for function 'ps3_qos_vd_cmdword_get' [-Werror,-Wmissing-prototypes]
     335 | unsigned char ps3_qos_vd_cmdword_get(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:335:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     335 | unsigned char ps3_qos_vd_cmdword_get(struct ps3_cmd *cmd)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:351:15: error: no previous prototype for function 'ps3_qos_exclusive_cmdword_get' [-Werror,-Wmissing-prototypes]
     351 | unsigned char ps3_qos_exclusive_cmdword_get(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:351:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     351 | unsigned char ps3_qos_exclusive_cmdword_get(struct ps3_cmd *cmd)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:363:15: error: no previous prototype for function 'ps3_qos_tg_decision' [-Werror,-Wmissing-prototypes]
     363 | unsigned char ps3_qos_tg_decision(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:363:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     363 | unsigned char ps3_qos_tg_decision(struct ps3_cmd *cmd)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:749:15: error: no previous prototype for function 'ps3_qos_all_pd_rc_get' [-Werror,-Wmissing-prototypes]
     749 | unsigned char ps3_qos_all_pd_rc_get(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:749:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     749 | unsigned char ps3_qos_all_pd_rc_get(struct ps3_cmd *cmd)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:876:6: error: no previous prototype for function 'ps3_pd_quota_waitq_clear_all' [-Werror,-Wmissing-prototypes]
     876 | void ps3_pd_quota_waitq_clear_all(struct ps3_qos_pd_mgr *qos_pd_mgr,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:876:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     876 | void ps3_pd_quota_waitq_clear_all(struct ps3_qos_pd_mgr *qos_pd_mgr,
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:892:6: error: no previous prototype for function 'ps3_pd_quota_waitq_clean' [-Werror,-Wmissing-prototypes]
     892 | void ps3_pd_quota_waitq_clean(struct ps3_qos_pd_mgr *qos_pd_mgr,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:892:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     892 | void ps3_pd_quota_waitq_clean(struct ps3_qos_pd_mgr *qos_pd_mgr,
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:1058:6: error: no previous prototype for function 'ps3_qos_pd_waitq_ratio_update' [-Werror,-Wmissing-prototypes]
    1058 | void ps3_qos_pd_waitq_ratio_update(struct ps3_qos_pd_mgr *qos_pd_mgr)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:1058:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1058 | void ps3_qos_pd_waitq_ratio_update(struct ps3_qos_pd_mgr *qos_pd_mgr)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2019:15: error: no previous prototype for function 'ps3_hba_qos_decision' [-Werror,-Wmissing-prototypes]
    2019 | unsigned char ps3_hba_qos_decision(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2019:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2019 | unsigned char ps3_hba_qos_decision(struct ps3_cmd *cmd)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2040:6: error: no previous prototype for function 'ps3_hba_qos_waitq_notify' [-Werror,-Wmissing-prototypes]
    2040 | void ps3_hba_qos_waitq_notify(struct ps3_instance *instance)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2040:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2040 | void ps3_hba_qos_waitq_notify(struct ps3_instance *instance)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2100:6: error: no previous prototype for function 'ps3_cmd_waitq_abort' [-Werror,-Wmissing-prototypes]
    2100 | bool ps3_cmd_waitq_abort(struct ps3_cmd *aborted_cmd)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2100:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2100 | bool ps3_cmd_waitq_abort(struct ps3_cmd *aborted_cmd)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2463:6: error: no previous prototype for function 'ps3_hba_qos_waitq_clear_all' [-Werror,-Wmissing-prototypes]
    2463 | void ps3_hba_qos_waitq_clear_all(struct ps3_instance *instance, int resp_status)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2463:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2463 | void ps3_hba_qos_waitq_clear_all(struct ps3_instance *instance, int resp_status)
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2827:6: error: no previous prototype for function 'ps3_hba_qos_vd_init' [-Werror,-Wmissing-prototypes]
    2827 | void ps3_hba_qos_vd_init(struct ps3_instance *instance,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2827:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2827 | void ps3_hba_qos_vd_init(struct ps3_instance *instance,
         | ^
         | static 
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2936:6: error: no previous prototype for function 'ps3_hba_qos_vd_reset' [-Werror,-Wmissing-prototypes]
    2936 | void ps3_hba_qos_vd_reset(struct ps3_instance *instance, unsigned short disk_id)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2936:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2936 | void ps3_hba_qos_vd_reset(struct ps3_instance *instance, unsigned short disk_id)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3023:6: error: no previous prototype for function 'ps3_hba_qos_waitq_poll' [-Werror,-Wmissing-prototypes]
    3023 | void ps3_hba_qos_waitq_poll(struct ps3_instance *instance)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3023:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3023 | void ps3_hba_qos_waitq_poll(struct ps3_instance *instance)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3279:15: error: no previous prototype for function 'ps3_raid_qos_decision' [-Werror,-Wmissing-prototypes]
    3279 | unsigned char ps3_raid_qos_decision(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3279:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3279 | unsigned char ps3_raid_qos_decision(struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3334:6: error: no previous prototype for function 'ps3_qos_mgrq_resend' [-Werror,-Wmissing-prototypes]
    3334 | void ps3_qos_mgrq_resend(struct ps3_qos_softq_mgr *softq_mgr)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3334:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3334 | void ps3_qos_mgrq_resend(struct ps3_qos_softq_mgr *softq_mgr)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3478:6: error: no previous prototype for function 'ps3_raid_qos_waitq_notify' [-Werror,-Wmissing-prototypes]
    3478 | void ps3_raid_qos_waitq_notify(struct ps3_instance *instance)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3478:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3478 | void ps3_raid_qos_waitq_notify(struct ps3_instance *instance)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:3821:15: error: no previous prototype for function 'ps3_raid_qos_waitq_abort' [-Werror,-Wmissing-prototypes]
    3821 | unsigned char ps3_raid_qos_waitq_abort(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3821:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3821 | unsigned char ps3_raid_qos_waitq_abort(struct ps3_cmd *cmd)
         | ^
         | static 
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1958:1: error: unused function 'ps3_scsih_dev_id_get' [-Werror,-Wunused-function]
    1958 | ps3_scsih_dev_id_get(const struct scsi_cmnd *s_cmd)
         | ^~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:21:27: error: unused variable 'PS3_INTERRUPT_CMD_DISABLE_ALL_MASK' [-Werror,-Wunused-const-variable]
      21 | static const unsigned int PS3_INTERRUPT_CMD_DISABLE_ALL_MASK = 0x02;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:22:27: error: unused variable 'PS3_INTERRUPT_CMD_ENABLE_MSIX' [-Werror,-Wunused-const-variable]
      22 | static const unsigned int PS3_INTERRUPT_CMD_ENABLE_MSIX = 0x01;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:23:27: error: unused variable 'PS3_INTERRUPT_MASK_DISABLE' [-Werror,-Wunused-const-variable]
      23 | static const unsigned int PS3_INTERRUPT_MASK_DISABLE = 0x00000002;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:24:27: error: unused variable 'PS3_INTERRUPT_STATUS_EXIST_IRQ' [-Werror,-Wunused-const-variable]
      24 | static const unsigned int PS3_INTERRUPT_STATUS_EXIST_IRQ = 0x00000001;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:25:27: error: unused variable 'PS3_INTERRUPT_CLEAR_IRQ' [-Werror,-Wunused-const-variable]
      25 | static const unsigned int PS3_INTERRUPT_CLEAR_IRQ = 0x00000001;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:27:27: error: unused variable 'PS3_SSD_IOPS_MSIX_VECTORS' [-Werror,-Wunused-const-variable]
      27 | static const unsigned int PS3_SSD_IOPS_MSIX_VECTORS = 8;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:28:27: error: unused variable 'PS3_HDD_IOPS_MSIX_VECTORS' [-Werror,-Wunused-const-variable]
      28 | static const unsigned int PS3_HDD_IOPS_MSIX_VECTORS = 8;
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


vim +/ps3_hba_qos_waitq_poll +3023 drivers/scsi/linkdata/ps3stor/ps3_qos.c

97a2bb6ece556f liujie_answer 2024-12-24  3022  
97a2bb6ece556f liujie_answer 2024-12-24 @3023  void ps3_hba_qos_waitq_poll(struct ps3_instance *instance)
97a2bb6ece556f liujie_answer 2024-12-24  3024  {
97a2bb6ece556f liujie_answer 2024-12-24  3025  	if (!ps3_qos_tg_notify_timeout(instance)) {
97a2bb6ece556f liujie_answer 2024-12-24  3026  		if (!ps3_qos_vd_notify_timeout(instance))
97a2bb6ece556f liujie_answer 2024-12-24  3027  			ps3_qos_pd_notify_timeout(instance);
97a2bb6ece556f liujie_answer 2024-12-24  3028  	}
97a2bb6ece556f liujie_answer 2024-12-24  3029  }
97a2bb6ece556f liujie_answer 2024-12-24  3030  

:::::: The code at line 3023 was first introduced by commit
:::::: 97a2bb6ece556f3882263ee8df2b77f10c511311 SCSI: Linkdata: Supports Linkdata HBA/RAID Controllers

:::::: TO: liujie_answer <liujie5@linkdatatechnology.com>
:::::: CC: liujie_answer <liujie5@linkdatatechnology.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
