Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E422737F6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 06:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758523979; cv=none; b=owPyfLufMP/NCTk5YrHZ3wjXgzPTsOA/OJY2gH4pp06HvYEfwCzH1D70dwdN9sb9YiNufvyoSTSPBhionLDvyerYCSqleFtFt5wPRD70paftvP/UGl8Vs1Hv/MwPmVBl9dHwGX0IyXxQhC4PHZxOo92Udr+ZyrZuwGmPQrwXuWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758523979; c=relaxed/simple;
	bh=i4jRY7N4AgDOWf5jUmyNZsLibeVd6gPE7+cpspGftZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kKKtFjScF6XLAmmpw+dhUN9AaOl5CY0Zkj+mX/nnYB/kRD/QLr1fRJZH+JpS1SRGq2DYpxPqGo1hCq6cJmwUsW4McDO0GPkvellSx3j9dYYsitinFS2kuHoGhDGrE2bybGLGoyeoG9nGW55Xecr8GrqVEZEy9467uIkP+XQ1Ncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MF7/6sR9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MF7/6sR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758523976; x=1790059976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i4jRY7N4AgDOWf5jUmyNZsLibeVd6gPE7+cpspGftZI=;
  b=MF7/6sR9fKwlEES77vpg/iNEC2yxfH8TJVV6TeAg7Cjgm3AcWVQqthNy
   MWfr4UQPgWBX8O3Qd7jkXTd5TGtc9fRPF7CTOvjk4SPaSNYZ8XhER5ayc
   QPnschqJ1V65Q6Xp0ZpRRlR3r5SyZNhfkV1xNT7YEBO4Ud81BeH7fMHKX
   46Oj6PUlgo7zc5hiPrfo5hdQSCHa8AiMw3w7lfziSzQEdrHG/H+2Z+Oqk
   6pT771GoCDJJ1UjTN4N+27B+qoEhoYstwvlaruZmXtDltJ9cIH1LAy00+
   UCuaH4664ieU/hRDUfgDt8eyBO/TFsj1cO4fdCdbHItW5fezNFa+xz4BM
   w==;
X-CSE-ConnectionGUID: +KZDNz+XTlSGwaAtrVrSng==
X-CSE-MsgGUID: qqucMwqkT1aLE1K6ydSacw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="86216933"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="86216933"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 23:52:53 -0700
X-CSE-ConnectionGUID: QllVW/U8QR68p6ZnzDkFmw==
X-CSE-MsgGUID: hpTUOS+xRVChe38NqhcuWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="181653692"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Sep 2025 23:52:51 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0aPp-0001NV-0Y;
	Mon, 22 Sep 2025 06:52:49 +0000
Date: Mon, 22 Sep 2025 14:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2908/2908]
 drivers/scsi/linkdata/ps3stor/./linux/ps3_base.c:545:5: error: no previous
 prototype for function 'ps3_pci_init'
Message-ID: <202509221458.t8DTxxgv-lkp@intel.com>
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

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1f1c00e79b5b7cd4202a28c0fcd645c3c92c0df5
commit: 97a2bb6ece556f3882263ee8df2b77f10c511311 [2908/2908] SCSI: Linkdata: Supports Linkdata HBA/RAID Controllers
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250922/202509221458.t8DTxxgv-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221458.t8DTxxgv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221458.t8DTxxgv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/linkdata/ps3stor/ps3_ioc_manager.c:5:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_manager.c:307:5: error: no previous prototype for function 'ps3_hard_reset_to_ready' [-Werror,-Wmissing-prototypes]
     307 | int ps3_hard_reset_to_ready(struct ps3_instance *instance)
         |     ^
   drivers/scsi/linkdata/ps3stor/ps3_ioc_manager.c:307:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     307 | int ps3_hard_reset_to_ready(struct ps3_instance *instance)
         | ^
         | static 
   6 errors generated.
--
   In file included from drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c:5:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   7 errors generated.
--
   In file included from drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.c:14:
   In file included from drivers/scsi/linkdata/ps3stor/ps3_cmd_complete.h:6:
   In file included from drivers/scsi/linkdata/ps3stor/ps3_irq.h:8:
   In file included from include/scsi/scsi_host.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   7 errors generated.
--
   In file included from drivers/scsi/linkdata/ps3stor/ps3_qos.c:7:
   In file included from include/scsi/scsi_host.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.c:6:
   In file included from drivers/scsi/linkdata/ps3stor/ps3_cmd_statistics.h:7:
   In file included from include/scsi/scsi_cmnd.h:5:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   7 errors generated.
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
