Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92910253F09
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290298; cv=none; b=Cu7Apnkk+Y3RoSF2s2d03DxX4DN78fBtGmJJZia4Db9/U5IDqnJ3sLFEOrHOgl6d5g4H5u/t4QDFqIx2YPF61e7L3dh+otr6DiBKydi8XogOIv6S/ny4oGfw44uYFCQM9wVYnbZdnfFOnqrITsArPvna88PLqgPp2drk8ja0ECI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290298; c=relaxed/simple;
	bh=hWXKWsPL01HaeR4pnKlUaDtgIgyT6xKDvl6zsCvzuDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LJV+qlDZFFgUS6rkX2OMj86gx0Z6vf/vUbHiA7sWNCSU2zGIuEuNm3uazrdxKvbigIkWtLDp/plqXWG8IngJPpuIyWrDLV50HPwwfwJA3v9+BoF9PqNCREzGJPbLTz4E7fAGSSyTpivso1NAGyG1zFqHPZLEE5Jor9PDQDC8J/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQutdlxH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQutdlxH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739290295; x=1770826295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hWXKWsPL01HaeR4pnKlUaDtgIgyT6xKDvl6zsCvzuDc=;
  b=aQutdlxHpe3ZKerN6yoL0+VJMrBNZIGUnnEYMcrIc7tchhXmUTyV+0M1
   HrMHh2JGS4S+0cyyEn9k1OCUCr8N0h+e5rt2uAllYQBuSoh/lFxW8DvPw
   FBT2FTYNwmCmvBgGP0u2KcDgguEHOy5NaF6JOSe26Ox7R2FBMNbJMC1sK
   nToSJ3WwIfJ2jAN/0zLu96Lyhf8ARj3lPajl1UZKbjtQ22gFiVXhitESG
   bH9eBlFkLOUNEqTln5/6HM1LKGB/8ycBs0CmthktYTFTcIgDha16X5FMP
   zgUu3iWb9et2eHF9pmFMzqN7ViyCjkaNzFrDPNBzqzYhkaIcaclSiKxap
   g==;
X-CSE-ConnectionGUID: wctG/JgVQ2GZcaNbpVyVmQ==
X-CSE-MsgGUID: wsBr83KRQuulKqvhB/u/PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50551768"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="50551768"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:11:32 -0800
X-CSE-ConnectionGUID: yXKCD7gCQvqYmqEqhZxzJQ==
X-CSE-MsgGUID: DLiTZRJpTTmsvcBN6Z4ajg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="143409985"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2025 08:11:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thsrA-0014Pf-1i;
	Tue, 11 Feb 2025 16:11:28 +0000
Date: Wed, 12 Feb 2025 00:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2737/2737]
 drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:546:5: error: no previous
 prototype for function 'ps3_pci_init'
Message-ID: <202502120036.R9HchEMG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   83b361e2942e85c04f931c63e78bc54215a2db25
commit: 13f748eddc9dfdec8a18922ed601e1906dcb183a [2737/2737] [PATCH] SCSI: Linkdata: Supports Linkdata HBA/RAID Controllers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250212/202502120036.R9HchEMG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120036.R9HchEMG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120036.R9HchEMG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/linkdata/ps3stor/ps3_ioc_manager.c:6:
   In file included from include/linux/pci.h:1499:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:417:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_manager.c:308:5: error: no previous prototype for function 'ps3_hard_reset_to_ready' [-Werror,-Wmissing-prototypes]
     308 | int ps3_hard_reset_to_ready(struct ps3_instance *instance)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_ioc_manager.c:308:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     308 | int ps3_hard_reset_to_ready(struct ps3_instance *instance)
         | ^
         | static 
   6 errors generated.
--
   In file included from drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:6:
   In file included from include/linux/pci.h:1499:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:417:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
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
   7 errors generated.
--
   In file included from drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:15:
   In file included from drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.h:7:
   In file included from drivers/scsi/linkdata/ps3stor/ps3_irq.h:9:
   In file included from include/scsi/scsi_host.h:12:
   In file included from include/linux/blk-mq.h:6:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/genhd.h:20:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/bvec.h:14:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:417:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
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
   7 errors generated.
--
   In file included from drivers/scsi/linkdata/ps3stor/ps3_qos.c:8:
   In file included from include/scsi/scsi_host.h:12:
   In file included from include/linux/blk-mq.h:6:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/genhd.h:20:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/bvec.h:14:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:417:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
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
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.c:7:
   In file included from drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.h:8:
   In file included from include/scsi/scsi_cmnd.h:6:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:417:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
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
   7 errors generated.
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
