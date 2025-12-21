Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F3F46B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 03:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766287258; cv=none; b=mOoJGwQ6hQa6FxIEPplMuqIVm8Hix+xWgzTwKbBXoJOpsRUPQoHpJYUqdhEZZtyRbjSpsNmnYeL8qDgT7hoYEbjpeYD5YuYG5Dyio83AWma+Dt4ryYG9LHskGF4DGs11K9luypZcYfc1InLcICcUA0wk4h+U9VYOFIgy1vYEdeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766287258; c=relaxed/simple;
	bh=hp1Zvf6yzmeGs9mIELPZ459DBHYfJmhw4WIgX+M5HgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUZ4EYu/WqBlMyYUNWQ1f8bJ80hpYVU1+98ww8B/Aw3SYUdZR1cJgUaYQL5Jrwlak4yFC4pfLgVu9YxF/1FMKfjvQqEft3cde1ap5mZ0yW81GIv8izQuHawO4dHcHDJX//N3mJ+Nlpz5aPI2vSYEZ2fvb2nPCNWnYP8WXB11A7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/gzNAbm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/gzNAbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766287256; x=1797823256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hp1Zvf6yzmeGs9mIELPZ459DBHYfJmhw4WIgX+M5HgY=;
  b=D/gzNAbm+wEuFHsB3k5ekzEf6SL2G6qp1Hw5NMznWAdWdGmLikytVlmp
   Zaq7h0lgXdvYj+o1ATsaFoiwchWG1KNdMNqZ8OjSMeHR59xCI46gKsOJ+
   x752lKLBkTPBz3MJRU9MqOfGxjZHvQqD3bTNCu6aECaurMVtvomSaOMHk
   9IVI0906RSWOmZueOG1Pudm3+sW1Eqb9E8ctSGO0gciPdWw9nh1PnvPv0
   bQ6EeNGK2/o4gS/nM/taQngS7O1RsiSSh+Vg0l/bcKPxp9uC/9B6D/JqK
   PwzIE3nCrhgOHontqC7euTsGLPd9Ps9Wg2SvWrZGpPECQw1IXEpUMXFmv
   w==;
X-CSE-ConnectionGUID: XosRQgjFSD2WKlubIbK9Hw==
X-CSE-MsgGUID: v2aZnATFR62rk0FbAeLU1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78511689"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78511689"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 19:20:56 -0800
X-CSE-ConnectionGUID: 4wSwpS+6TxqUJ3QvMSK2Pw==
X-CSE-MsgGUID: qSSpQx4JQd2DzPE3raZ/cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198356555"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Dec 2025 19:20:54 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXA04-000000005ID-1bbr;
	Sun, 21 Dec 2025 03:20:52 +0000
Date: Sun, 21 Dec 2025 11:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3563/3563]
 drivers/scsi/linkdata/ps3stor/ps3_qos.c:3023:6: error: no previous prototype
 for function 'ps3_hba_qos_waitq_poll'
Message-ID: <202512211148.JPQqoPy8-lkp@intel.com>
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
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 663a9a1c191fd26f1d8cb44edb6e0e50dd0536b2 [3563/3563] !14287 [OLK-6.6] SCSI: Support Linkdata HBA/RAID Controllers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251221/202512211148.JPQqoPy8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211148.JPQqoPy8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211148.JPQqoPy8-lkp@intel.com/

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

97a2bb6ece556f liujie_answer 2024-12-24  2935  
97a2bb6ece556f liujie_answer 2024-12-24 @2936  void ps3_hba_qos_vd_reset(struct ps3_instance *instance, unsigned short disk_id)
97a2bb6ece556f liujie_answer 2024-12-24  2937  {
97a2bb6ece556f liujie_answer 2024-12-24  2938  	struct ps3_qos_vd_mgr *qos_vd_mgr = NULL;
97a2bb6ece556f liujie_answer 2024-12-24  2939  
97a2bb6ece556f liujie_answer 2024-12-24  2940  	qos_vd_mgr = ps3_qos_vd_mgr_get_by_id(instance, disk_id);
97a2bb6ece556f liujie_answer 2024-12-24  2941  	qos_vd_mgr->valid = PS3_FALSE;
97a2bb6ece556f liujie_answer 2024-12-24  2942  }
97a2bb6ece556f liujie_answer 2024-12-24  2943  
97a2bb6ece556f liujie_answer 2024-12-24  2944  void ps3_qos_vd_reset(struct ps3_instance *instance, unsigned short disk_id)
97a2bb6ece556f liujie_answer 2024-12-24  2945  {
97a2bb6ece556f liujie_answer 2024-12-24  2946  	if (!PS3_QOS_INITED(instance))
97a2bb6ece556f liujie_answer 2024-12-24  2947  		return;
97a2bb6ece556f liujie_answer 2024-12-24  2948  
97a2bb6ece556f liujie_answer 2024-12-24  2949  	if (instance->qos_context.opts.qos_vd_reset)
97a2bb6ece556f liujie_answer 2024-12-24  2950  		instance->qos_context.opts.qos_vd_reset(instance, disk_id);
97a2bb6ece556f liujie_answer 2024-12-24  2951  }
97a2bb6ece556f liujie_answer 2024-12-24  2952  
97a2bb6ece556f liujie_answer 2024-12-24  2953  static void ps3_qos_pd_notify_timeout(struct ps3_instance *instance)
97a2bb6ece556f liujie_answer 2024-12-24  2954  {
97a2bb6ece556f liujie_answer 2024-12-24  2955  	struct ps3_qos_pd_context *qos_pd_ctx = NULL;
97a2bb6ece556f liujie_answer 2024-12-24  2956  	unsigned short i = 0;
97a2bb6ece556f liujie_answer 2024-12-24  2957  	struct ps3_qos_pd_mgr *qos_pd_mgr = NULL;
97a2bb6ece556f liujie_answer 2024-12-24  2958  	unsigned long timeout_jiffies = 0;
97a2bb6ece556f liujie_answer 2024-12-24  2959  
97a2bb6ece556f liujie_answer 2024-12-24  2960  	qos_pd_ctx = &instance->qos_context.pd_ctx;
97a2bb6ece556f liujie_answer 2024-12-24  2961  	for (i = 1; i <= instance->qos_context.max_pd_count; i++) {
97a2bb6ece556f liujie_answer 2024-12-24  2962  		qos_pd_mgr = ps3_qos_pd_mgr_get(instance, i);
97a2bb6ece556f liujie_answer 2024-12-24  2963  		timeout_jiffies = qos_pd_mgr->last_sched_jiffies +
97a2bb6ece556f liujie_answer 2024-12-24  2964  				  PS3_QOS_WAITQ_TIMEOUT * HZ;
97a2bb6ece556f liujie_answer 2024-12-24  2965  		if (time_after(jiffies, timeout_jiffies)) {
97a2bb6ece556f liujie_answer 2024-12-24  2966  			if (ps3_qos_single_pd_notify(qos_pd_ctx, qos_pd_mgr)) {
97a2bb6ece556f liujie_answer 2024-12-24  2967  				LOG_INFO(
97a2bb6ece556f liujie_answer 2024-12-24  2968  					"awake qos pd quota waitq by poll. host_no:%u vid:%u pid:%u\n",
97a2bb6ece556f liujie_answer 2024-12-24  2969  					PS3_HOST(instance), qos_pd_mgr->vd_id,
97a2bb6ece556f liujie_answer 2024-12-24  2970  					qos_pd_mgr->disk_id);
97a2bb6ece556f liujie_answer 2024-12-24  2971  			}
97a2bb6ece556f liujie_answer 2024-12-24  2972  		}
97a2bb6ece556f liujie_answer 2024-12-24  2973  	}
97a2bb6ece556f liujie_answer 2024-12-24  2974  }
97a2bb6ece556f liujie_answer 2024-12-24  2975  
97a2bb6ece556f liujie_answer 2024-12-24  2976  static unsigned char ps3_qos_vd_notify_timeout(struct ps3_instance *instance)
97a2bb6ece556f liujie_answer 2024-12-24  2977  {
97a2bb6ece556f liujie_answer 2024-12-24  2978  	struct ps3_qos_vd_context *qos_vd_ctx = NULL;
97a2bb6ece556f liujie_answer 2024-12-24  2979  	unsigned short i = 0;
97a2bb6ece556f liujie_answer 2024-12-24  2980  	struct ps3_qos_vd_mgr *qos_vd_mgr = NULL;
97a2bb6ece556f liujie_answer 2024-12-24  2981  	unsigned long timeout_jiffies = 0;
97a2bb6ece556f liujie_answer 2024-12-24  2982  	unsigned char notified = PS3_FALSE;
97a2bb6ece556f liujie_answer 2024-12-24  2983  
97a2bb6ece556f liujie_answer 2024-12-24  2984  	for (i = 1; i <= instance->qos_context.max_vd_count; i++) {
97a2bb6ece556f liujie_answer 2024-12-24  2985  		qos_vd_ctx = &instance->qos_context.vd_ctx;
97a2bb6ece556f liujie_answer 2024-12-24  2986  		qos_vd_mgr = &qos_vd_ctx->qos_vd_mgrs[i];
97a2bb6ece556f liujie_answer 2024-12-24  2987  		timeout_jiffies = qos_vd_mgr->last_sched_jiffies +
97a2bb6ece556f liujie_answer 2024-12-24  2988  				  PS3_QOS_WAITQ_TIMEOUT * HZ;
97a2bb6ece556f liujie_answer 2024-12-24  2989  		if (time_after(jiffies, timeout_jiffies)) {
97a2bb6ece556f liujie_answer 2024-12-24  2990  			if (ps3_qos_single_vd_notify(qos_vd_ctx, qos_vd_mgr)) {
97a2bb6ece556f liujie_answer 2024-12-24  2991  				notified = PS3_TRUE;
97a2bb6ece556f liujie_answer 2024-12-24  2992  				LOG_INFO(
97a2bb6ece556f liujie_answer 2024-12-24  2993  					"awake qos vd quota waitq by poll. host_no:%u vid:%u\n",
97a2bb6ece556f liujie_answer 2024-12-24  2994  					PS3_HOST(instance), qos_vd_mgr->id);
97a2bb6ece556f liujie_answer 2024-12-24  2995  			}
97a2bb6ece556f liujie_answer 2024-12-24  2996  		}
97a2bb6ece556f liujie_answer 2024-12-24  2997  	}
97a2bb6ece556f liujie_answer 2024-12-24  2998  
97a2bb6ece556f liujie_answer 2024-12-24  2999  	return notified;
97a2bb6ece556f liujie_answer 2024-12-24  3000  }
97a2bb6ece556f liujie_answer 2024-12-24  3001  
97a2bb6ece556f liujie_answer 2024-12-24  3002  static unsigned char ps3_qos_tg_notify_timeout(struct ps3_instance *instance)
97a2bb6ece556f liujie_answer 2024-12-24  3003  {
97a2bb6ece556f liujie_answer 2024-12-24  3004  	struct ps3_qos_tg_context *qos_tg_ctx = NULL;
97a2bb6ece556f liujie_answer 2024-12-24  3005  	unsigned char notified = PS3_FALSE;
97a2bb6ece556f liujie_answer 2024-12-24  3006  	unsigned long timeout_jiffies = 0;
97a2bb6ece556f liujie_answer 2024-12-24  3007  
97a2bb6ece556f liujie_answer 2024-12-24  3008  	qos_tg_ctx = &instance->qos_context.tg_ctx;
97a2bb6ece556f liujie_answer 2024-12-24  3009  	timeout_jiffies =
97a2bb6ece556f liujie_answer 2024-12-24  3010  		qos_tg_ctx->last_sched_jiffies + PS3_QOS_WAITQ_TIMEOUT * HZ;
97a2bb6ece556f liujie_answer 2024-12-24  3011  	if (qos_tg_ctx->total_wait_cmd_cnt &&
97a2bb6ece556f liujie_answer 2024-12-24  3012  	    ps3_qos_tag_rsc_available(instance) &&
97a2bb6ece556f liujie_answer 2024-12-24  3013  	    time_after(jiffies, timeout_jiffies)) {
97a2bb6ece556f liujie_answer 2024-12-24  3014  		queue_work(qos_tg_ctx->work_queue, &qos_tg_ctx->resend_work);
97a2bb6ece556f liujie_answer 2024-12-24  3015  		notified = PS3_TRUE;
97a2bb6ece556f liujie_answer 2024-12-24  3016  		LOG_INFO("awake qos cmd waitq by poll. host_no:%u\n",
97a2bb6ece556f liujie_answer 2024-12-24  3017  			 PS3_HOST(instance));
97a2bb6ece556f liujie_answer 2024-12-24  3018  	}
97a2bb6ece556f liujie_answer 2024-12-24  3019  
97a2bb6ece556f liujie_answer 2024-12-24  3020  	return notified;
97a2bb6ece556f liujie_answer 2024-12-24  3021  }
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
