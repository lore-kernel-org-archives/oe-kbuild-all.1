Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CFF1836F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 21:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712786272; cv=none; b=bIXwipDvx3Bx/P82fzHI/lvX7UXKjfGBxrhsKN/Vb/kdAQE7c3EMXh2xq9YIn9QeGCas19HuxFNf2q+OMBNi3cL78+Rk8AIw4c1S/30cv07RkX2xqcSeWdTlnp9ZjDPpokXnUY4/iHrHr6396W7mPhKtsN5RV9qlGTTiX9TAn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712786272; c=relaxed/simple;
	bh=VoIz1rKyUZ4nGqp3MSHteroetXk9KdszaXdOmggVkYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJr0B4j0AZJb0p1zd6LpZkKYrTxy4yP35cQJZTs8L12HmXKMlep55wBDSdFHcdAq3sorm46YDDRifDzvkaFNJfDkzBIoTOgbizwySKIGqeqcd3e1rLC8iP8e/fd2R1FuFdH4QD7Gm/QYwvmicN7kfMza9oEldfCrZGNL5IvFghY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFOMztXP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFOMztXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712786271; x=1744322271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VoIz1rKyUZ4nGqp3MSHteroetXk9KdszaXdOmggVkYE=;
  b=SFOMztXPr31ceQf3l3YdJcYJL0IkTTZRyHciyE/b6OaWgW+L+TVes2YS
   3eX1JbTVVtsnRFLQ1reS6yycPn3fcHNPmWmERPLwn961+IEHg2yYl6TH9
   Sx5Tzh9OzRZWnmdx2Kpp7295tRorx3A+SMI0W2eJkTNZXC8AG/SCECj8v
   EjJld9lI4Prb+DVJn6fyTh9yl9eOjLEbAMdoMOd+yuAeLQibXrXXo0bei
   Njl7hQ9uHvjWKLX9Fards8OSc9UUTX0SxVNyy3sWBLO/xRWAnWvKVWKeP
   9qIZ8vgKij/ZadIvotrS+5kp4vLa06Qk+27djm7kGzHXmXomydPvn1qN3
   A==;
X-CSE-ConnectionGUID: WIAUIljgT4i7l4d2E75b6A==
X-CSE-MsgGUID: mrFSIQxeTF+TCkDcnpuukw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18780864"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="18780864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 14:57:50 -0700
X-CSE-ConnectionGUID: VbB7vJosREmsSN63lw1n/Q==
X-CSE-MsgGUID: rK3U8KS8TpWX3Nc0G56a/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="25219669"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2024 14:57:47 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rufwv-0007sE-14;
	Wed, 10 Apr 2024 21:57:45 +0000
Date: Thu, 11 Apr 2024 05:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, weiwei1 <weiwei1@ramaxel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7335/7359] include/linux/vmstat.h:508:43: error:
 arithmetic between different enumeration types ('enum zone_stat_item' and
 'enum numa_stat_item')
Message-ID: <202404110502.krefKWQW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b4a3ad1c3275f9d45e0877a85dd1408701227279
commit: 6864d14bb90f03a1e5b7fbcc04fc2ba4d692bd3e [7335/7359] support 3SNIC 910/920/930 NIC
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240411/202404110502.krefKWQW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110502.krefKWQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110502.krefKWQW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:6:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2204:
>> include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
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
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:883:6: error: no previous prototype for function 'sss_nic_port_module_cable_plug' [-Werror,-Wmissing-prototypes]
     883 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:883:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     883 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:889:6: error: no previous prototype for function 'sss_nic_port_module_cable_unplug' [-Werror,-Wmissing-prototypes]
     889 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:889:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     889 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:895:6: error: no previous prototype for function 'sss_nic_port_module_link_err' [-Werror,-Wmissing-prototypes]
     895 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:895:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     895 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1034:22: error: no previous prototype for function 'get_nic_uld_info' [-Werror,-Wmissing-prototypes]
    1034 | struct sss_uld_info *get_nic_uld_info(void)
         |                      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1034:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1034 | struct sss_uld_info *get_nic_uld_info(void)
         | ^
         | static 
   9 errors generated.
--
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx.c:6:
   In file included from include/net/xfrm.h:9:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2204:
>> include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
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
   5 errors generated.
--
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:6:
   In file included from include/net/xfrm.h:9:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2204:
>> include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
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
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:42:5: error: no previous prototype for function 'sss_nic_alloc_sq_resource' [-Werror,-Wmissing-prototypes]
      42 | int sss_nic_alloc_sq_resource(struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | int sss_nic_alloc_sq_resource(struct sss_nic_dev *nic_dev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:87:6: error: no previous prototype for function 'sss_nic_free_sq_resource' [-Werror,-Wmissing-prototypes]
      87 | void sss_nic_free_sq_resource(struct sss_nic_dev *nic_dev,
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:87:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      87 | void sss_nic_free_sq_resource(struct sss_nic_dev *nic_dev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:104:6: error: no previous prototype for function 'sss_nic_init_all_sq' [-Werror,-Wmissing-prototypes]
     104 | void sss_nic_init_all_sq(struct sss_nic_dev *nic_dev,
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     104 | void sss_nic_init_all_sq(struct sss_nic_dev *nic_dev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:128:5: error: no previous prototype for function 'sss_nic_alloc_sq_desc_group' [-Werror,-Wmissing-prototypes]
     128 | int sss_nic_alloc_sq_desc_group(struct sss_nic_dev *nic_dev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:128:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     128 | int sss_nic_alloc_sq_desc_group(struct sss_nic_dev *nic_dev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:153:6: error: no previous prototype for function 'sss_nic_free_sq_desc_group' [-Werror,-Wmissing-prototypes]
     153 | void sss_nic_free_sq_desc_group(struct sss_nic_dev *nic_dev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:153:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     153 | void sss_nic_free_sq_desc_group(struct sss_nic_dev *nic_dev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:200:6: error: no previous prototype for function 'sss_nic_flush_all_sq' [-Werror,-Wmissing-prototypes]
     200 | void sss_nic_flush_all_sq(struct sss_nic_dev *nic_dev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:200:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     200 | void sss_nic_flush_all_sq(struct sss_nic_dev *nic_dev)
         | ^
         | static 
   11 errors generated.
--
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:8:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2204:
>> include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
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
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:80:5: error: no previous prototype for function 'sss_nic_alloc_rq_res_group' [-Werror,-Wmissing-prototypes]
      80 | int sss_nic_alloc_rq_res_group(struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | int sss_nic_alloc_rq_res_group(struct sss_nic_dev *nic_dev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:136:6: error: no previous prototype for function 'sss_nic_free_rq_res_group' [-Werror,-Wmissing-prototypes]
     136 | void sss_nic_free_rq_res_group(struct sss_nic_dev *nic_dev,
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:136:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     136 | void sss_nic_free_rq_res_group(struct sss_nic_dev *nic_dev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:208:5: error: no previous prototype for function 'sss_nic_init_rq_desc_group' [-Werror,-Wmissing-prototypes]
     208 | int sss_nic_init_rq_desc_group(struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:208:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     208 | int sss_nic_init_rq_desc_group(struct sss_nic_dev *nic_dev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:235:6: error: no previous prototype for function 'sss_nic_free_rq_desc_group' [-Werror,-Wmissing-prototypes]
     235 | void sss_nic_free_rq_desc_group(struct sss_nic_dev *nic_dev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     235 | void sss_nic_free_rq_desc_group(struct sss_nic_dev *nic_dev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:241:5: error: no previous prototype for function 'sss_nic_alloc_rq_desc_group' [-Werror,-Wmissing-prototypes]
     241 | int sss_nic_alloc_rq_desc_group(struct sss_nic_dev *nic_dev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:241:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     241 | int sss_nic_alloc_rq_desc_group(struct sss_nic_dev *nic_dev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:267:5: error: no previous prototype for function 'sss_nic_update_rx_rss' [-Werror,-Wmissing-prototypes]
     267 | int sss_nic_update_rx_rss(struct sss_nic_dev *nic_dev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:267:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     267 | int sss_nic_update_rx_rss(struct sss_nic_dev *nic_dev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:282:6: error: no previous prototype for function 'sss_nic_reset_rx_rss' [-Werror,-Wmissing-prototypes]
     282 | void sss_nic_reset_rx_rss(struct net_device *netdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_init.c:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     282 | void sss_nic_reset_rx_rss(struct net_device *netdev)
         | ^
         | static 
   12 errors generated.
--
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:8:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2204:
>> include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
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
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:179:6: error: no previous prototype for function 'sss_nic_rq_watchdog_handler' [-Werror,-Wmissing-prototypes]
     179 | void sss_nic_rq_watchdog_handler(struct work_struct *work)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     179 | void sss_nic_rq_watchdog_handler(struct work_struct *work)
         | ^
         | static 
   6 errors generated.
..


vim +508 include/linux/vmstat.h

9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  504  
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  505  #ifdef CONFIG_NUMA
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  506  static inline const char *numa_stat_name(enum numa_stat_item item)
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  507  {
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04 @508  	return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  509  			   item];
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  510  }
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  511  #endif /* CONFIG_NUMA */
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  512  
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  513  static inline const char *node_stat_name(enum node_stat_item item)
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  514  {
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04 @515  	return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
f19298b9516c1a Mel Gorman            2021-06-28  516  			   NR_VM_NUMA_EVENT_ITEMS +
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  517  			   item];
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  518  }
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  519  
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  520  static inline const char *lru_list_name(enum lru_list lru)
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  521  {
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04 @522  	return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  523  }
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  524  

:::::: The code at line 508 was first introduced by commit
:::::: 9d7ea9a297e6445d567056f15b469dde13ca4134 mm/vmstat: add helpers to get vmstat item names for each enum type

:::::: TO: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
