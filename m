Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6361D6A8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 03:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717038840; cv=none; b=FNErMf0pz7Gn3iAyBnRUsBDtKfKJFLJ/oA9wMsk4F1iUkbyOoKlYNysLbUwRYU7RbHxJswv7oR6l/GWmh6Ro0M8NW+kVeg8gPi7h9w6MKLtGUp28Og7QDH0+MpjAxjmgQiD+I/QmHUcW3Yw53MGESC+urfhr3mYgzlnOrdt1tG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717038840; c=relaxed/simple;
	bh=dDgvbPv14YUjI/driZ8UIPqksonB4aF5FOpSy1J5YP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UQnNgh7K8rBhBKsEUOS+oqwJLZniaevJ3bO7kiF0iJqAondXPN3JXgL2LmaS/WvE8mZF4cacbBZJbPoNJF+dYbYKsHDaYaCKQ3QnLod2E0nrt2lOIsKY3icv/bIYeWM28ZOpBTiltoSZwDG+tK3c02I/fOweKyY0gtqtnmBGhvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADtd1bJO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADtd1bJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717038839; x=1748574839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDgvbPv14YUjI/driZ8UIPqksonB4aF5FOpSy1J5YP4=;
  b=ADtd1bJOXc7zkvA0WaNHgI0FI3Z+piYtChfR7ujg5AcXwDV82GpqoFWi
   ZgxY2rW102o77DMV9931RHHl3S/wmmf2aZIzLuYF0ouGQh/0vSP1GIhuC
   rWvYueYxDXTgaeDWv2BZfumCLkDDpUrS5zGw//kZPbjuOM+ZiyxaQ5N8r
   HB4ykY+cQ+BTdchetQPx+2YzctXba7JNIPuu5eyxRf1WqFkpOw4r0oBkv
   sgnXQJL1vUL+2ph6YOeutQgUM1ooc3dbax5nn2KiYtaU81k8C7JwzLyHp
   Cm/pf7ALkcqZl6fDDbnDEVOV3w7quNWXWozX/y4VWoOs/FB6Y1HoZitgO
   A==;
X-CSE-ConnectionGUID: 4YRagDNuR7ec4KOS0feiYA==
X-CSE-MsgGUID: Aq6xqrj7Szqkhp0WoYPV6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31016315"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="31016315"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 20:13:58 -0700
X-CSE-ConnectionGUID: aPy2JTnzTwm/v83pmtScvA==
X-CSE-MsgGUID: q6ATvhJqQWufrfRMvzTEwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="66864278"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2024 20:13:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCWEl-000EVp-0B;
	Thu, 30 May 2024 03:13:55 +0000
Date: Thu, 30 May 2024 11:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:struct-device 27/27] drivers/base/node.c:37:34: error:
 invalid operands to binary != (have 'const struct bus_type *' and 'struct
 bus_type')
Message-ID: <202405301131.Jg5JUiNs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux struct-device
head:   6a39e6660e65ae3609a0114b7a5f458cbc5b3602
commit: 6a39e6660e65ae3609a0114b7a5f458cbc5b3602 [27/27] memory-node-dbg
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240530/202405301131.Jg5JUiNs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301131.Jg5JUiNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301131.Jg5JUiNs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:24,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from arch/arm64/include/asm/stat.h:12,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:13,
                    from drivers/base/node.c:6:
   drivers/base/node.c: In function 'to_node':
>> drivers/base/node.c:37:34: error: invalid operands to binary != (have 'const struct bus_type *' and 'struct bus_type')
      37 |         WARN_ON_ONCE(device->bus != node_subsys);
         |                      ~~~~~~~~~~~ ^~
         |                            |
         |                            const struct bus_type *
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~


vim +37 drivers/base/node.c

   > 6	#include <linux/module.h>
     7	#include <linux/init.h>
     8	#include <linux/mm.h>
     9	#include <linux/memory.h>
    10	#include <linux/vmstat.h>
    11	#include <linux/notifier.h>
    12	#include <linux/node.h>
    13	#include <linux/hugetlb.h>
    14	#include <linux/compaction.h>
    15	#include <linux/cpumask.h>
    16	#include <linux/topology.h>
    17	#include <linux/nodemask.h>
    18	#include <linux/cpu.h>
    19	#include <linux/device.h>
    20	#include <linux/pm_runtime.h>
    21	#include <linux/swap.h>
    22	#include <linux/slab.h>
    23	
    24	static u32 node_get_id(struct device *dev)
    25	{
    26		return to_node(dev)->id;
    27	}
    28	
    29	static const struct bus_type node_subsys = {
    30		.name = "node",
    31		.dev_name = "node",
    32		.get_id = node_get_id,
    33	};
    34	
    35	struct node *to_node(struct device *device)
    36	{
  > 37		WARN_ON_ONCE(device->bus != node_subsys);
    38	
    39		return container_of(device, struct node, dev);
    40	}
    41	EXPORT_SYMBOL_GPL(to_node);
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
