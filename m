Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7A331CA6D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757607653; cv=none; b=GBCFPY63yxFOjrGx1b/mpLJwTr66Pl4c7n5nKEvreYgQIq5kSF0ecoC2kjWXWrDMuSI3UHcL0rDiCC1jrSlda3VK6jOlkH+sxC4j+ehcfKPkasCC51q7GyBo1RAZUP5VwP3TmH4LD3TgldQ8PEQcv8bt10iWWlUcGFrr+maNI2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757607653; c=relaxed/simple;
	bh=mhI0D2j9qN/f/o+B2I9lQFj88jLy77Gq84gT2n7y/Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QB0GX2HnTEuH4YyhLxIMVHNX1yAkcW+dFPGD9NHIpE3H/ne13lx2DwC+JERYihwQVtem8DywQP2OdU+Ooif82JU0m5MeBo7PTkN0iwrJ7qWNx0z8sniK0QZreuW13FCSi5EZRikjoCr6LbE7ucsXsaO85xHWKiAl1lwWLyvQ5GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jz5ND+Bp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jz5ND+Bp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757607651; x=1789143651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mhI0D2j9qN/f/o+B2I9lQFj88jLy77Gq84gT2n7y/Oo=;
  b=Jz5ND+Bp4+ODVAZI9TFzinNkSbPFIo3xLpqbxlI7vCpcuSejQxPo0lnq
   KYKPMVnxGGhmzX46SEEitJJa9VxSobGvwuA54J9JL+GJnWcayWlFtm79k
   MjtW5U7YVACQUS5k4+4X8zsAPmXBinX0/dGC6O6TSmq89dtxQnrE6dlwP
   U+G8nJaqFbzVaYEf+O+/+fcTgRJqM/CpKGsvQfcO0uyoh27qYp8wXdJFz
   yUG6EvsLD+/JzElYZWd50Tb9uwChFxPhrQ51+GvWmkj66jqYQfbie3/B9
   kIEf/PUEv/sgdSZM2I4qqE+r9PKpVvom+OlSOh0WyN6kHStl/8xcqrmk8
   Q==;
X-CSE-ConnectionGUID: rwQgWSC+TtyBMmVizaw4IA==
X-CSE-MsgGUID: sZzlaakBTKCjNt3GG18Owg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77556552"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="77556552"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 09:20:50 -0700
X-CSE-ConnectionGUID: lgSTezH4Tomv0B65DP78Tg==
X-CSE-MsgGUID: 28coGwbgSoWjU9hqhBfkCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="210874776"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Sep 2025 09:20:49 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwk2H-0000Sm-3D;
	Thu, 11 Sep 2025 16:20:40 +0000
Date: Fri, 12 Sep 2025 00:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 25/25]
 drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:545:5: error: no previous
 prototype for function 'ps3_pci_init'
Message-ID: <202509120037.HOYTe4eV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   0193230e41d70964b0609604b94747f5241c85f4
commit: 4e26f605716a88a00d0e51dfd7da55198b13d759 [25/25] anolis: scsi: support linkdata HBA/RAID controllers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250912/202509120037.HOYTe4eV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509120037.HOYTe4eV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509120037.HOYTe4eV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/linkdata/ps3stor/ps3_ioc_manager.c:307:5: error: no previous prototype for function 'ps3_hard_reset_to_ready' [-Werror,-Wmissing-prototypes]
     307 | int ps3_hard_reset_to_ready(struct ps3_instance *instance)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_ioc_manager.c:307:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     307 | int ps3_hard_reset_to_ready(struct ps3_instance *instance)
         | ^
         | static 
   1 error generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:876:6: error: no previous prototype for function 'ps3_set_task_manager_busy' [-Werror,-Wmissing-prototypes]
     876 | void ps3_set_task_manager_busy(struct ps3_instance *instance,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:876:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     876 | void ps3_set_task_manager_busy(struct ps3_instance *instance,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:1110:5: error: no previous prototype for function 'ps3_wait_for_outstanding_complete' [-Werror,-Wmissing-prototypes]
    1110 | int ps3_wait_for_outstanding_complete(struct ps3_instance *instance)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:1110:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1110 | int ps3_wait_for_outstanding_complete(struct ps3_instance *instance)
         | ^
         | static 
   2 errors generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:131:6: error: no previous prototype for function 'ps3_trigger_irq_poll' [-Werror,-Wmissing-prototypes]
     131 | void ps3_trigger_irq_poll(struct ps3_irq *irq)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:131:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     131 | void ps3_trigger_irq_poll(struct ps3_irq *irq)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:243:5: error: no previous prototype for function 'ps3_resp_status_convert' [-Werror,-Wmissing-prototypes]
     243 | int ps3_resp_status_convert(unsigned int resp_status)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:243:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     243 | int ps3_resp_status_convert(unsigned int resp_status)
         | ^
         | static 
   2 errors generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:211:1: error: no previous prototype for function 'ps3_qos_cmd_waitq_get' [-Werror,-Wmissing-prototypes]
     211 | ps3_qos_cmd_waitq_get(struct ps3_qos_tg_context *qos_tg_ctx,
         | ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     210 | struct qos_wait_queue *
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:335:15: error: no previous prototype for function 'ps3_qos_vd_cmdword_get' [-Werror,-Wmissing-prototypes]
     335 | unsigned char ps3_qos_vd_cmdword_get(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:335:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     335 | unsigned char ps3_qos_vd_cmdword_get(struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:351:15: error: no previous prototype for function 'ps3_qos_exclusive_cmdword_get' [-Werror,-Wmissing-prototypes]
     351 | unsigned char ps3_qos_exclusive_cmdword_get(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:351:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     351 | unsigned char ps3_qos_exclusive_cmdword_get(struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:363:15: error: no previous prototype for function 'ps3_qos_tg_decision' [-Werror,-Wmissing-prototypes]
     363 | unsigned char ps3_qos_tg_decision(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:363:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     363 | unsigned char ps3_qos_tg_decision(struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:749:15: error: no previous prototype for function 'ps3_qos_all_pd_rc_get' [-Werror,-Wmissing-prototypes]
     749 | unsigned char ps3_qos_all_pd_rc_get(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:749:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     749 | unsigned char ps3_qos_all_pd_rc_get(struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:876:6: error: no previous prototype for function 'ps3_pd_quota_waitq_clear_all' [-Werror,-Wmissing-prototypes]
     876 | void ps3_pd_quota_waitq_clear_all(struct ps3_qos_pd_mgr *qos_pd_mgr,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:876:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     876 | void ps3_pd_quota_waitq_clear_all(struct ps3_qos_pd_mgr *qos_pd_mgr,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:892:6: error: no previous prototype for function 'ps3_pd_quota_waitq_clean' [-Werror,-Wmissing-prototypes]
     892 | void ps3_pd_quota_waitq_clean(struct ps3_qos_pd_mgr *qos_pd_mgr,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:892:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     892 | void ps3_pd_quota_waitq_clean(struct ps3_qos_pd_mgr *qos_pd_mgr,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:1058:6: error: no previous prototype for function 'ps3_qos_pd_waitq_ratio_update' [-Werror,-Wmissing-prototypes]
    1058 | void ps3_qos_pd_waitq_ratio_update(struct ps3_qos_pd_mgr *qos_pd_mgr)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:1058:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1058 | void ps3_qos_pd_waitq_ratio_update(struct ps3_qos_pd_mgr *qos_pd_mgr)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2019:15: error: no previous prototype for function 'ps3_hba_qos_decision' [-Werror,-Wmissing-prototypes]
    2019 | unsigned char ps3_hba_qos_decision(struct ps3_cmd *cmd)
         |               ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2019:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2019 | unsigned char ps3_hba_qos_decision(struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2040:6: error: no previous prototype for function 'ps3_hba_qos_waitq_notify' [-Werror,-Wmissing-prototypes]
    2040 | void ps3_hba_qos_waitq_notify(struct ps3_instance *instance)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2040:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2040 | void ps3_hba_qos_waitq_notify(struct ps3_instance *instance)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2100:6: error: no previous prototype for function 'ps3_cmd_waitq_abort' [-Werror,-Wmissing-prototypes]
    2100 | bool ps3_cmd_waitq_abort(struct ps3_cmd *aborted_cmd)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2100:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2100 | bool ps3_cmd_waitq_abort(struct ps3_cmd *aborted_cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2463:6: error: no previous prototype for function 'ps3_hba_qos_waitq_clear_all' [-Werror,-Wmissing-prototypes]
    2463 | void ps3_hba_qos_waitq_clear_all(struct ps3_instance *instance, int resp_status)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2463:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2463 | void ps3_hba_qos_waitq_clear_all(struct ps3_instance *instance, int resp_status)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2827:6: error: no previous prototype for function 'ps3_hba_qos_vd_init' [-Werror,-Wmissing-prototypes]
    2827 | void ps3_hba_qos_vd_init(struct ps3_instance *instance,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_qos.c:2827:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2827 | void ps3_hba_qos_vd_init(struct ps3_instance *instance,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_qos.c:2936:6: error: no previous prototype for function 'ps3_hba_qos_vd_reset' [-Werror,-Wmissing-prototypes]
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
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.c:85:6: error: no previous prototype for function 'ps3_cmd_stat_content_clear' [-Werror,-Wmissing-prototypes]
      85 | void ps3_cmd_stat_content_clear(struct ps3_instance *instance)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      85 | void ps3_cmd_stat_content_clear(struct ps3_instance *instance)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.c:403:6: error: no previous prototype for function 'ps3_io_recv_ok_stat_inc' [-Werror,-Wmissing-prototypes]
     403 | void ps3_io_recv_ok_stat_inc(struct ps3_instance *ins,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.c:403:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     403 | void ps3_io_recv_ok_stat_inc(struct ps3_instance *ins,
         | ^
         | static 
   2 errors generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_ioctl.c:785:6: error: no previous prototype for function 'ps3_clean_mgr_cmd' [-Werror,-Wmissing-prototypes]
     785 | void ps3_clean_mgr_cmd(struct ps3_instance *instance)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_ioctl.c:785:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     785 | void ps3_clean_mgr_cmd(struct ps3_instance *instance)
         | ^
         | static 
   1 error generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:578:5: error: no previous prototype for function 'ps3_r1x_hash_bit_check' [-Werror,-Wmissing-prototypes]
     578 | int ps3_r1x_hash_bit_check(struct ps3_r1x_hash_bit_mgr *hash_mgr,
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:578:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     578 | int ps3_r1x_hash_bit_check(struct ps3_r1x_hash_bit_mgr *hash_mgr,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:678:6: error: no previous prototype for function 'ps3_r1x_conflict_queue_hash_bit_lock' [-Werror,-Wmissing-prototypes]
     678 | void ps3_r1x_conflict_queue_hash_bit_lock(struct ps3_r1x_lock_mgr *mgr,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:678:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     678 | void ps3_r1x_conflict_queue_hash_bit_lock(struct ps3_r1x_lock_mgr *mgr,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:730:5: error: no previous prototype for function 'ps3_r1x_hash_bit_lock' [-Werror,-Wmissing-prototypes]
     730 | int ps3_r1x_hash_bit_lock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:730:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     730 | int ps3_r1x_hash_bit_lock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:988:6: error: no previous prototype for function 'ps3_r1x_hash_bit_unlock' [-Werror,-Wmissing-prototypes]
     988 | void ps3_r1x_hash_bit_unlock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:988:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     988 | void ps3_r1x_hash_bit_unlock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1173:5: error: no previous prototype for function 'ps3_range_check_and_insert' [-Werror,-Wmissing-prototypes]
    1173 | int ps3_range_check_and_insert(struct ps3_range_tree_root *range_root,
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1173:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1173 | int ps3_range_check_and_insert(struct ps3_range_tree_root *range_root,
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1231:5: error: no previous prototype for function 'ps3_r1x_hash_range_lock' [-Werror,-Wmissing-prototypes]
    1231 | int ps3_r1x_hash_range_lock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1231:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1231 | int ps3_r1x_hash_range_lock(struct ps3_r1x_lock_mgr *mgr, struct ps3_cmd *cmd)
         | ^
         | static 
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1312:6: error: no previous prototype for function 'ps3_r1x_hash_range_unlock' [-Werror,-Wmissing-prototypes]
    1312 | void ps3_r1x_hash_range_unlock(struct ps3_r1x_lock_mgr *mgr,
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c:1312:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1312 | void ps3_r1x_hash_range_unlock(struct ps3_r1x_lock_mgr *mgr,
         | ^
         | static 
   7 errors generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_debug.c:883:5: error: no previous prototype for function 'ps3_dump_dir_length' [-Werror,-Wmissing-prototypes]
     883 | int ps3_dump_dir_length(const char *buf, size_t count)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_debug.c:883:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     883 | int ps3_dump_dir_length(const char *buf, size_t count)
         | ^
         | static 
   1 error generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_module_para.c:609:14: error: no previous prototype for function 'ps3_cli_ver_query' [-Werror,-Wmissing-prototypes]
     609 | unsigned int ps3_cli_ver_query(void)
         |              ^
   drivers/scsi/linkdata/ps3stor/ps3_module_para.c:609:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     609 | unsigned int ps3_cli_ver_query(void)
         | ^
         | static 
   1 error generated.
--
>> drivers/scsi/linkdata/ps3stor/ps3_rb_tree.c:154:6: error: no previous prototype for function 'rbtDelNodeDo' [-Werror,-Wmissing-prototypes]
     154 | void rbtDelNodeDo(struct Ps3RbRoot *pRoot, struct Ps3RbNode *pNode)
         |      ^
   drivers/scsi/linkdata/ps3stor/ps3_rb_tree.c:154:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     154 | void rbtDelNodeDo(struct Ps3RbRoot *pRoot, struct Ps3RbNode *pNode)
         | ^
         | static 
   1 error generated.
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
