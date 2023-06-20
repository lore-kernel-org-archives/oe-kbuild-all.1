Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973B31119
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 02:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687227588; x=1718763588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BaV9thFHQdol5gxtLN0Q1jfELy5vFbjpEfVtRGaf3tk=;
  b=GMD+8Ab2NKBL/KdrX0EEhVTRI4EVyONqIW8U+NW/3HJ5O/UXpDBnWY7u
   i4MjcTuBPcp+C+SNKWDKWJPi0l6NTXVXptiW9l3A+l5tV3R0lw7T/AE6F
   nFT3QbVgzpRdB+iTx3p3nNdByDd753Ia+FwyPpl+TlHaYhOvgvDi9KSar
   ZwRgfvyvkNUKYOnWDTLC0RdJ2G8r1x6u+odPKw+iPQhuzlQflzzCZuFoR
   gg+DUqnrfoUd5frq1LaoXWhmcKjtrhCbC2JJqmGpVuPId8SaFb8YLnXOt
   LSgt/1rohzPTXpibRNIMp/pxAUzl0rkmKmx2kaXEUBv/kSg1oFnWdQOvc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="423410786"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="423410786"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 19:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="708086054"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="708086054"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Jun 2023 19:19:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBQy9-0005Mi-1A;
	Tue, 20 Jun 2023 02:19:45 +0000
Date: Tue, 20 Jun 2023 10:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 12728/27674]
 include/trace/hooks/pci.h:15:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202306201034.8RORdh6T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   31e1367ff78eb68e54a2025e9c6601e3fa6c6312
commit: bce9e7942ad39b8ecbbe592e6cae351c34b6991f [12728/27674] ANDROID: PCI/PM: Use usleep_range for d3hot_delay
config: x86_64-randconfig-s021-20230614 (https://download.01.org/0day-ci/archive/20230620/202306201034.8RORdh6T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201034.8RORdh6T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201034.8RORdh6T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/pci.c:1024:13: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1024:21: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1024:31: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1024:39: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1033:35: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1033:54: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1034:19: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1034:37: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1064:23: sparse: sparse: invalid assignment: |=
   drivers/pci/pci.c:1064:23: sparse:    left side has type unsigned short
   drivers/pci/pci.c:1064:23: sparse:    right side has type restricted pci_power_t
   drivers/pci/pci.c:1069:57: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1091:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted pci_power_t [usertype] current_state @@     got int @@
   drivers/pci/pci.c:1091:28: sparse:     expected restricted pci_power_t [usertype] current_state
   drivers/pci/pci.c:1091:28: sparse:     got int
   drivers/pci/pci.c:1140:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted pci_power_t [usertype] current_state @@     got int @@
   drivers/pci/pci.c:1140:36: sparse:     expected restricted pci_power_t [usertype] current_state
   drivers/pci/pci.c:1140:36: sparse:     got int
   drivers/pci/pci.c:1318:13: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1318:21: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1320:18: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1320:26: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1343:13: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1343:22: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1350:46: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1350:54: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:1706:38: sparse: sparse: array of flexible structures
   drivers/pci/pci.c:2279:44: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:2580:61: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:2581:45: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:2747:20: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:2747:38: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:2770:49: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:2770:67: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci.c:4671:13: sparse: sparse: invalid assignment: |=
   drivers/pci/pci.c:4671:13: sparse:    left side has type unsigned short
   drivers/pci/pci.c:4671:13: sparse:    right side has type restricted pci_power_t
   drivers/pci/pci.c:4676:13: sparse: sparse: invalid assignment: |=
   drivers/pci/pci.c:4676:13: sparse:    left side has type unsigned short
   drivers/pci/pci.c:4676:13: sparse:    right side has type restricted pci_power_t
   drivers/pci/pci.c: note: in included file:
>> include/trace/hooks/pci.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/pci.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/pci.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +15 include/trace/hooks/pci.h

     5	
     6	#if !defined(_TRACE_HOOK_PCI_H) || defined(TRACE_HEADER_MULTI_READ)
     7	#define _TRACE_HOOK_PCI_H
     8	#include <linux/tracepoint.h>
     9	#include <trace/hooks/vendor_hooks.h>
    10	/*
    11	 * Following tracepoints are not exported in tracefs and provide a
    12	 * mechanism for vendor modules to hook and extend functionality
    13	 */
    14	
  > 15	DECLARE_RESTRICTED_HOOK(android_rvh_pci_d3_sleep,
    16	             TP_PROTO(struct pci_dev *dev, unsigned int delay, int *err),
    17	             TP_ARGS(dev, delay, err), 1);
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
