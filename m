Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE6D1DDCB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8rE3Ocv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697815938; x=1729351938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jAirAcrmD8ghXNNQh5yQdrTIFn4WEAKLWyNbT7nIBDM=;
  b=m8rE3OcvIwYXWBdlBIaFC8yctX7ia8vIFzIG5nz5SZEBFqyNqioq7N9U
   jA8sX73+lkmynYPHxM4txzOPofFadeoJt/ZGI9xBNckMdkgvvNERm7pLT
   WoL4lHosIAUKt/fzSV79fxGw0azQVa6omJwPdAaA/UvMGsAuhPFMyFrvh
   1vDYniO/Tk/Uw3w103gUC5turTGoaqDaNmy9AYpM4yjRebJE2O1hTeN9l
   EcnWZRfYzPuS7gHC71s1a3z64ZTnG0qsgxz0bg4hOglxqZyMXhvlg79em
   qcsxqeJCQ4ZMfR8U551AfgeY4iehSi2cp6QWMqO8jBAUuLVRwSnKwqEVf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="5128875"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5128875"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 08:32:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="827760579"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="827760579"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Oct 2023 08:32:15 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtrTx-0003fq-0Z;
	Fri, 20 Oct 2023 15:32:13 +0000
Date: Fri, 20 Oct 2023 23:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Rongwei Wang <rongwei.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/5] mm/numa: support CONFIG_NUMA_EMU for arm64
Message-ID: <202310202302.gqMV6hPg-lkp@intel.com>
References: <20231012024842.99703-5-rongwei.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012024842.99703-5-rongwei.wang@linux.alibaba.com>

Hi Rongwei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.6-rc6]
[cannot apply to akpm-mm/mm-everything tip/x86/mm next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rongwei-Wang/mm-numa-move-numa-emulation-APIs-into-generic-files/20231017-143037
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231012024842.99703-5-rongwei.wang%40linux.alibaba.com
patch subject: [PATCH RFC 4/5] mm/numa: support CONFIG_NUMA_EMU for arm64
config: x86_64-buildonly-randconfig-002-20231020 (https://download.01.org/0day-ci/archive/20231020/202310202302.gqMV6hPg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310202302.gqMV6hPg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310202302.gqMV6hPg-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                   ^~
   mm/numa.c: In function 'numa_clear_kernel_node_hotplug':
   mm/numa.c:219:37: error: invalid use of undefined type 'struct numa_meminfo'
     219 |         for (i = 0; i < numa_meminfo.nr_blks; i++) {
         |                                     ^
   mm/numa.c:220:54: error: invalid use of undefined type 'struct numa_meminfo'
     220 |                 struct numa_memblk *mb = numa_meminfo.blk + i;
         |                                                      ^
   mm/numa.c:223:43: error: invalid use of undefined type 'struct numa_memblk'
     223 |                 ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
         |                                           ^~
   mm/numa.c:223:54: error: invalid use of undefined type 'struct numa_memblk'
     223 |                 ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
         |                                                      ^~
   mm/numa.c:223:64: error: invalid use of undefined type 'struct numa_memblk'
     223 |                 ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
         |                                                                ^~
   mm/numa.c:223:95: error: invalid use of undefined type 'struct numa_memblk'
     223 |                 ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
         |                                                                                               ^~
   mm/numa.c:251:37: error: invalid use of undefined type 'struct numa_meminfo'
     251 |         for (i = 0; i < numa_meminfo.nr_blks; i++) {
         |                                     ^
   mm/numa.c:252:54: error: invalid use of undefined type 'struct numa_meminfo'
     252 |                 struct numa_memblk *mb = numa_meminfo.blk + i;
         |                                                      ^
   In file included from include/linux/kernel.h:22:
   mm/numa.c:254:35: error: invalid use of undefined type 'struct numa_memblk'
     254 |                 if (!node_isset(mb->nid, reserved_nodemask))
         |                                   ^~
   include/linux/bitops.h:49:32: note: in definition of macro 'bitop'
      49 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/nodemask.h:153:36: note: in expansion of macro 'test_bit'
     153 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/numa.c:254:22: note: in expansion of macro 'node_isset'
     254 |                 if (!node_isset(mb->nid, reserved_nodemask))
         |                      ^~~~~~~~~~
   mm/numa.c:254:35: error: invalid use of undefined type 'struct numa_memblk'
     254 |                 if (!node_isset(mb->nid, reserved_nodemask))
         |                                   ^~
   include/linux/bitops.h:53:20: note: in definition of macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/nodemask.h:153:36: note: in expansion of macro 'test_bit'
     153 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/numa.c:254:22: note: in expansion of macro 'node_isset'
     254 |                 if (!node_isset(mb->nid, reserved_nodemask))
         |                      ^~~~~~~~~~
   mm/numa.c:254:35: error: invalid use of undefined type 'struct numa_memblk'
     254 |                 if (!node_isset(mb->nid, reserved_nodemask))
         |                                   ^~
   include/linux/bitops.h:53:35: note: in definition of macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^~
   include/linux/nodemask.h:153:36: note: in expansion of macro 'test_bit'
     153 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/numa.c:254:22: note: in expansion of macro 'node_isset'
     254 |                 if (!node_isset(mb->nid, reserved_nodemask))
         |                      ^~~~~~~~~~
   mm/numa.c:257:42: error: invalid use of undefined type 'struct numa_memblk'
     257 |                 memblock_clear_hotplug(mb->start, mb->end - mb->start);
         |                                          ^~
   mm/numa.c:257:53: error: invalid use of undefined type 'struct numa_memblk'
     257 |                 memblock_clear_hotplug(mb->start, mb->end - mb->start);
         |                                                     ^~
   mm/numa.c:257:63: error: invalid use of undefined type 'struct numa_memblk'
     257 |                 memblock_clear_hotplug(mb->start, mb->end - mb->start);
         |                                                               ^~
   mm/numa.c: At top level:
   mm/numa.c:261:19: warning: no previous prototype for 'numa_register_memblks' [-Wmissing-prototypes]
     261 | int __weak __init numa_register_memblks(struct numa_meminfo *mi)
         |                   ^~~~~~~~~~~~~~~~~~~~~
   mm/numa.c: In function 'numa_register_memblks':
   mm/numa.c:266:29: error: 'numa_nodes_parsed' undeclared (first use in this function); did you mean 'numa_node_id'?
     266 |         node_possible_map = numa_nodes_parsed;
         |                             ^~~~~~~~~~~~~~~~~
         |                             numa_node_id
   mm/numa.c:271:27: error: invalid use of undefined type 'struct numa_meminfo'
     271 |         for (i = 0; i < mi->nr_blks; i++) {
         |                           ^~
   mm/numa.c:272:45: error: invalid use of undefined type 'struct numa_meminfo'
     272 |                 struct numa_memblk *mb = &mi->blk[i];
         |                                             ^~
   mm/numa.c:273:37: error: invalid use of undefined type 'struct numa_memblk'
     273 |                 memblock_set_node(mb->start, mb->end - mb->start,
         |                                     ^~
   mm/numa.c:273:48: error: invalid use of undefined type 'struct numa_memblk'
     273 |                 memblock_set_node(mb->start, mb->end - mb->start,
         |                                                ^~
   mm/numa.c:273:58: error: invalid use of undefined type 'struct numa_memblk'
     273 |                 memblock_set_node(mb->start, mb->end - mb->start,
         |                                                          ^~
   mm/numa.c:274:55: error: invalid use of undefined type 'struct numa_memblk'
     274 |                                   &memblock.memory, mb->nid);
         |                                                       ^~
   mm/numa.c: At top level:
>> mm/numa.c:305:12: warning: no previous prototype for 'numa_emu_cmdline' [-Wmissing-prototypes]
     305 | int __init numa_emu_cmdline(char *str)
         |            ^~~~~~~~~~~~~~~~
   mm/numa.c:16:21: error: storage size of 'numa_meminfo' isn't known
      16 | struct numa_meminfo numa_meminfo __initdata_or_meminfo;
         |                     ^~~~~~~~~~~~
   mm/numa.c:17:21: error: storage size of 'numa_reserved_meminfo' isn't known
      17 | struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
         |                     ^~~~~~~~~~~~~~~~~~~~~


vim +/numa_emu_cmdline +305 mm/numa.c

   303	
   304	#ifdef CONFIG_NUMA_EMU
 > 305	int __init numa_emu_cmdline(char *str)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
