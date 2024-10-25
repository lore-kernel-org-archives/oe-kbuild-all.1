Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8F818C347
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 05:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729833887; cv=none; b=kbquISkpiGu1Pnm+HboMwxYNcmB635i/lOf3au778cmnb6tA7uQtgtKpfdPqbEPe+5m5P98Ya5vzTGXwWc5cEAWKaOdNY6qAJQCPFgDXTY2+OuHnaPcGQTqdz63H1khJSCk09ykIjE7UsJz67yMsGHrv7RfJiRbDzfsWfVRtfJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729833887; c=relaxed/simple;
	bh=7O+PAc7jzlRkpSk7zfa8ZdU6RCsqqDWvvq93s2fDMDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gjsf+b7dvLMJGXz5oebzhdf0fZ/9pszALQIOZhvCyImzt32tZV0u4w2ZfeMf0XuULbnWzHL3iCZBs0HRhc+z/tek4duXNYd+XvFOHjdLSkQiC0ajxKolJ8YFmciEqo4kD7BivRCXu1RZdtT+JSevE7etxtVkN0lv5K1kQVdChw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nH/n62WO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nH/n62WO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729833884; x=1761369884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7O+PAc7jzlRkpSk7zfa8ZdU6RCsqqDWvvq93s2fDMDc=;
  b=nH/n62WOYCiUxdqLl/Lj6Cb/aku/GA6bhhj8YGmMUJ75kGLR5PzAQhDf
   rTmPxWT8CB0YHPA2lyiW4zOu6SgGDXdEsumUFaO/uwGg4ntifY6hVMhKG
   VHKUHAuo6ASdLF2wFRUuppMj9wLHof/798Wt0LyFs1adA4mxIBvfrQRGm
   VEfsiuqKbmtiG6u1XUfYPNekr6MSz5JKM5/RpBcuWw3XI9AKT9wYGPb+S
   CQHqZ8+6uNI6+FTkCm/RkxJtZOshWnZlWguYWJ4wfu0g81Usq5zlRKZMZ
   KzOLLLGkq0qlIH7Swd4iTnNa2MZr0Sv+xmBY15H52z9lWdiolug+6vp6v
   A==;
X-CSE-ConnectionGUID: c42XsoaNQQ2IczV3TSx50w==
X-CSE-MsgGUID: QcrdPWKbS9uJy4Lh/ZYH+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40600725"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40600725"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 22:24:44 -0700
X-CSE-ConnectionGUID: IprcYdh9St6aZNvmvLUb5g==
X-CSE-MsgGUID: J8nbkqLvT9eEUg1fYUM04g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80983768"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Oct 2024 22:24:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4CoS-000Xcy-0T;
	Fri, 25 Oct 2024 05:24:40 +0000
Date: Fri, 25 Oct 2024 13:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 14224/15285] clang: warning: no such include
 directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include'
Message-ID: <202410251301.XRGNaOxp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f34aecb9a655b9ee24dc42a38d3bf4ebcaa9d479
commit: bad535d287c9c1056d99de3666be7da84de4a8fc [14224/15285] Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410251301.XRGNaOxp-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251301.XRGNaOxp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251301.XRGNaOxp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error: 'nbl_product_base.h' file not found
      10 | #include "nbl_product_base.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.h:10:10: fatal error: 'nbl_resource.h' file not found
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.h:10:10: fatal error: 'nbl_resource.h' file not found
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:7:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2243:
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
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:13:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.h:10:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error: 'nbl_product_base.h' file not found
      10 | #include "nbl_product_base.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   5 warnings and 1 error generated.
--
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10:10: fatal error: 'nbl_core.h' file not found
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   1 error generated.
--
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_event.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_event.h:10:10: fatal error: 'nbl_core.h' file not found
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   1 error generated.
--
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.h:10:10: fatal error: 'nbl_core.h' file not found
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   1 error generated.
--
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.h:10:10: fatal error: 'nbl_core.h' file not found
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   1 error generated.
--
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.h:9:10: fatal error: 'nbl_core.h' file not found
       9 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   1 error generated.
--
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.h:10:10: fatal error: 'nbl_core.h' file not found
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   1 error generated.
--
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:7:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2243:
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
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:13:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.h:10:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.h:10:10: fatal error: 'nbl_core.h' file not found
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   5 warnings and 1 error generated.
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
