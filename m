Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB5B13E40F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733994638; cv=none; b=WRsWUvEZtE8Lu9Ui9/pKgwgqfn3WFL+cFD6nhLZ8A1VwGea8PGT82/tgdIkiJumq3j7YmPdNJJH7uyco8URRkxuVNunUwOYqqv9RiXoLIDsfP/Q1ug+gOhMft5VvFYTj6pwzUinFgI8rer0grw6Hegff5yd0tgKmDiodCSLekTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733994638; c=relaxed/simple;
	bh=+Hos2Jfy1qVEwqzgmqZ/X2n1HUPwOSZ76Mjg94F07GI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qCesxWuoB6jOSdADQI2CnXVSL8Wk8UgVbM2sMDVXIIN21LTthmTidNgDi/TbaTnmy9asKWQHRneI6aYhmiM6JU52mPTIo92SCK7ovcB5sT7h9VH19Om/NFNUJGqXeGSRt9igp5vnMMjVMADfa8zqxwT6aGVT4JvIQLd+NZtL53I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9a+751O; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9a+751O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733994636; x=1765530636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Hos2Jfy1qVEwqzgmqZ/X2n1HUPwOSZ76Mjg94F07GI=;
  b=A9a+751OV3hFN5hT0swE53+/TjbOPn5S3atdBoDazcsoWPMPQub2msda
   8scJQkLo/vnr+ai3l1F5sth0vrkCuVPD5TveY8u4M30sZddRH3VvsbBuF
   9lKtWZRUmfZQMeU5MqpTsGHsoirqne7pjFtdSmGxQ3t2WJqiy89WFEV2a
   xiLSrWbzVnzepE7bHGABEGW114Nd/SEyKfMHadcGWolXw5KD6bheMe4p9
   koNzrtaHCwWb+Z2OO8hWAX3mZZJYdSBoOe8y6p4MQX1ZVoBpLunrhWPjT
   NEfXq7sNWO331ZAwZ71/KjQKryBVVqgQPwDRHvD/KU7OZ9BzStCHA1PfZ
   g==;
X-CSE-ConnectionGUID: EGkM3g1KQZS1UPe8Zv0suw==
X-CSE-MsgGUID: bqgC/6SKQ/qY/hQxvZxikA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34645885"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34645885"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 01:10:35 -0800
X-CSE-ConnectionGUID: uVClNpInRVKL3kiqEWcmbg==
X-CSE-MsgGUID: BKsyuPLhRbOb3jBeAJlsFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101127340"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Dec 2024 01:10:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLfDK-0007dx-35;
	Thu, 12 Dec 2024 09:10:30 +0000
Date: Thu, 12 Dec 2024 17:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Steven Song <steven.song@3snic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2566/2566]
 drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:545:5: warning: no
 previous prototype for function 'sss_adm_msg_write'
Message-ID: <202412121710.BepF5y8C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c17394e022a5504b2d967d70de4c226de003e990
commit: 0c4c3ee2e4947ad6ec346dc37fa133f4fecafd76 [2566/2566] Net: ethernet: Support management channel of the host tool in 3snic 3s9xx network driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241212/202412121710.BepF5y8C-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121710.BepF5y8C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121710.BepF5y8C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:11:
   In file included from include/linux/pci.h:1499:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:17:
   In file included from drivers/net/ethernet/3snic/sssnic/include/sss_kernel.h:7:
   In file included from drivers/net/ethernet/3snic/sssnic/include/kernel/sss_linux_kernel.h:140:
   include/net/devlink.h:28:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      28 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:29:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      29 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:545:5: warning: no previous prototype for function 'sss_adm_msg_write' [-Wmissing-prototypes]
     545 | int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:545:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     545 | int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:551:5: warning: no previous prototype for function 'sss_adm_msg_read' [-Wmissing-prototypes]
     551 | int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:551:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     551 | int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:597:5: warning: no previous prototype for function 'sss_adm_msg_read_ack' [-Wmissing-prototypes]
     597 | int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:597:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     597 | int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:618:5: warning: no previous prototype for function 'sss_adm_msg_write_nack' [-Wmissing-prototypes]
     618 | int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:618:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     618 | int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:682:5: warning: no previous prototype for function 'sss_sync_send_adm_msg' [-Wmissing-prototypes]
     682 | int sss_sync_send_adm_msg(void *hwdev, u8 mod, u16 cmd, void *buf_in,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:682:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     682 | int sss_sync_send_adm_msg(void *hwdev, u8 mod, u16 cmd, void *buf_in,
         | ^
         | static 
   12 warnings generated.
--
   In file included from drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:11:
   In file included from include/linux/pci.h:1499:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:17:
   In file included from drivers/net/ethernet/3snic/sssnic/include/sss_kernel.h:7:
   In file included from drivers/net/ethernet/3snic/sssnic/include/kernel/sss_linux_kernel.h:140:
   include/net/devlink.h:28:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      28 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:29:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      29 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:580:6: warning: no previous prototype for function 'sss_destroy_adm_msg' [-Wmissing-prototypes]
     580 | void sss_destroy_adm_msg(struct sss_adm_msg *adm_msg)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     580 | void sss_destroy_adm_msg(struct sss_adm_msg *adm_msg)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:689:5: warning: no previous prototype for function 'sss_hwif_init_adm' [-Wmissing-prototypes]
     689 | int sss_hwif_init_adm(struct sss_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:689:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     689 | int sss_hwif_init_adm(struct sss_hwdev *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:738:6: warning: no previous prototype for function 'sss_hwif_deinit_adm' [-Wmissing-prototypes]
     738 | void sss_hwif_deinit_adm(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:738:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     738 | void sss_hwif_deinit_adm(struct sss_hwdev *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:752:6: warning: no previous prototype for function 'sss_complete_adm_event' [-Wmissing-prototypes]
     752 | void sss_complete_adm_event(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm_init.c:752:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     752 | void sss_complete_adm_event(struct sss_hwdev *hwdev)
         | ^
         | static 
   11 warnings generated.
--
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:93:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:14:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:9:
   In file included from drivers/net/ethernet/3snic/sssnic/include/sss_kernel.h:7:
   In file included from drivers/net/ethernet/3snic/sssnic/include/kernel/sss_linux_kernel.h:140:
   include/net/devlink.h:28:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      28 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:29:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      29 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:15:5: warning: no previous prototype for function 'sss_alloc_db_addr' [-Wmissing-prototypes]
      15 | int sss_alloc_db_addr(void *hwdev, void __iomem **db_base)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:15:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      15 | int sss_alloc_db_addr(void *hwdev, void __iomem **db_base)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:37:6: warning: no previous prototype for function 'sss_free_db_addr' [-Wmissing-prototypes]
      37 | void sss_free_db_addr(void *hwdev, const void __iomem *db_base)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | void sss_free_db_addr(void *hwdev, const void __iomem *db_base)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:52:6: warning: no previous prototype for function 'sss_chip_set_msix_auto_mask' [-Wmissing-prototypes]
      52 | void sss_chip_set_msix_auto_mask(void *hwdev, u16 msix_id,
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:52:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      52 | void sss_chip_set_msix_auto_mask(void *hwdev, u16 msix_id,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:70:6: warning: no previous prototype for function 'sss_chip_set_msix_state' [-Wmissing-prototypes]
      70 | void sss_chip_set_msix_state(void *hwdev, u16 msix_id,
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:70:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      70 | void sss_chip_set_msix_state(void *hwdev, u16 msix_id,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:86:5: warning: no previous prototype for function 'sss_get_global_func_id' [-Wmissing-prototypes]
      86 | u16 sss_get_global_func_id(void *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:86:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      86 | u16 sss_get_global_func_id(void *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:95:4: warning: no previous prototype for function 'sss_get_pf_id_of_vf' [-Wmissing-prototypes]
      95 | u8 sss_get_pf_id_of_vf(void *hwdev)
         |    ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | u8 sss_get_pf_id_of_vf(void *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:104:4: warning: no previous prototype for function 'sss_get_pcie_itf_id' [-Wmissing-prototypes]
     104 | u8 sss_get_pcie_itf_id(void *hwdev)
         |    ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     104 | u8 sss_get_pcie_itf_id(void *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:113:20: warning: no previous prototype for function 'sss_get_func_type' [-Wmissing-prototypes]
     113 | enum sss_func_type sss_get_func_type(void *hwdev)
         |                    ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     113 | enum sss_func_type sss_get_func_type(void *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:122:20: warning: no previous prototype for function 'sss_get_func_id' [-Wmissing-prototypes]
     122 | enum sss_func_type sss_get_func_id(void *hwdev)
         |                    ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     122 | enum sss_func_type sss_get_func_id(void *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:131:5: warning: no previous prototype for function 'sss_get_glb_pf_vf_offset' [-Wmissing-prototypes]
     131 | u16 sss_get_glb_pf_vf_offset(void *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:131:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     131 | u16 sss_get_glb_pf_vf_offset(void *hwdev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:140:4: warning: no previous prototype for function 'sss_get_ppf_id' [-Wmissing-prototypes]
     140 | u8 sss_get_ppf_id(void *hwdev)
         |    ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_export.c:140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     140 | u8 sss_get_ppf_id(void *hwdev)
         | ^
         | static 
   18 warnings generated.
--
   In file included from drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:6:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:37:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:14:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:14:
   In file included from drivers/net/ethernet/3snic/sssnic/include/kernel/sss_linux_kernel.h:140:
   include/net/devlink.h:28:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      28 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:29:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      29 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:80:6: warning: no previous prototype for function 'sss_tool_free_in_buf' [-Wmissing-prototypes]
      80 | void sss_tool_free_in_buf(void *hwdev, const struct sss_tool_msg *tool_msg, void *in_buf)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | void sss_tool_free_in_buf(void *hwdev, const struct sss_tool_msg *tool_msg, void *in_buf)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:91:6: warning: no previous prototype for function 'sss_tool_free_out_buf' [-Wmissing-prototypes]
      91 | void sss_tool_free_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      91 | void sss_tool_free_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:104:5: warning: no previous prototype for function 'sss_tool_alloc_in_buf' [-Wmissing-prototypes]
     104 | int sss_tool_alloc_in_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     104 | int sss_tool_alloc_in_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:146:5: warning: no previous prototype for function 'sss_tool_alloc_out_buf' [-Wmissing-prototypes]
     146 | int sss_tool_alloc_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:146:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     146 | int sss_tool_alloc_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:182:5: warning: no previous prototype for function 'sss_tool_copy_to_user' [-Wmissing-prototypes]
     182 | int sss_tool_copy_to_user(struct sss_tool_msg *tool_msg,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     182 | int sss_tool_copy_to_user(struct sss_tool_msg *tool_msg,
         | ^
         | static 
   12 warnings generated.
..


vim +/sss_adm_msg_write +545 drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c

   544	
 > 545	int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
   546			      const void *cmd, u16 cmd_size)
   547	{
   548		return sss_adm_msg_io(adm_msg, node_id, cmd, cmd_size, NULL, 0);
   549	}
   550	
 > 551	int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
   552			     const void *cmd, u16 size, void *ack, u16 ack_size)
   553	{
   554		return sss_adm_msg_io(adm_msg, node_id, cmd, size, ack, ack_size);
   555	}
   556	
   557	static void sss_set_adm_event_flag(struct sss_msg_pf_to_mgmt *pf_to_mgmt,
   558					   int event_flag)
   559	{
   560		spin_lock(&pf_to_mgmt->sync_event_lock);
   561		pf_to_mgmt->event_state = event_flag;
   562		spin_unlock(&pf_to_mgmt->sync_event_lock);
   563	}
   564	
   565	static u16 sss_align_adm_msg_len(u16 msg_data_len)
   566	{
   567		/* u64 - the size of the header */
   568		u16 msg_size;
   569	
   570		msg_size = (u16)(SSS_MGMT_MSG_RSVD_FOR_DEV + sizeof(u64) + msg_data_len);
   571	
   572		if (msg_size > SSS_MGMT_MSG_SIZE_MIN)
   573			msg_size = SSS_MGMT_MSG_SIZE_MIN +
   574				   ALIGN((msg_size - SSS_MGMT_MSG_SIZE_MIN), SSS_MGMT_MSG_SIZE_STEP);
   575		else
   576			msg_size = SSS_MGMT_MSG_SIZE_MIN;
   577	
   578		return msg_size;
   579	}
   580	
   581	static void sss_encapsulate_adm_msg(u8 *adm_msg, u64 *header,
   582					    const void *body, int body_len)
   583	{
   584		u8 *adm_msg_new = adm_msg;
   585	
   586		memset(adm_msg_new, 0, SSS_MGMT_MSG_RSVD_FOR_DEV);
   587	
   588		adm_msg_new += SSS_MGMT_MSG_RSVD_FOR_DEV;
   589		memcpy(adm_msg_new, header, sizeof(*header));
   590	
   591		adm_msg_new += sizeof(*header);
   592		memcpy(adm_msg_new, body, (size_t)(u32)body_len);
   593	}
   594	
   595	#define SSS_MAX_PF_MGMT_BUF_MAX 2048L
   596	
 > 597	int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
   598				 u16 size, void *ack, u16 ack_size)
   599	{
   600		struct sss_msg_pf_to_mgmt *pf_to_mgmt = NULL;
   601		struct sss_adm_msg *adm_mag = NULL;
   602	
   603		if (!hwdev || !cmd || (ack_size && !ack) || size > SSS_MAX_PF_MGMT_BUF_MAX)
   604			return -EINVAL;
   605	
   606		if (!SSS_SUPPORT_ADM_MSG((struct sss_hwdev *)hwdev))
   607			return -EPERM;
   608	
   609		pf_to_mgmt = ((struct sss_hwdev *)hwdev)->pf_to_mgmt;
   610		adm_mag = pf_to_mgmt->adm_msg[SSS_ADM_MSG_POLL_READ];
   611	
   612		if (!(((struct sss_hwdev *)hwdev)->chip_present_flag))
   613			return -EPERM;
   614	
   615		return sss_adm_msg_read(adm_mag, dest, cmd, size, ack, ack_size);
   616	}
   617	
 > 618	int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
   619	{
   620		struct sss_msg_pf_to_mgmt *pf_to_mgmt = NULL;
   621		struct sss_adm_msg *adm_mag = NULL;
   622	
   623		if (!hwdev || !size || !cmd || size > SSS_MAX_PF_MGMT_BUF_MAX)
   624			return -EINVAL;
   625	
   626		if (!SSS_SUPPORT_ADM_MSG((struct sss_hwdev *)hwdev))
   627			return -EPERM;
   628	
   629		pf_to_mgmt = ((struct sss_hwdev *)hwdev)->pf_to_mgmt;
   630		adm_mag = pf_to_mgmt->adm_msg[SSS_ADM_MSG_POLL_WRITE];
   631	
   632		if (!(((struct sss_hwdev *)hwdev)->chip_present_flag))
   633			return -EPERM;
   634	
   635		return sss_adm_msg_write(adm_mag, dest, cmd, size);
   636	}
   637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
