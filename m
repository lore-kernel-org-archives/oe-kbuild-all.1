Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEC433DF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 03:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754019141; cv=none; b=NmInauX9dcasrIxRte/wsH0tLNznB/iCs2EeAaA3OJ9Gs7yKd0aXMDSt2E2WLb5CEYPDjJmUEwp4Qj1w9OO9lbumSf3XZHG61KB2eCNvGx/8qqACFhrNW2w13svAdUb+0DRClKXhsplLVtMF2u+T8l470mm8NyM9n1MBfzXrgxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754019141; c=relaxed/simple;
	bh=gBKSsix3TRoMQf/hm/6AGeV/30u7BLXbhjv7txDT9Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RWhfwcG+QMl/NjLVnD/1Jl+R8GppnGMBNMmz8njG5gu8Lh9n9a7d1x+jS1mg0iKVmO6emRxMd2ZLhtkHtYVZp17hhf+1V33uDX7LH/LXADzo14qsRDq5VFfjLdHMDzGl2EQSiAXUYJ5FW/eMcH7ARQIjO0Cbx69Oz739q+JPCRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNk/eQZS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNk/eQZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754019139; x=1785555139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gBKSsix3TRoMQf/hm/6AGeV/30u7BLXbhjv7txDT9Sk=;
  b=gNk/eQZSROVCi7rtSsJ2VIUquIJ95jWeanLEM5/6TdwfG/o+nBLKY2xx
   bbJafziBdGj2h3rCoUkSKO+ui6+JKz3zCrKqsa8+grRQ4xzB0Xt7idPVS
   obENZbt9SNnblfel9BR4p1Wl0iW4nq/JOck3/MDMWyLpxUGQXk0ix4PJt
   H7Rd98y+OZ0YfMVhJDUeygrhEf2lamB8+mfSiBX43x4tsua6I8qnwXvTn
   RaJ8SsxeVj/LnVC/I37w1Zr6Qxfk1/TQbTmTQtCpjuKp6njO7vojVYt7U
   MVAIy/DQoh11MuPw2nIZEs/qQTycpY9/nZKH+r0HhrC2snhhb3/Fn6h/B
   w==;
X-CSE-ConnectionGUID: 1qbMghXGQnaIoLPH3yc1ZQ==
X-CSE-MsgGUID: JAWMhd0TTwu4pKYqPV9rgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67806145"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67806145"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 20:32:18 -0700
X-CSE-ConnectionGUID: Xbup67UQS6ysnUSVKeGVfw==
X-CSE-MsgGUID: xhXeDUQESqufhrg/cNAVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163144996"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2025 20:32:17 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhgVD-0004KQ-1A;
	Fri, 01 Aug 2025 03:32:15 +0000
Date: Fri, 1 Aug 2025 11:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2]
 drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:131:6: error: no previous
 prototype for 'ps3_trigger_irq_poll'
Message-ID: <202508011156.uCKaVYmb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   3ab761d2a7a1fc006adaf133a8a0d8a14f4c1058
commit: 4e26f605716a88a00d0e51dfd7da55198b13d759 [2/2] anolis: scsi: support linkdata HBA/RAID controllers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250801/202508011156.uCKaVYmb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011156.uCKaVYmb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011156.uCKaVYmb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:131:6: error: no previous prototype for 'ps3_trigger_irq_poll' [-Werror=missing-prototypes]
     131 | void ps3_trigger_irq_poll(struct ps3_irq *irq)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:243:5: error: no previous prototype for 'ps3_resp_status_convert' [-Werror=missing-prototypes]
     243 | int ps3_resp_status_convert(unsigned int resp_status)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:211:1: error: no previous prototype for 'ps3_qos_cmd_waitq_get' [-Werror=missing-prototypes]
     211 | ps3_qos_cmd_waitq_get(struct ps3_qos_tg_context *qos_tg_ctx,
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:335:15: error: no previous prototype for 'ps3_qos_vd_cmdword_get' [-Werror=missing-prototypes]
     335 | unsigned char ps3_qos_vd_cmdword_get(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:351:15: error: no previous prototype for 'ps3_qos_exclusive_cmdword_get' [-Werror=missing-prototypes]
     351 | unsigned char ps3_qos_exclusive_cmdword_get(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:363:15: error: no previous prototype for 'ps3_qos_tg_decision' [-Werror=missing-prototypes]
     363 | unsigned char ps3_qos_tg_decision(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:749:15: error: no previous prototype for 'ps3_qos_all_pd_rc_get' [-Werror=missing-prototypes]
     749 | unsigned char ps3_qos_all_pd_rc_get(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:876:6: error: no previous prototype for 'ps3_pd_quota_waitq_clear_all' [-Werror=missing-prototypes]
     876 | void ps3_pd_quota_waitq_clear_all(struct ps3_qos_pd_mgr *qos_pd_mgr,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:892:6: error: no previous prototype for 'ps3_pd_quota_waitq_clean' [-Werror=missing-prototypes]
     892 | void ps3_pd_quota_waitq_clean(struct ps3_qos_pd_mgr *qos_pd_mgr,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:1058:6: error: no previous prototype for 'ps3_qos_pd_waitq_ratio_update' [-Werror=missing-prototypes]
    1058 | void ps3_qos_pd_waitq_ratio_update(struct ps3_qos_pd_mgr *qos_pd_mgr)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2019:15: error: no previous prototype for 'ps3_hba_qos_decision' [-Werror=missing-prototypes]
    2019 | unsigned char ps3_hba_qos_decision(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2040:6: error: no previous prototype for 'ps3_hba_qos_waitq_notify' [-Werror=missing-prototypes]
    2040 | void ps3_hba_qos_waitq_notify(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2100:6: error: no previous prototype for 'ps3_cmd_waitq_abort' [-Werror=missing-prototypes]
    2100 | bool ps3_cmd_waitq_abort(struct ps3_cmd *aborted_cmd)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2463:6: error: no previous prototype for 'ps3_hba_qos_waitq_clear_all' [-Werror=missing-prototypes]
    2463 | void ps3_hba_qos_waitq_clear_all(struct ps3_instance *instance, int resp_status)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2827:6: error: no previous prototype for 'ps3_hba_qos_vd_init' [-Werror=missing-prototypes]
    2827 | void ps3_hba_qos_vd_init(struct ps3_instance *instance,
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2936:6: error: no previous prototype for 'ps3_hba_qos_vd_reset' [-Werror=missing-prototypes]
    2936 | void ps3_hba_qos_vd_reset(struct ps3_instance *instance, unsigned short disk_id)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3023:6: error: no previous prototype for 'ps3_hba_qos_waitq_poll' [-Werror=missing-prototypes]
    3023 | void ps3_hba_qos_waitq_poll(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3279:15: error: no previous prototype for 'ps3_raid_qos_decision' [-Werror=missing-prototypes]
    3279 | unsigned char ps3_raid_qos_decision(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3334:6: error: no previous prototype for 'ps3_qos_mgrq_resend' [-Werror=missing-prototypes]
    3334 | void ps3_qos_mgrq_resend(struct ps3_qos_softq_mgr *softq_mgr)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3478:6: error: no previous prototype for 'ps3_raid_qos_waitq_notify' [-Werror=missing-prototypes]
    3478 | void ps3_raid_qos_waitq_notify(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:3821:15: error: no previous prototype for 'ps3_raid_qos_waitq_abort' [-Werror=missing-prototypes]
    3821 | unsigned char ps3_raid_qos_waitq_abort(struct ps3_cmd *cmd)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:4022:6: error: no previous prototype for 'ps3_raid_qos_waitq_clear_all' [-Werror=missing-prototypes]
    4022 | void ps3_raid_qos_waitq_clear_all(struct ps3_instance *instance,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:4083:6: error: no previous prototype for 'ps3_raid_qos_waitq_poll' [-Werror=missing-prototypes]
    4083 | void ps3_raid_qos_waitq_poll(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c:22:27: error: 'PS3_INTERRUPT_CMD_ENABLE_MSIX' defined but not used [-Werror=unused-const-variable=]
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
   drivers/scsi/linkdata/ps3stor/ps3_recovery.c:204:6: error: no previous prototype for 'ps3_recovery_irq_queue_destroy' [-Werror=missing-prototypes]
     204 | void ps3_recovery_irq_queue_destroy(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_recovery.c:363:5: error: no previous prototype for 'ps3_recovery_state_transfer' [-Werror=missing-prototypes]
     363 | int ps3_recovery_state_transfer(struct ps3_instance *instance,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_recovery.c:2700:6: error: no previous prototype for 'ps3_hard_recovery_state_finish' [-Werror=missing-prototypes]
    2700 | void ps3_hard_recovery_state_finish(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/scsi/linkdata/ps3stor/ps3_ioc_adp.c:36:6: error: no previous prototype for 'ps3_ioc_resource_prepare_switch' [-Werror=missing-prototypes]
      36 | void ps3_ioc_resource_prepare_switch(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_adp.c:88:6: error: no previous prototype for 'ps3_ioc_resource_prepare_raid' [-Werror=missing-prototypes]
      88 | void ps3_ioc_resource_prepare_raid(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/linkdata/ps3stor/ps3_ioc_adp.c:147:6: error: no previous prototype for 'ps3_ioc_resource_prepare_hba' [-Werror=missing-prototypes]
     147 | void ps3_ioc_resource_prepare_hba(struct ps3_instance *instance)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/ps3_trigger_irq_poll +131 drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c

   121	
   122	static inline void ps3_reply_word_next(struct ps3_irq *irq,
   123					       struct PS3ReplyWord **reply_word)
   124	{
   125		if (!irq->last_reply_idx)
   126			*reply_word = ps3_reply_word_query(irq, irq->last_reply_idx);
   127		else
   128			++(*reply_word);
   129	}
   130	#ifndef _WINDOWS
 > 131	void ps3_trigger_irq_poll(struct ps3_irq *irq)
   132	{
   133		LOG_DEBUG("host_no:%u trigger irq_poll isrSN:%d\n",
   134			  PS3_HOST(irq->instance), irq->isrSN);
   135	
   136		if (irq->is_sched_irq_poll) {
   137			LOG_DEBUG("host_no:%u irq_poll_is_processing is PS3_TRUE\n",
   138				  PS3_HOST(irq->instance));
   139			goto l_out;
   140		}
   141	
   142		irq->is_sched_irq_poll = PS3_TRUE;
   143		irq->is_enable_irq = PS3_TRUE;
   144		ps3_irq_poll_sched(&irq->irqpoll);
   145	
   146	l_out:
   147		return;
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
