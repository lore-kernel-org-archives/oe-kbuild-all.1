Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE9A28684
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 03:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719976577; cv=none; b=YcQGx1MaKyYFB2BDNSB4tAeaRQhMYqrleonCxc4kM8AEJmQxXxvGtIMgj2KyOaTAafwog7C7+1hGVskF5qdIWQDLR3OYgj/jAYx3K9m3yWDtKAyRF1weH0fEHtw5vNpM+t/JyLD7K1tkcpNp5UCKxwVCE6XXynxKP7V4bkTYtGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719976577; c=relaxed/simple;
	bh=ofJXPKStCsG92vftvwGI6dxuXOkmIfl7Vw4t6QCL/sg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aa25bXseeQPQkMxe1g4oG3AjenT1/dID2ye1aGJU3qluJhGaGusMV0DGbmMu8LL1+3d3nSi+lEIpyDfF1DHRLW9gzCE1X55jJgchxbHJtmMXDJztTF1Z1slmCuMloV2S3hZsFLgGV1x/kfEkFN6vI0Wgxu2zaMwRudCAon2xj8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SoUa2qnf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SoUa2qnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719976575; x=1751512575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ofJXPKStCsG92vftvwGI6dxuXOkmIfl7Vw4t6QCL/sg=;
  b=SoUa2qnf0dbyNzams+dkVIBDGw4oNZA5USPi4yfAJaP1eIU+sv4ZKx5p
   O+Ykr/+5x3U80l0cYZJxloqQMl4G4LE7Y3ZcAFqNaR0I68frJT1k1C6eJ
   BBWuQoRiOCRLWeRvaInxrMiSLxB6Wh67JPUm+TA8R/0D0UQkNu3y2ii0y
   EStUiaQoQJTunVuaM45xb7gHE/cIoJhb6LaVb5+VS54UrtVhj/1R7NtoF
   XiD2RiEFsg0RP3IDgymq+HfXDRSow9R9HtiFOrLOUVXIlNRAf5WRFpiTH
   2LLc1vuaefjyMlFW2penvXC4FxhBaUI820NLUlZYgPFvJ2QGaco6CKoSw
   g==;
X-CSE-ConnectionGUID: AYSXW3MzTAyQb7XMVDnQGg==
X-CSE-MsgGUID: 4QTN2/+iTeuw0y1UjxxovQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28576953"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="28576953"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 20:16:14 -0700
X-CSE-ConnectionGUID: +ip6clf6TQGmP5KCDeT1NA==
X-CSE-MsgGUID: DiAS9SWyQpWolS6YPlOXYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="76849659"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2024 20:16:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOqTa-000PBy-1g;
	Wed, 03 Jul 2024 03:16:10 +0000
Date: Wed, 3 Jul 2024 11:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7625/10534] clang: warning: no such include
 directory: 'drivers/infiniband/hw/hiroce3/include/mag'
Message-ID: <202407031126.xcsqeJZv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   986fcc8fdfd8e0bd6f40bcc824a260c61bfaff31
commit: 5bc8dbb5fdf565625b2eea4080dbd70bade992b8 [7625/10534] infiniband/hw/hiroce3: Add Huawei Intelligent Network Card RDMA Driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240703/202407031126.xcsqeJZv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031126.xcsqeJZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031126.xcsqeJZv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang: warning: no such include directory: 'drivers/infiniband/hw/hiroce3/include/mag' [-Wmissing-include-dirs]
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:6:
   In file included from drivers/net/ethernet/huawei/hinic3/hinic3_hw.h:10:
   In file included from drivers/net/ethernet/huawei/hinic3/hinic3_crm.h:7:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2204:
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
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_ccf_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_ccf_format.h:720:9: note: previous '#pragma pack' directive that modifies alignment is here
     720 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_dif_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_verbs_mr_attr.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      15 | #include "roce_dif_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "rdma_ext_ctx_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:377:9: note: previous '#pragma pack' directive that modifies alignment is here
     377 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       7 | #include "rdma_context_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:5179:9: note: previous '#pragma pack' directive that modifies alignment is here
    5179 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_common.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "roce_verbs_pub.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_pub.h:223:9: note: previous '#pragma pack' directive that modifies alignment is here
     223 | #pragma pack()
         |         ^
   11 warnings generated.
--
>> clang: warning: no such include directory: 'drivers/infiniband/hw/hiroce3/include/mag' [-Wmissing-include-dirs]
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:7:
   In file included from include/rdma/ib_verbs.h:15:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
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
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:13:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_ccf_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_ccf_format.h:720:9: note: previous '#pragma pack' directive that modifies alignment is here
     720 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:13:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_dif_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_verbs_mr_attr.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:13:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      15 | #include "roce_dif_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:13:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "rdma_ext_ctx_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:377:9: note: previous '#pragma pack' directive that modifies alignment is here
     377 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   drivers/infiniband/hw/hiroce3/cq/roce_cq.h:13:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      13 | #include "rdma_context_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:5179:9: note: previous '#pragma pack' directive that modifies alignment is here
    5179 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:15:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "roce_verbs_pub.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_pub.h:223:9: note: previous '#pragma pack' directive that modifies alignment is here
     223 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq.h:15:
   drivers/infiniband/hw/hiroce3/roce.h:30:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      30 | #include "roce_verbs_cmd.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_pub.h:223:9: note: previous '#pragma pack' directive that modifies alignment is here
     223 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_create.c:4:
   drivers/infiniband/hw/hiroce3/cq/roce_cq.h:15:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
--
>> clang: warning: no such include directory: 'drivers/infiniband/hw/hiroce3/include/mag' [-Wmissing-include-dirs]
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:6:
   In file included from drivers/net/ethernet/huawei/hinic3/hinic3_hw.h:10:
   In file included from drivers/net/ethernet/huawei/hinic3/hinic3_crm.h:7:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2204:
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
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_ccf_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_ccf_format.h:720:9: note: previous '#pragma pack' directive that modifies alignment is here
     720 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_dif_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_verbs_mr_attr.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      15 | #include "roce_dif_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "rdma_ext_ctx_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:377:9: note: previous '#pragma pack' directive that modifies alignment is here
     377 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       7 | #include "rdma_context_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:5179:9: note: previous '#pragma pack' directive that modifies alignment is here
    5179 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:8:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "roce_verbs_pub.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_pub.h:223:9: note: previous '#pragma pack' directive that modifies alignment is here
     223 | #pragma pack()
         |         ^
   drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:63:5: warning: no previous prototype for function 'roce3_cq_hw2sw' [-Wmissing-prototypes]
      63 | int roce3_cq_hw2sw(struct roce3_device *rdev, struct roce3_cq *cq)
         |     ^
   drivers/infiniband/hw/hiroce3/cq/roce_cq_destroy.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      63 | int roce3_cq_hw2sw(struct roce3_device *rdev, struct roce3_cq *cq)
         | ^
         | static 
   12 warnings generated.
--
>> clang: warning: no such include directory: 'drivers/infiniband/hw/hiroce3/include/mag' [-Wmissing-include-dirs]
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:4:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:100:
   In file included from include/linux/tcp.h:17:
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
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:26:
   In file included from drivers/infiniband/hw/hiroce3/roce_event.h:20:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_ccf_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_ccf_format.h:720:9: note: previous '#pragma pack' directive that modifies alignment is here
     720 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:26:
   In file included from drivers/infiniband/hw/hiroce3/roce_event.h:20:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_dif_format.h:9:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       9 | #include "roce_verbs_mr_attr.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:26:
   In file included from drivers/infiniband/hw/hiroce3/roce_event.h:20:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:15:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
      15 | #include "roce_dif_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_mr_attr.h:328:9: note: previous '#pragma pack' directive that modifies alignment is here
     328 | #pragma pack()
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:26:
   In file included from drivers/infiniband/hw/hiroce3/roce_event.h:20:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   In file included from drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "rdma_ext_ctx_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_ext_ctx_format.h:377:9: note: previous '#pragma pack' directive that modifies alignment is here
     377 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:26:
   In file included from drivers/infiniband/hw/hiroce3/roce_event.h:20:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:7:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       7 | #include "rdma_context_format.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/rdma_context_format.h:5179:9: note: previous '#pragma pack' directive that modifies alignment is here
    5179 | #pragma pack(0)
         |         ^
   In file included from drivers/infiniband/hw/hiroce3/roce_main.c:26:
   In file included from drivers/infiniband/hw/hiroce3/roce_event.h:20:
   In file included from drivers/infiniband/hw/hiroce3/roce.h:30:
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_cmd.h:8:10: warning: the current #pragma pack alignment value is modified in the included file [-Wpragma-pack]
       8 | #include "roce_verbs_pub.h"
         |          ^
   drivers/infiniband/hw/hiroce3/include/rdma/roce_verbs_pub.h:223:9: note: previous '#pragma pack' directive that modifies alignment is here
     223 | #pragma pack()
         |         ^
   drivers/infiniband/hw/hiroce3/roce_main.c:1256:6: warning: no previous prototype for function 'roce3_need_proc_link_event' [-Wmissing-prototypes]
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
