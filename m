Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E451CD213
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 21:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733435106; cv=none; b=NUGpWp7CaS4AgrpuiW/G9DdnxAaKQ3O7FrRLyxtGciSs6ci+ro8JUHi/EWgV8T9VWxRzHm+tL/V3CKYvttDQvD0CCKo6QB6vPIify2MkPZfl1Baa6bK+Au3QufaZuRjNLaLEm5ZozxD5frBMHtHm5HH5qFiN0q9e2dGv5ch6DNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733435106; c=relaxed/simple;
	bh=wiNPVYgKoVZ2HujOtP+942VBSOGR3na2EvMjIMmF6mk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VWbeD8VCZDJk64xPdClJ5k0ZPGJKsDdh9KYIXWOiwjRGOQw0Gh/PGSgC7TWnex3P9fQZDNq6spNpBlq22TpHinThZ6h/769lRgrrO4SXy5oUgNawnqESKFh5DsIiTiWp1Vju95/9R8DGQkqpbZePUd0jK3uaqbSoOTuQLfArFfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+BC7Hh2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+BC7Hh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733435105; x=1764971105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wiNPVYgKoVZ2HujOtP+942VBSOGR3na2EvMjIMmF6mk=;
  b=V+BC7Hh2Cz2b0M7GUHXlSWlEm15ulHiRhx20mzLG17K3tQnQPbezQbtb
   PmrrLoTqu+FQ9p3UswFJJJjYhmvo89pCiNUl7RiptXr5/pFvscsO99G+t
   qTJ0dUPtpXGeOajmIWyqInSKmwMmW6KSsSOGaCxJlPoA8jYy7XKPw6EP3
   mTvrdvHCzyt1uNSz3Udc463DSeoHHuyZayWRJRlXC51ArnEBfTyzhkGvr
   GfYclK82o++qD1jC0mYp13mIK2HTjTZu1vYrokJUJ1DedPMvemt0eNFa7
   uHSgtc8FJrQd/GxQJHvZbOKYduePBr4/BKC5gl6L41GkvIgYxXHOQ4KAM
   A==;
X-CSE-ConnectionGUID: F7Fqvi30QyGn0ALdyMY+mQ==
X-CSE-MsgGUID: Gko0mRoES6qkMdT/eqtbqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="34019006"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="34019006"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 13:45:04 -0800
X-CSE-ConnectionGUID: Wb0AHsZASk+cxLer9oxf8w==
X-CSE-MsgGUID: 33O9Vzi0Sc6erJHdpE9X7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="125054147"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2024 13:45:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJJee-0000Ps-0V;
	Thu, 05 Dec 2024 21:45:00 +0000
Date: Fri, 6 Dec 2024 05:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, haodongdong <doubled@leap-io.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1599/1599]
 drivers/scsi/leapioraid/leapioraid_func.c:289:6: warning: variable 'ret' set
 but not used
Message-ID: <202412060508.uzqNwHvM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f0c88450d57092a03a2efd8e066f146f2b7c4ee0
commit: 7fea595ef48e9ab13bd31df067b19152153e1925 [1599/1599] SCSI: LEAPIORAID: Supports LEAPIO RAID controller
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241206/202412060508.uzqNwHvM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060508.uzqNwHvM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060508.uzqNwHvM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/leapioraid/leapioraid_func.c:51:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/leapioraid/leapioraid_func.c:289:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     289 |         int ret;
         |             ^
>> drivers/scsi/leapioraid/leapioraid_func.c:671:1: warning: no previous prototype for function 'leapioraid_base_stop_smart_polling' [-Wmissing-prototypes]
     671 | leapioraid_base_stop_smart_polling(struct LEAPIORAID_ADAPTER *ioc)
         | ^
   drivers/scsi/leapioraid/leapioraid_func.c:670:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     670 | void
         | ^
         | static 
>> drivers/scsi/leapioraid/leapioraid_func.c:1300:1: warning: no previous prototype for function 'leapioraid_base_process_reply_queue' [-Wmissing-prototypes]
    1300 | leapioraid_base_process_reply_queue(
         | ^
   drivers/scsi/leapioraid/leapioraid_func.c:1299:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1299 | int
         | ^
         | static 
>> drivers/scsi/leapioraid/leapioraid_func.c:1468:5: warning: no previous prototype for function 'leapioraid_base_irqpoll' [-Wmissing-prototypes]
    1468 | int leapioraid_base_irqpoll(struct irq_poll *irqpoll, int budget)
         |     ^
   drivers/scsi/leapioraid/leapioraid_func.c:1468:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1468 | int leapioraid_base_irqpoll(struct irq_poll *irqpoll, int budget)
         | ^
         | static 
>> drivers/scsi/leapioraid/leapioraid_func.c:1490:1: warning: no previous prototype for function 'leapioraid_base_init_irqpolls' [-Wmissing-prototypes]
    1490 | leapioraid_base_init_irqpolls(struct LEAPIORAID_ADAPTER *ioc)
         | ^
   drivers/scsi/leapioraid/leapioraid_func.c:1489:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1489 | void
         | ^
         | static 
>> drivers/scsi/leapioraid/leapioraid_func.c:1720:27: warning: variable 'sgl_zero_addr' set but not used [-Wunused-but-set-variable]
    1720 |         void *sg_local, *chain, *sgl_zero_addr;
         |                                  ^
>> drivers/scsi/leapioraid/leapioraid_func.c:4307:12: warning: variable 'ct' is uninitialized when used here [-Wuninitialized]
    4307 |                                                      ct);
         |                                                      ^~
   drivers/scsi/leapioraid/leapioraid_func.c:4086:37: note: initialize the variable 'ct' to silence this warning
    4086 |         struct leapioraid_chain_tracker *ct;
         |                                            ^
         |                                             = NULL
>> drivers/scsi/leapioraid/leapioraid_func.c:4414:1: warning: no previous prototype for function 'leapioraid_base_flush_ios_and_panic' [-Wmissing-prototypes]
    4414 | leapioraid_base_flush_ios_and_panic(
         | ^
   drivers/scsi/leapioraid/leapioraid_func.c:4413:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4413 | void
         | ^
         | static 
>> drivers/scsi/leapioraid/leapioraid_func.c:5723:6: warning: variable 'ioc_state' set but not used [-Wunused-but-set-variable]
    5723 |         u32 ioc_state;
         |             ^
>> drivers/scsi/leapioraid/leapioraid_func.c:5974:5: warning: variable 'issue_reset' set but not used [-Wunused-but-set-variable]
    5974 |         u8 issue_reset;
         |            ^
   15 warnings generated.
--
   In file included from drivers/scsi/leapioraid/leapioraid_os.c:48:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/leapioraid/leapioraid_os.c:521:31: warning: no previous prototype for function 'leapioraid_get_sdev_from_target' [-Wmissing-prototypes]
     521 | struct leapioraid_sas_device *leapioraid_get_sdev_from_target(
         |                               ^
   drivers/scsi/leapioraid/leapioraid_os.c:521:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     521 | struct leapioraid_sas_device *leapioraid_get_sdev_from_target(
         | ^
         | static 
>> drivers/scsi/leapioraid/leapioraid_os.c:534:31: warning: no previous prototype for function '__leapioraid_get_sdev_by_addr' [-Wmissing-prototypes]
     534 | struct leapioraid_sas_device *__leapioraid_get_sdev_by_addr(
         |                               ^
   drivers/scsi/leapioraid/leapioraid_os.c:534:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     534 | struct leapioraid_sas_device *__leapioraid_get_sdev_by_addr(
         | ^
         | static 
>> drivers/scsi/leapioraid/leapioraid_os.c:866:35: warning: no previous prototype for function 'leapioraid_scsihost_enclosure_find_by_handle' [-Wmissing-prototypes]
     866 | struct leapioraid_enclosure_node *leapioraid_scsihost_enclosure_find_by_handle(
         |                                   ^
   drivers/scsi/leapioraid/leapioraid_os.c:866:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     866 | struct leapioraid_enclosure_node *leapioraid_scsihost_enclosure_find_by_handle(
         | ^
         | static 
>> drivers/scsi/leapioraid/leapioraid_os.c:1854:1: warning: no previous prototype for function 'leapioraid_scsihost_tm_cmd_map_status' [-Wmissing-prototypes]
    1854 | leapioraid_scsihost_tm_cmd_map_status(
         | ^
   drivers/scsi/leapioraid/leapioraid_os.c:1853:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1853 | int
         | ^
         | static 
>> drivers/scsi/leapioraid/leapioraid_os.c:1889:1: warning: no previous prototype for function 'leapioraid_scsihost_tm_post_processing' [-Wmissing-prototypes]
    1889 | leapioraid_scsihost_tm_post_processing(struct LEAPIORAID_ADAPTER *ioc, u16 handle,
         | ^
   drivers/scsi/leapioraid/leapioraid_os.c:1888:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1888 | int
         | ^
         | static 
>> drivers/scsi/leapioraid/leapioraid_os.c:3602:32: warning: variable 'mpi_request' set but not used [-Wunused-but-set-variable]
    3602 |         struct LeapioraidSCSIIOReq_t *mpi_request;
         |                                       ^
>> drivers/scsi/leapioraid/leapioraid_os.c:5293:16: warning: variable 'timeleft' set but not used [-Wunused-but-set-variable]
    5293 |         unsigned long timeleft;
         |                       ^
>> drivers/scsi/leapioraid/leapioraid_os.c:7164:6: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
    7164 |         int rc;
         |             ^
>> drivers/scsi/leapioraid/leapioraid_os.c:7727:28: warning: variable 'sas_target_priv_data' set but not used [-Wunused-but-set-variable]
    7727 |         struct LEAPIORAID_TARGET *sas_target_priv_data;
         |                                   ^
>> drivers/scsi/leapioraid/leapioraid_os.c:9379:5: warning: variable 'revision' set but not used [-Wunused-but-set-variable]
    9379 |         u8 revision;
         |            ^
   15 warnings generated.
--
   In file included from drivers/scsi/leapioraid/leapioraid_transport.c:50:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/leapioraid/leapioraid_transport.c:104:1: warning: no previous prototype for function 'leapioraid_transport_get_port_id_by_rphy' [-Wmissing-prototypes]
     104 | leapioraid_transport_get_port_id_by_rphy(struct LEAPIORAID_ADAPTER *ioc,
         | ^
   drivers/scsi/leapioraid/leapioraid_transport.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | u8
         | ^
         | static 
   6 warnings generated.


vim +/ret +289 drivers/scsi/leapioraid/leapioraid_func.c

   285	
   286	static int
   287	leapioraid_udp_init(void)
   288	{
 > 289		int ret;
   290		u32 ip;
   291	
   292		if (sock)
   293			return 0;
   294		if (!in4_pton(dest_ip, -1, (u8 *) &ip, -1, NULL)) {
   295			pr_err("Invalid IP address: %s, set to default: 127.0.0.1\n",
   296			       dest_ip);
   297			dest_ip = "127.0.0.1";
   298		}
   299		ret =
   300		    sock_create_kern(&init_net, AF_INET, SOCK_DGRAM, IPPROTO_UDP,
   301				     &sock);
   302		memset(&dest_addr, 0, sizeof(dest_addr));
   303		dest_addr.sin_family = AF_INET;
   304		dest_addr.sin_addr.s_addr = ip;
   305		dest_addr.sin_port = htons(port_no);
   306		memset(&msg, 0, sizeof(msg));
   307		msg.msg_name = &dest_addr;
   308		msg.msg_namelen = sizeof(struct sockaddr_in);
   309		return 0;
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
