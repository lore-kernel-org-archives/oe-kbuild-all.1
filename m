Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA0F22D4F2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 05:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747804221; cv=none; b=TLJcOkjB0f3/GGkK2P5nSVgrBgXIIy7ZLr8AxcGWUctzQydBquHa/PpsylQVy1JH4NOJUVUppOXtyXxPtN1ekSur8IL/Yrgifz7CGXvBLWiBSjK4hWfg2oHKD+ffKenCZbfBqcV0U32tY4MMnMw4YaCrwn/9+zMlR8k05uyIsro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747804221; c=relaxed/simple;
	bh=6ANwvXRToyj74uoL+RkehG6w9CESGWalXya3wnNzy84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ip+IxgGIlVqSy9iF5lUcAen0q4iuGD0llogUJ4u67SUdb3PN4taekHwXg8NN97sVsuFDOngMy0U2pcgbHGvAkeKxdcawR4SUEToUivgc0awhVvYi56fIiBoarMVaka3fUsqNq2Ll3DkaguU3kV95qtL044CzAKg9BCHWMus7cU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSuaCidq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSuaCidq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747804219; x=1779340219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ANwvXRToyj74uoL+RkehG6w9CESGWalXya3wnNzy84=;
  b=BSuaCidqX3B9PSFtymp2f6yMIYmLSS+u7P8WS7B1h5GKm6U/hR6xNqbG
   05/Rqv2KiUxrX9tiIeIh+84TVMwsHCTnsWvMacTRSUWVxCKt4qw0L5X99
   nu4bPlSbNan2zrxKGPhVY2q1tveNfXjnMKsNigCXvuxMffDpbsWe+Khup
   OZSCN2fWXdhoVmEpB1T3V2HXRC5tQDKPSzyxV0eWdk9VYscAZugqatvTV
   zDKsGPYUezYgTtcoEbZ9uZRTIU8RO2SzUTqYbnpLNZWFxztUK/DyCxtb3
   sKYz31PEADoE3jQKtYunsSgLgx8gR/f9+E+WGu9WRTjzHSGotj4N0glK7
   w==;
X-CSE-ConnectionGUID: ZYkhto2YRHa+KknsSoFdfQ==
X-CSE-MsgGUID: cIUYITIqSzqv66Vc+dlQiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="59994539"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="59994539"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 22:10:19 -0700
X-CSE-ConnectionGUID: su1vvr4jRSWcVsNfQ/gMJQ==
X-CSE-MsgGUID: NB74JGMHQZWzNNzhgNRreg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139806850"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 May 2025 22:10:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHbiZ-000Nt6-0s;
	Wed, 21 May 2025 05:10:15 +0000
Date: Wed, 21 May 2025 13:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiajingze <xiajingze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2263/2263] drivers/message/fusion/mptbase.o:
 warning: objtool: mpt_interrupt+0x1593: unreachable instruction
Message-ID: <202505211254.LgwpVTzi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   60b649bb3c3ac2d6c073ccc63fa68c3166183c34
commit: 241ad43fe7e9c24d5ba4cdd1ec22e731cdd22d14 [2263/2263] Compiler: Add clang's PGO support for kernel.
config: x86_64-randconfig-r063-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211254.LgwpVTzi-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211254.LgwpVTzi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211254.LgwpVTzi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/message/fusion/mptbase.c:56:
   In file included from include/linux/pci.h:1666:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2235:
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
   5 warnings generated.
>> drivers/message/fusion/mptbase.o: warning: objtool: mpt_interrupt+0x1593: unreachable instruction

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
