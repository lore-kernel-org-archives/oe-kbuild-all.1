Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11623101EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694785386; x=1726321386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yB4NDyZvPHZxM4B5e86DhiucI34THqI7ZLSwnT1Ido=;
  b=KO49ajMtS166tA46P3FAr5iu4BX8uwgDZWBIhSjuKcN4kEqZZjIgsncX
   NI/EKU7WV8IxutSIj1qgAiRL1QJ8lXC5n/bwpah6XUVywHJxDaPC5pCE6
   uVr5OyEc+c1R7OlXhOW1Kw6uNG49wS7gv2m0BKhmUjhLTutvZtE0sSVxE
   np2oOWpwIEcWH17+1BdodiKy1XkWSXnedfviF0IipfMEEe0iu9wNo9ATc
   vhz0eGS6KQzxYfVSpwoH4X3eNjo6jehGw11pty9GSrPNa3I/e8MFyUHCi
   OuthTOULCM6RwSVZjZJX41hhvsL8hXVuFP8Ujn1A5FNXq2f0rjAi7TqO9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="369566529"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="369566529"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 06:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="868708134"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="868708134"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Sep 2023 06:43:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh964-00031K-0d;
	Fri, 15 Sep 2023 13:43:00 +0000
Date: Fri, 15 Sep 2023 21:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 12627/29482]
 include/trace/hooks/pci.h:15:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202309152153.ChFPFuxJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   8bc23569cc92e892b0b7fef258b6643842dfc492
commit: bce9e7942ad39b8ecbbe592e6cae351c34b6991f [12627/29482] ANDROID: PCI/PM: Use usleep_range for d3hot_delay
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230915/202309152153.ChFPFuxJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309152153.ChFPFuxJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309152153.ChFPFuxJ-lkp@intel.com/

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
