Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9041430ACE4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 21:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765662929; cv=none; b=I7Zb4dn4nruAmruoDchxnZHclmnW8Jz+NhZYJ4N+6zV7BCZkuYfQF90n5mK5cXuyZGLq/TBHRmLHeyFyARCrK3ckMtW/ZSA6XEg6hxMYflOJ8fLmKkqurKef0epUxf2lhMEg87pk6zR/KppM0lLouVtzv9M1N6Z5JBxkZ/HazxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765662929; c=relaxed/simple;
	bh=vjadoHqNa5sU9PoDa5oXHHsdeabtpKLZyDR/HjXKt9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S02Jc0DO+B5etw5dNxdcz0c1mS5xYQqDroi+EkNUR46y4y2IJrrgzbYIkv01I/NDGGThOhRnMbFvhzgRtESmhwf42BDtFnNVQlj1Lx0EKUlQbKXQsZFYDqlp2oA5nTgI9tEyIKwGm2Yctmt60nUlFUh+Wyyn3xW76T2zuSNAY4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCJel54w; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCJel54w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765662927; x=1797198927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vjadoHqNa5sU9PoDa5oXHHsdeabtpKLZyDR/HjXKt9A=;
  b=LCJel54whtfwB7Kpnu+nVVhdPeMLfVP5yfm/UvBKQ8oSRBZ2lkjDyyoS
   R4vOnwGBYVBKrGqfftCa3iC2oUILltAaFBHFEAHwYiQfU2BnwwvvFaNFv
   lfthxz0e3mQV/A11EGzXSbtNmySAzYZ7SM7TaKH8bp1zv79T/J8R2kjq/
   DlkRXSB2EEF0yfREbZl34YLtfOQU8g8aNKaKT+QZ8Vh2EEISp34LOG0mz
   b4eaptNY1FTHDWpZchnht6QECgCPimkSiL9eM7mTGYIF984oxdpDu2fls
   lIJE9P2/ZzkUoeP1hC2vB7X+ArrjyCbopIpoYZkUobsfndRVGJVJXE/9S
   Q==;
X-CSE-ConnectionGUID: H0B5Q7PKSwae9HMACPnP8g==
X-CSE-MsgGUID: EWtVgzu8Sl6OLPzSEE1Bqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="93099767"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="93099767"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 13:55:25 -0800
X-CSE-ConnectionGUID: 25OlNF71QjyGa93fuefIyw==
X-CSE-MsgGUID: C5uIRjh2QgSG/OvrhwPhyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202473695"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 13:55:23 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUXaD-000000008FX-0dPS;
	Sat, 13 Dec 2025 21:55:21 +0000
Date: Sun, 14 Dec 2025 05:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3540/3540] clang: warning: no such include
 directory: 'drivers/infiniband/hw/hiroce3/include/mag'
Message-ID: <202512140527.ZQJQrPyG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shuai,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 5bc8dbb5fdf565625b2eea4080dbd70bade992b8 [3540/3540] infiniband/hw/hiroce3: Add Huawei Intelligent Network Card RDMA Driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512140527.ZQJQrPyG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140527.ZQJQrPyG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140527.ZQJQrPyG-lkp@intel.com/

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
